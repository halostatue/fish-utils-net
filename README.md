# halostatue/fish-utils-net

Network and SSH utility functions for [fish shell][]. Most have been ported
from my zsh dotfiles or from other dotfiles found over the years.

[![Version][]][]

## Installation

Install with [Fisher][] (recommended):

```fish
fisher add halostatue/fish-utils-net # fisher 3.x
fisher install halostatue/fish-utils-net # fisher 4.0+
```

<details>
<summary>Not using a package manager?</summary>

---

Copy `functions/*.fish` to your fish configuration directory preserving the
directory structure.
</details>

### System Requirements

- [fish][] 3.0+

## Functions

### addr

Shows IPv4 addresses for the given interface or all interfaces.

```fish
addr
```

### certp

Prints the TLS certificate for the domain provided using OpenSSL.

### def

Retreives the definition for a word from `dict.org`.

```fish
def dictionary
```

### dig1, diga

Shorthand responses from dig.

```fish
dig1 google.com
diga google.com
```

### digip

Digs my public IP address.

```fish
digip
```

### man.cx

Open one or more manpages at `man.cx`.

```fish
man.cx sshd_config
man.cx 5 ssh_config
```

### ports

Shows processes listening on ports. Options are passed to `lsof`.

```fish
ports
```

## run_from_ssh

Returns true if the current shell was run from SSH.

## ssh-copy-id

Copies one or more SSH public key file identities to the
`~/.ssh/authorized_keys` file of a remote server. This is a fish shell
translation of the same script available for bash or zsh.

## sshfp

Create the text required for SSHFP DNS records (SSH fingerprint) for a host.

## sshnew

Connect to an SSH server as a new connection (`StrictHostKeyChecking` is
off). This should only be used on trusted servers as it skips host key
checking. All parameters are passed to `ssh`.

## sshtmp, sftptmp, scptmp

Connect to an SSH server as a temporary connection (`StrictHostKeyChecking`
is off and the host is not written to the SSH hosts file). This should only
be used on trusted transient servers (such as CI debug servers) as it skips
host key checking. All parameters are passed to `ssh`, `sftp`, or `scp` as
appropriate.

## License

[MIT](LICENCE.md)

[fish shell]: https://fishshell.com "friendly interactive shell"
[Version]: https://img.shields.io/github/tag/halostatue/fish-utils-net.svg?label=Version
[![Version][]]: https://github.com/halostatue/fish-utils-net/releases
[Fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
