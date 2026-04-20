# Toolchain

Every tool the build depends on, with version, source, and platform notes.

## The Matrix

| Tool          | Version      | Source                                                         | Notes                                                    |
|---------------|--------------|----------------------------------------------------------------|----------------------------------------------------------|
| `mwccarm`     | `2.0/sp1p5`  | Metrowerks CodeWarrior                                         | decomp.me id: `mwcc_30_131`                              |
| `mwldarm`     | `2.0/sp1p5`  | Metrowerks CodeWarrior                                         | ships alongside `mwccarm`                                |
| `dsd`         | `v0.11.0`    | [AetiasHax/ds-decomp](https://github.com/AetiasHax/ds-decomp)  | native macOS arm64 + Linux x86_64 + Windows builds       |
| `objdiff-cli` | `v2.7.1`     | [encounter/objdiff](https://github.com/encounter/objdiff)      | macOS/Linux/Windows, x86_64 and arm64                    |
| `wibo`        | `0.6.16`     | [decompals/wibo](https://github.com/decompals/wibo)            | Linux-only PE loader for the Win32 toolchain             |
| `wine`        | stable       | [winehq.org](https://www.winehq.org/)                          | macOS equivalent of `wibo`; `brew install --cask wine-stable` |
| `ninja`       | any recent   | [ninja-build.org](https://ninja-build.org/)                    | build driver                                             |
| Python        | 3.11+        | [python.org](https://www.python.org/)                          | match-statements & PEP 604 unions                        |

Everything except `ninja`, `python`, `wine`, and the baserom is
downloaded automatically the first time you run `ninja`.

## Platform-Specific Notes

### macOS (Apple Silicon)

- `wine` from Homebrew (`brew install --cask wine-stable`) is the
  Win32 runner. `configure.py` auto-selects `wine` from `PATH` on Darwin.
- `dsd-macos-arm64` and `objdiff-cli-macos-arm64` are downloaded natively.
- `get_platform.py` was patched to return `Darwin → macos` and
  `arm64 → arm64` (the dqix template masqueraded both as Linux/x86_64).

### Linux

- `wibo` is auto-downloaded and runs the Win32 compiler — no `wine`
  required.
- All native tools (`dsd`, `objdiff-cli`) have linux-x86_64 builds.

### Windows

- `mwccarm.exe` / `mwldarm.exe` run natively — no runner needed.
- Native `dsd-windows` and `objdiff-cli-windows` builds are fetched.

## Compiler Version Details

> [!NOTE]
> `2.0/sp1p5` is the DS-era default and dqix's choice, but may need
> revisiting after the first objdiff attempt. If a swath of functions
> are all off by the same handful of instruction patterns, the
> service-pack revision is the usual suspect.

The `mwcc_30_131` id is the one to use on [decomp.me](https://decomp.me/)
when pasting scratches.

## Producing a Scratch

```bash
ninja build/usa/path/to/file.ctx.c       # or .ctx.cpp for C++
```

Produces a preprocessed context suitable for pasting into decomp.me
alongside the extracted assembly. See [Matching Workflow](Matching-Workflow#scratches)
for how scratches fit into the loop.
