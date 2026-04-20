# libs/runtime/

CodeWarrior runtime / CRT glue. Not NitroSDK and not MSL libc — this is
the boilerplate `mwccarm` + `mwldarm` insert around every user program:
the entrypoint, autoload trampolines, static initializer shims, ctor/dtor
lists, exception scaffolding.

## Why separate from `libs/nitro/`

The NitroSDK is what the game calls to do game things (graphics, input,
filesystem). The CodeWarrior runtime is what glues object files together
into an executable — the stuff the compiler emits without you asking.
They are separate concerns and historically ship as separate libraries
in Nintendo's own build (`nitro.a` vs `libcw.a` / `msl.a`).

## What's here (and what's next)

Header-only for now. Nothing checked in as `.c` — implementations get
written one function at a time as they're matched against the baserom.

- `include/runtime/runtime.h` — declarations for the three CodeWarrior
  entry points dsd already named in `config/eur/arm9/symbols.txt`:
  `Entry` (at `0x02000800`, size `0x13c`), `main` (`0x02000c34`, `0x10`),
  and `AutoloadCallback` (`0x02000a74`, `0x4`, just a `bx lr`).

## Static initializers — the 51-function bulk opportunity

A survey of every `config/eur/arm9/**/symbols.txt` turned up **51
`__sinit_*` functions** across 15 of the 24 overlays:

| Overlay  | Count |
|----------|-------|
| ov002    | 5     |
| ov003    | 1     |
| ov004    | 1     |
| ov005    | 5     |
| ov006    | 11    |
| ov007    | 2     |
| ov009    | 3     |
| ov010    | 3     |
| ov011    | 1     |
| ov014    | 3     |
| ov015    | 2     |
| ov016    | 5     |
| ov017    | 4     |
| ov019    | 3     |
| ov021    | 2     |
| **Total**| **51**|

All are ARM mode. Most are exactly **`0x2c` bytes** (44); the outliers
are `0x04` (two, in ov002 — empty `bx lr`), `0x18`, `0x34`, `0x3c`, and
a pair of `0x48` in ov010.

**Why they matter:** CodeWarrior emits one `__sinit_<obj>_<addr>` per
translation unit that has a non-trivial static/global initializer. The
body is nearly identical across all 51: save `lr`, call a fixed SDK
hook (`nn_hook_ctor_list` / `__init_registers` / similar), restore and
return. If we can match **one** of them cleanly against objdiff, the
other 50 fall in a handful of follow-up PRs — same pattern, different
address suffix.

Good first target: a `0x2c`-byte `__sinit` in an overlay that already
passes `dsd check modules` (so layout drift isn't in play). ov005's
`__sinit_ov005_021b16e4` or ov009's `__sinit_ov009_021ad868` both fit.

The actual template (what the bytes decode to) isn't captured here —
that belongs in the matched C source, not in scaffolding. Produce it
from `objdiff-cli` diffing a first attempt, iterate, land the pattern.

## What's deliberately NOT here yet

- **`nn_hook_ctor_list` / ctor-list globals** — not named in symbols.txt
  yet. Dsd sees them as raw bytes. Scaffolding their declarations before
  we confirm the names would just be guessing.
- **MSL libc / math (`memcpy`, `memset`, `sin`, `cos`, `sqrt`…)** — none
  are currently labeled in `symbols.txt`. Those live under a future
  `libs/msl/` when any of them surface.
- **NitroSDK modules (`OS_*`, `GX_*`, `FX_*`, `MI_*`, `FS_*`, `PAD_*`,
  `SND_*`, …)** — same story: **zero** are named in `symbols.txt` right
  now. They absolutely exist in the binary — the game is full of them —
  but `dsd init` didn't label any. Expect them to be uncovered one at a
  time as their callsites get decomp'd, at which point headers land
  under `libs/nitro/include/nitro/<module>.h`.

## References

- [NitroSDK-Decomp](https://github.com/Arisotura/NitroSDK-Decomp)
  — ctor-list + __sinit patterns in a sibling decomp.
- [pokeplatinum / pokediamond](https://github.com/pret/pokediamond)
  — CodeWarrior runtime for the same toolchain vintage, useful for
  cross-referencing how they structured their `libs/`.
