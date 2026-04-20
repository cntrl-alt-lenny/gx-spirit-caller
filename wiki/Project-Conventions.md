# Project Conventions

Rules of the road — file layout, language choice, symbol naming, and
what not to commit.

## Language

- **Default:** C. Use `.c` files.
- **C++ opt-in:** name the file `.cpp` — `configure.py` passes
  `-lang=c++` automatically.

## Source Layout

```
.
├── orig/                # user-supplied baseroms (gitignored)
├── extract/             # dsd rom extract output (gitignored)
├── config/<ver>/        # dsd init output: delinks, relocs, symbols
├── src/                 # decompiled game code
│   ├── main/            # arm9 main module
│   ├── overlay000/      # code that lives in overlay 0
│   ├── overlay001/      # …
│   └── ...
├── include/             # shared headers
├── libs/                # vendored / SDK code (NitroSDK, MSL, runtime)
│   └── <libname>/
│       └── include/     # auto-added to -i by configure.py
├── tools/
│   ├── configure.py     # generates build.ninja
│   ├── progress.py      # prints % matched
│   └── ...              # small helpers + vendored ninja_syntax
├── build/               # ninja output (gitignored)
├── wiki/                # wiki source (synced to GitHub wiki on merge)
├── CLAUDE.md            # conventions & workflow for AI collaborators
└── README.md
```

### Where does my code go?

| Kind of code                        | Location                   |
|-------------------------------------|----------------------------|
| arm9 main module                    | `src/main/`                |
| Code in overlay _N_                 | `src/overlay<NNN>/`        |
| NitroSDK / MSL / runtime            | `libs/<libname>/`          |
| Shared headers used across the tree | `include/`                 |
| Lib-private headers                 | `libs/<libname>/include/`  |

## Symbol Naming

- **Convention:** `ModuleName_FunctionName` (e.g. `Duel_DrawCard`,
  `DuelState_ShuffleDeck`).
- Rename symbols in `config/<ver>/**/symbols.txt`, **never** by
  hand-editing `arm9/config.yaml`.
- Unmatched functions start as `func_020b3a7c` — replace with the real
  name the moment the function matches.

## What Not to Commit

`.gitignore` already covers these, but as a reminder:

- `*.nds` — ROMs, extracted or built
- BIOS dumps
- `extract/` — dsd's extraction output
- `build/` — ninja's output
- Downloaded tool binaries (under `tools/bin/` or similar)

## Documentation

- **Code comments:** default to none. Only add a comment when the
  _why_ is non-obvious (a hidden constraint, a workaround for a bug,
  behavior that would surprise a reader). Don't explain what
  well-named identifiers already convey.
- **Wiki:** edit the markdown in [`wiki/`](https://github.com/cntrl-alt-lenny/gx-spirit-caller/tree/main/wiki)
  and submit a PR. The sync workflow pushes merged changes to the live
  wiki. **Do not edit the wiki UI directly** — your changes will be
  overwritten.
- **CLAUDE.md / AGENTS.md:** onboarding notes for AI collaborators.
  Keep them tight; put long-form prose in this wiki.

## Build Conventions

- `configure.py` takes the version as a positional arg: `usa`, `eur`,
  or `jpn`. All three can coexist in `config/<ver>/` and `build/<ver>/`.
- SHA-1 is verified at configure time. A wrong dump fails before any
  build steps run.
- `ninja sha1` is the only project-level pass/fail test.
