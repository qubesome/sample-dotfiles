# sample-dotfiles

This repository contains examples of Qubesome profiles, covering window
managers: `i3` and `awesomewm`.

## Quick Start
### Install

```
go install https://github.com/qubesome/cli@latest
```

### Start Profile

Start one of the two profiles (`i3` or `awesome`):
```
qubesome start -git https://github.com/qubesome/sample-dotfiles <PROFILE>
```

> **_NOTE:_** Press `Ctrl`+`Shift` to key and mouse grab in and out of
the Qubesome profiles.

> **_NOTE 2:_** Each profile has a different `display` set in [qubesome.config](qubesome.config),
therefore their clipboards are isolated between themselves and the host.
To transfer clipboards between profiles use `qubesome clipboard`.

## Usage

Check whether dependency requirements are met:
```
qubesome deps show
```

Use a local copy, and if not found fallback to a fresh clone:
```
qubesome start -git https://github.com/qubesome/sample-dotfiles -local <local_git_path> <profile>
```

Copy clipboard from host to the i3 profile:
```
qubesome clipboard --from-host i3
```

For more information on Qubesome usage, please refer to [qubesome/cli](https://github.com/qubesome/cli).

## Themes

The theme dotfiles used for these examples are based of:

### i3

https://github.com/Keyitdev/dotfiles/tree/v3

### awesome
https://github.com/WillPower3309/awesome-dotfiles

## License

This repository is licensed under [Apache 2.0](LICENSE). All themes used
and their configurations have a license of their own, which can be found
at their respective Git repositories.
