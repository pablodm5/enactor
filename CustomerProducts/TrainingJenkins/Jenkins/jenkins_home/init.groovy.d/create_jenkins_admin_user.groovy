/* creates Jenkins admin user account using JENKINS_ADMIN_USR,JENKINS_ADMIN_PWD runtime parameters */

import jenkins.model.*
import hudson.security.*


def env = System.getenv()
def adminUsr = env['JENKINS_ADMIN_USR']
def adminPwd = env['JENKINS_ADMIN_PWD']

println("Setting Jenkins admin credentials to username: "+ adminUsr )



def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(adminUsr,adminPwd)
instance.setSecurityRealm(hudsonRealm)

def strategy = new GlobalMatrixAuthorizationStrategy()
strategy.add(Jenkins.ADMINISTER, adminUsr)
instance.setAuthorizationStrategy(strategy)

instance.save()
