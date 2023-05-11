#!/bin/bash

function readArg {
    secret=$1
    if [[ $secret == "-s" ]] ; then 
        shift
    fi

    arg=$1
    prompt=$2
    value=$3 
    
    if [[ -z $value ]] ; then
        if [[ $secret == "-s" ]] ; then
            read -s -p "$prompt" value
            echo
        else
            read -p "$prompt" value
        fi
    fi

    eval "export $arg=$value"
}

readArg platformVersion "Platform Version: " $1 ; shift
readArg dockerVersion "Docker Version: " $1 ; shift
readArg configPath "Path to configuration in SVN: " $1 ; shift
#readArg adUsername "AD Username: " $1 ; shift
#readArg -s adPassword "AD Password: " $1 ; shift

if [[ $configPath == "standard" ]] ; then
    export configPath="/svn/dev/Configuration/StandardConfiguration/trunk/Configuration"
fi

export branchName=$platformVersion
if [[ $branchName != "trunk" ]] ; then
    branchName="branches/${platformVersion}"
fi

templateFileList=(
    ./externals.txt
    ./GeneralRuntimeDependencies/pom.xml
    ./Docker/stacks/docker-compose.yml
)

for templateFile in ${templateFileList[@]} ; do
    cat ${templateFile} | envsubst >${templateFile}.tmp
    mv ${templateFile}.tmp ${templateFile}
done

svn propset svn:externals . -F ./externals.txt >/dev/null

echo "Versions have been updated and svn:externals is now set"
echo "Run 'svn update' to finish the checkout"
