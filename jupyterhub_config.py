c.Spawner.notebook_dir = '~/notebook'
c.Authenticator.admin_users = {'testadmin'}
c.JupyterHub.authenticator_class = 'nativeauthenticator.NativeAuthenticator'
import os, nativeauthenticator
c.JupyterHub.template_paths = [f"{os.path.dirname(nativeauthenticator.__file__)}/templates/"]

import pwd, subprocess
def pre_spawn_hook(spawner):
    username = spawner.user.name
    try:
        pwd.getpwnam(username)
    except KeyError:
        subprocess.check_call(['sh', '/srv/jupyterhub/bootstrap.sh', username])

c.Spawner.pre_spawn_hook = pre_spawn_hook
