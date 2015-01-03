# site.pp

# The filebucket option allows for file backups to the server
#
#   $ puppet filebucket backup /etc/passwd
#   /etc/passwd: 429b225650b912a2ee067b0a4cf1e949
#   $ puppet filebucket get 429b225650b912a2ee067b0a4cf1e949
#   $ puppet filebucket restore /tmp/passwd 429b225650b912a2ee067b0a4cf1e949
#
# See 'puppet help filebucket'
# Defaults to 'server => 'puppet''
filebucket { main: server => 'puppet.corp.guest' }


# Set global defaults - including backing up all files to the main
# filebucket and adds a global path
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

node default {
  include ntp
}
