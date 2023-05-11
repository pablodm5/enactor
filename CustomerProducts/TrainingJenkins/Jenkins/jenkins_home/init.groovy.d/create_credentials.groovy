/* creates Jenkins credentials using runtime parameters */

import jenkins.model.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*

def env = System.getenv()



def domain = Domain.global()
def store = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

/* setup AD credentials */
def adUsr = env['AD_USR']
def adPwd = env['AD_PWD']
println("Setting Active directory credentials to username: "+ adUsr )
def adCredentials=['username': adUsr, 'password':adPwd, 'description':'AD credentials']
def adUser = new UsernamePasswordCredentialsImpl(CredentialsScope.GLOBAL, '72771537-75b6-4838-a194-752f342c71ae', adCredentials.description, adCredentials.username, adCredentials.password)
store.addCredentials(domain, adUser)

/* setup Azure OS credentials */
def azureOSUsr = env['AZURE_VM_OS_USR']
def azureOSPwd = env['AZURE_VM_OS_PWD']
if(azureOSUsr.length() > 0 && azureOSPwd.length() > 0 ){
println("Setting remote server's OS credentials  to username: "+ azureOSUsr )
def azureOSCredentials=['username': azureOSUsr, 'password':azureOSPwd, 'description':'Remote server OS credentials']
def azureOSUser = new UsernamePasswordCredentialsImpl(CredentialsScope.GLOBAL, '4833fbbc-bccd-4823-9204-6ecebb484042', azureOSCredentials.description, azureOSCredentials.username, azureOSCredentials.password)
store.addCredentials(domain, azureOSUser)
}

