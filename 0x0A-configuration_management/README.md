path
(Namevar: If omitted, this attribute’s value defaults to the resource’s title.)

The path to the file to manage. Must be fully qualified.

On Windows, the path should include the drive letter and should use / as the separator character (rather than \\).

(↑ Back to file attributes)

ensure
(Property: This attribute represents concrete state on the target system.)

Whether the file should exist, and if so what kind of file it should be. Possible values are present, absent, file, directory, and link.

present accepts any form of file existence, and creates a normal file if the file is missing. (The file will have no content unless the content or source attribute is used.)
absent ensures the file doesn’t exist, and deletes it if necessary.
file ensures it’s a normal file, and enables use of the content or source attribute.
directory ensures it’s a directory, and enables use of the source, recurse, recurselimit, ignore, and purge attributes.
link ensures the file is a symlink, and requires that you also set the target attribute. Symlinks are supported on all Posix systems and on Windows Vista / 2008 and higher. On Windows, managing symlinks requires Puppet agent’s user account to have the “Create Symbolic Links” privilege; this can be configured in the “User Rights Assignment” section in the Windows policy editor. By default, Puppet agent runs as the Administrator account, which has this privilege.
Puppet avoids destroying directories unless the force attribute is set to true. This means that if a file is currently a directory, setting ensure to anything but directory or present will cause Puppet to skip managing the resource and log either a notice or an error.

There is one other non-standard value for ensure. If you specify the path to another file as the ensure value, it is equivalent to specifying link and using that path as the target:

# Equivalent resources:

file { '/etc/inetd.conf':
  ensure => '/etc/inet/inetd.conf',
}

file { '/etc/inetd.conf':
  ensure => link,
  target => '/etc/inet/inetd.conf',
}
However, we recommend using link and target explicitly, since this behavior can be harder to read and is deprecated as of Puppet 4.3.0.

Valid values are absent (also called false), file, present, directory, link. Values can match /./.

(↑ Back to file attributes)

backup
Whether (and how) file content should be backed up before being replaced. This attribute works best as a resource default in the site manifest (File { backup => main }), so it can affect all file resources.

If set to false, file content won’t be backed up.
If set to a string beginning with ., such as .puppet-bak, Puppet will use copy the file in the same directory with that value as the extension of the backup. (A value of true is a synonym for .puppet-bak.)
If set to any other string, Puppet will try to back up to a filebucket with that title. See the filebucket resource type for more details. (This is the preferred method for backup, since it can be centralized and queried.)
Default value: puppet, which backs up to a filebucket of the same name. (Puppet automatically creates a local filebucket named puppet if one doesn’t already exist.)

Backing up to a local filebucket isn’t particularly useful. If you want to make organized use of backups, you will generally want to use the puppet master server’s filebucket service. This requires declaring a filebucket resource and a resource default for the backup attribute in site.pp:
