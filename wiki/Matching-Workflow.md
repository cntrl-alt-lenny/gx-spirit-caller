# Matching Workflow

The inner loop that turns extracted assembly into matching C.

## The Pipeline

```
  +-------------+     dsd rom         +------------+     dsd init      +-----------+
  | orig/*.nds  |  ----extract---->   | extract/   |  --------------> | config/   |
  +-------------+                     +------------+                   +-----------+
                                            |                                |
                                            | dsd delink                     |
                                            v                                |
                                      +------------+                         |
                                      |  .o files  |                         |
                                      +------------+                         |
                                            |                                |
                                src/*.c ----+                                |
                                libs/*.c ---+                                |
                                            |                                |
                                   mwccarm compile                           |
                                            |                                |
                                            v                                |
                                      mwldarm link                           |
                                            |                                |
                                            v                                |
                                      +-------------+    dsd rom       +-----+------+
                                      |  arm9.o     |  ----build-->   |  built .nds |
                                      +-------------+                  +------------+
                                                                              |
                                                                              v
                                                                        sha1 == baserom?
```

## Commands

```
edit src/foo.c
 │
 ▼
ninja                 # compile + link + rebuild ROM
 │
 ▼
ninja objdiff         # regenerate per-unit diff database
ninja report          # aggregate into build/usa/report.json
python tools/progress.py
 │
 ▼
ninja check           # dsd's module + symbol consistency checks
ninja sha1            # final gate: byte-identical ROM
```

## The Inner Loop

> A function is **matched** when objdiff shows it identical to the
> original `.o` produced by `dsd delink`.

1. **Pick** an unmatched function from `config/<ver>/**/symbols.txt`.
2. **Write** a C version in `src/…` (or `libs/…` for SDK code).
3. **Rebuild** — `ninja` → `ninja objdiff` → open the objdiff TUI/GUI
   against the generated `objdiff.json` to see the diff.
4. **Iterate** until 100% matched.
5. **Rename** the symbol in `symbols.txt` from `func_02001234` to its
   real name once it matches.
6. **Commit** and move on.

## Scratches

When a function is stubborn and you want second opinions:

```bash
ninja build/usa/path/to/file.ctx.c       # or .ctx.cpp
```

This produces a preprocessed context suitable for pasting into
[decomp.me](https://decomp.me/) alongside the extracted assembly.
Use compiler id `mwcc_30_131`.

## The Only Test That Matters

```bash
ninja sha1
```

If the rebuilt ROM hashes equal to the baserom, every function is
matched. Everything else (`ninja check`, `ninja objdiff`, per-module
checksums) is a stepping stone toward that single green check.

## Progress Tracking

```bash
python tools/progress.py            # human-readable table
ninja heatmap                       # regenerate assets/progress-heatmap.svg
```

`progress.py` reads `build/<ver>/report.json` once `ninja report` has
run. Before that, it falls back to counting `function` entries in
every `symbols.txt` so the denominator is non-zero from day one.

Commit the updated `assets/progress-heatmap.svg` alongside your code
change so the README badge stays current.
