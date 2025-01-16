# halostatue/fish-utils-net Changelog

## 2.0.0 / 2025-01-16

- Fixed several bugs in `addr`, `man.cx`
- Updated `run_from_ssh` to use `$fish_pid` instead of the deprecated `%self`
  and use `string match` instead of `grep`.
- Simplified `sshfp` with `string` functions.
- Removed `digall`, `digip`.
- Renamed `scptmp` to `tmpscp`; `sftptmp` to `tmpsftp`; `sshnew` to `newssh`;
  `sshtmp` to `tmpssh`.

## 1.1.1 / 2021-04-04

- Fixed a bug in `ssh-copy-id`

## 1.1.0 / 2020-11-29

- Updated instructions to work with Fisher 4.
- `addr` will now return both local and remote IP addresses and IPv6 addresses.
- `connections` now verifies that a port has been provided
- `diga` now verifies that a hostname has been provided
- `digip` has been deprecated and integrated into `addr`.

## 1.0.0 / 2020-06-14

- Create halostatue/fish-utils-net from halostatue/fish-utils.
