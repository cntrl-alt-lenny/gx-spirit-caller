[//]: # (markdownlint-disable MD013 MD041)

# Brief 310 — co-drain wave 4: ov006 second stream

**Brief:** 310 (scaffolder, co-drain). Continue the ov006 second stream
(waves 1–3 = briefs 304/307/309 shipped 65 matched `.c`). Collision-free
footing: own `src/overlay006/`, own EUR `delinks.txt`, own `ov006_core.h`.
Per-pick gate = **EUR objdiff 100%** (direct-mwcc); the brain reproduces the
3-region SHA1 on merge.

## Headline

**20 shipped (all `.c`), all EUR objdiff 100%** — byte-identical vs the
delinked gap `.o` (bl/pool reloc modulo), wired into `delinks.txt`, compiled
in-tree, and **all 20 confirmed dropped out of the regenerated gap objects**
(dsd re-delinked ov006 clean). ov006 matched `.c` now 99 → **119**.

The simple-clone cohort is thinning after 3 waves (only ~17 funcs ≤0x40
remain, 1 strict mnemonic-clone family left), so this wave is more
individual-RE than wave 1 — but the **shape families still carry it**: a
4-member setup family, a 6-member guarded-call/lazy-init group, six call
orchestrators, and the first **command-record (stack-struct) match**.
Several reg-alloc / scheduling walls were hit and deferred (ship-as-`.s`
territory; this is a C-only wave).

## The 20 picks

| family / shape | funcs | recipe |
|---|---|---|
| **`021b805c` setup family** | `021b6870` `021b6694` `021b64d0` `021b5db4` | `[if(flag)]{ 021b805c(p); 02012454(arg, p+292); } 021b8d6c(p); return 1` — clone by the guard + the `02012454` arg (`0`, a main-table handle, or a `Copy32` of a 292-byte template) |
| **guarded-call / lazy-init** | `021b8d30` `021b8de0` `021ca3a0` `021c5cc0` `021c6c34` `021c6f40` | `if(cond){ sink(...); … }` — the body's `bl` forces a real branch (no predication trap) |
| **call orchestrators** | `021b5074` `021c5084` `021b47d8` `021c1680` `021b565c` `021cad34` | fixed call sequences + state-word seeds; `021cad34` is a 6-arg (2 stacked) request-object init |
| **accessor / compute** | `021b8d08` `021be8c4` | 8-byte-stride table read; ceiling-divide by 60 |
| **command-record (stack struct)** | `021c74e0` | `h=02006c0c(tbl,4,0); 0201d47c(cmd); <set fields>; 0201e5b8(cmd); 02006e1c(h)` |
| **loop** | `021cb0a0` | release-and-clear a 5-entry handle array |

## Banked recipes & gotchas (new this wave)

### Command-record family (`0201e5b8`) — the unsigned-short trap

The dominant remaining ov006 composite shape: allocate a handle, let
`0201d47c` fill a ~40-byte stack record, overwrite specific fields, submit via
`0201e5b8`, release via `02006e1c`. The record is a `char cmd[40]` with
cast-stores. **gotcha (new): the field re-read at `+20` must be
`unsigned short` (`ldrh`), not `short` (`ldrsh`)** — the orig reads it
unsigned to OR-in flags. With the signed cast the only diff is one
`ldrsh`/`ldrh` byte. `021c74e0` matched; `021ca678` (a sibling) is deferred —
its store *scheduling* (which field stores first) diverges and won't budge
from C.

### `021b805c` setup family (4 members, clone-able)

Uniform: optionally `021b805c(p)` + `02012454(arg, p + 292)` under a flag,
then always `021b8d6c(p)`. Members differ only by the guard (present/absent)
and the `02012454` first arg: `0` (`021b6870`/`021b6694`), a main-table handle
`*(int*)(data_021040ac + 0xc3c)` (`021b64d0`), or a `Copy32(p+292, template,
292)` instead (`021b5db4`).

### gotcha 6 (bitfield, recurring) — the `02104f4c` mode field

`ldr [base+4]; lsl #29; lsr #29` is a **3-bit unsigned bitfield** read, not
`& 7`. Modeled as `struct { int pad; unsigned mode : 3; }` at
`data_02104f4c`; used by `021c1680` and `021b565c` (the latter reads it three
times, once per notified subsystem — mwcc re-reads, no CSE across calls).

### gotcha 5 (predication, recurring)

`021b47d8`'s `if (r != 0) data_0224f290[0] = 3;` is a single store with no
call → mwcc predicates (`ldrne/movne/strne`); written plainly so it
predicates (unlike the call-bearing guards above, which branch).

### Other levers banked

- **8-byte-stride fuse**: `t[k].field` on a 2-int struct → `ldr [r2, k,
  lsl #3]`; writing `((int*)t)[k*2]` instead splits into `k*2` then `*4`
  (one extra `mov`). (`021b8d08`.)
- **C89**: mwcc runs `-lang=c` (C89) — all declarations must precede
  statements in a block; a mid-block `unsigned short v = …` is a hard compile
  error (cost one iteration on `021ca678`).
- **div-by-constant**: `(x + 59) / 60` regenerates the exact `0x88888889`
  magic + add-back + `asr #5` (`021be8c4`).

## Deferred this wave (walls — ship-as-`.s` candidates)

| func | wall |
|---|---|
| `021b9d1c` `021b9d98` | leaf byte-swap/bit-twiddle — temps colour into permuted regs |
| `021ca4b8` `021ca518` | `0x0400100a` scroll-config — constant-heavy, `reg`→r3 vs r1 reg-numbering |
| `021ca678` | command-record sibling — store *scheduling* order diverges |
| `021b59e4` | mwcc rematerialises a pool load instead of holding it in a callee-saved reg |
| `021b8d9c` `021b79ac` | signed div/mod-32 bitmap (`asr`/`ror`/`mla`) — reg-alloc |

Each is byte-identical-from-C **except** register numbering / instruction
scheduling — the brief-294 ship-as-`.s` cohort.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **20/20 byte-identical** (bl/pool reloc modulo) |
| in-tree build (`ninja`, 20 `.o`) | compiled; dsd re-delinked ov006 with no error |
| gap-object drop-out | **20/20** picks no longer defined in any `_dsd_gap@ov006_*.o` |
| ov006 `delinks.txt` | 20 `complete .text` blocks (no collision; matched-set subtracted first) |
| 3-region `ninja sha1` | **deferred to the brain on merge** (per brief) |
| `ruff` / `tests/` | clean / pass |

`src/overlay006/` gains 20 `.c`; EUR ov006 `delinks.txt` gains 20 `complete`
blocks; `ov006_core.h` §VERIFIED extended. No tool change, no USA/JPN config
change. (The pre-existing macOS `m2ctx.py` `-fworking-directory` clang failure
on `.ctx.c` scratch targets is unrelated; build the picks' `.o` directly or
`ninja -k 0` to step past it. Moot on Linux/CI.)

## Notes for the brain

1. **Matched-set subtraction worked, with one dsd quirk.** Pulling the latest
   `delinks.txt` and subtracting the 99 matched funcs before picking kept this
   wave collision-free. Two already-matched funcs (`021b22c8`, `021b2324`,
   both in `_dsd_gap@ov006_83`) **persist as defined symbols in their gap
   object even after a full re-delink** — they're in the matched set so they
   were never at risk, but it means a raw "defined in a gap obj" scan
   over-counts unmatched by 2. Worth a glance on the dsd side.
2. **The clean-C cohort is thinning.** ~202 unmatched ov006 funcs remain,
   now dominated by composites > 0x80 and the reg-alloc/scheduling walls
   above. Expect wave-5 yield to lean on the command-record family (one
   `.c` per OAM/sprite submitter, `021c74e0` is the template) and the
   remaining call orchestrators; the tiny-clone vein is mostly mined.
3. **A ship-as-`.s` pass would unlock the deferrals.** Same recommendation as
   the ov002 stream (briefs 301/303): the deferred 7 here are all
   register-numbering / scheduling, not comprehension — `asm_escape.py
   --whole-function` would ship them byte-exact.

## Cross-references

- `docs/research/brief-304-ov006-wave1-drain.md` — wave 1 + the families this
  extends (callback-dispatch, 5-iter-pass, guarded-call).
- `docs/research/brief-300-ov006-premap.md` — the ov006 census this drains
  against.
- `src/overlay006/ov006_core.h` — the ov006 vocabulary header (§VERIFIED
  extended with this wave's globals/sinks).
