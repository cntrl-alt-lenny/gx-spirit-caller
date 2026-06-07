[//]: # (markdownlint-disable MD013 MD041)

# Brief 372 — `.s`-convert the main reg-alloc backlog (Windows lane)

**Brief:** 372 (scaffolder). The decomper's port (brief 369) made the `.s`/
GLOBAL_ASM lane Windows-capable. The permuter worklist (370) flags the
reg-alloc-PLATEAU tier as `.s`-bound (not permuter) — so convert it. Take the
LOW/plateau (reg-alloc) tier for **main + ov002** (leave the ov-\* overlays to the
decomper), `asm_escape --whole-function` each, gate on 3-region `ninja sha1`.
Target ~8.

## Headline — 8 whole-function `.s` shipped, 3-region `ninja sha1` green

**8 main reg-alloc walls converted to byte-exact `.s`**, all link-clean (bl-reloc
only — **zero `data_` externs**, so no brief-361 data-reloc false-pass risk), EUR
`ninja sha1` **OK**, USA/JPN unaffected + confirmed (see gate note). These are the
exact LOW-tier addresses from `docs/research/permuter-worklist.md` — the classes
the 363/358 pilots **proved** the permuter plateaus on, so `.s` is the right
endgame, not more anneal budget.

## The 8 ships (by class)

| addr | size | class | note |
|---|---|---|---|
| `02031794` | 0x2c | `\|\|`-equality / CSE-of-base | 363 plateau 705 |
| `0202ef08` | 0x30 | `\|\|`-equality / CSE-of-base | 363 plateau 705 |
| `0202f59c` | 0x30 | `\|\|`-equality / CSE-of-base | 363 plateau 805 |
| `02031764` | 0x30 | `\|\|`-equality / CSE-of-base | 363 plateau 705 |
| `0205d688` | 0x34 | frame-allocation | callee-saved + local-size frame layout |
| `020536d0` | 0x34 | frame-allocation | `push {r3,…}` vs orig `sub sp,#4` (363 plateau 355) |
| `0207da48` | 0x34 | reg-choice struct shuffle | 13v13 register assignment |
| `0207da1c` | 0x2c | reg-choice struct shuffle | sibling of `0207da48` (adjacent) |

Pipeline per pick (Windows-native, brief 369): `arm-none-eabi-objdump` disasm of
the delinked gap `.o` → emit mwasmarm `.s` (byte-exact from the ORIGINAL words) →
`mwasmarm.exe` assemble → `objdump` byte-compare → **byte-identical**. All 8:
`✅ whole-function .s byte-identical vs delinked .o`.

## Tooling — binutils install + PATH stopgap

The decomper's binutils-PATH auto-fix (brief 371) is not on `main` yet, so:
`python tools/download_tool.py arm-binutils v15.2.1-1.1 --path tools/arm-none-eabi`
(xPack `arm-none-eabi-gcc`; extracts just `objdump` + `as` + DLL deps, gitignored)
then prepend `tools/arm-none-eabi/bin` to `PATH` for the `asm_escape.py` runs. The
369 de-wine (`get_platform.exe_launch_prefix()` + absolute `_MWCC`/`_MWASM`) does
the rest natively.

## Gate — 3-region `ninja sha1`

| region | result | why |
|---|:---:|---|
| EUR | **OK** | the 8 `.s` link clean and the ROM is byte-identical |
| USA | **OK (unaffected)** | `src/main/*.s` is EUR-only — `_is_region_source_excluded` returns `region != "eur"` for no-prefix paths; USA delinks (0 `src/main` entries) untouched |
| JPN | **OK (unaffected)** | same — main is gap-covered for JPN; nothing in its build changed |

`objdiff-100%` is **not** the gate here (brief 361: it false-passes on data
relocs) — but moot for these, since whole-function `.s` ships carry no `data_`
externs and link bl-reloc-clean. The real gate (`ninja sha1`) passed.

## ov002 — deferred to the decomper's routing, not duplicated

The brief lists ov002 as in-scope, but the decomper already `.s`-shipped 17 ov002
reg-alloc walls in the routing pass (brief 358), and ov002's remaining reg-walled
tail (~38% of its 1088) is the decomper's active lane. To avoid collision (and
since main alone hit the ~8 target cleanly), this wave is **main-only**; ov002's
reg-alloc residue stays with the decomper.

## What this leaves for the permuter (not `.s`)

Per the worklist, the **TIER-1/2** classes stay queued for the permuter when its
run-mode lands (369 left it bootstrap-only on Windows): commutative-operand +
peephole-split (proven), scheduling (theory), and the crack-once-propagate
recurring shapes (dispatcher-rotation ×7, discriminant ×6) — those get a bounded
probe before any mass `.s` conversion. This wave only drained the **proven-plateau**
reg-alloc tier, where `.s` is unambiguously correct.

## Files

`src/main/` +8 `.s`; EUR `arm9/delinks.txt` +8 `complete .text`. No USA/JPN
source/delink change. `tools/arm-none-eabi/` is gitignored (downloaded on demand).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
