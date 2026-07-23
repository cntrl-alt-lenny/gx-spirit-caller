# Brief 670 — main small/medium sweep, upper range batch F (queue item cm-main-small-f)

**Result: 8/19 shipped (42%), 11 parked, 6 deferred without attempt.**
All 8 ported to USA + JPN, individually verified 100%. 3-region
`gate3.py --scope all --no-tests` PASS.

## Scope

Continue the 0-256 B `main` sweep in address range `0x02040000+` (the
Scaffolder's parallel lane covers `0x02000000-0x0203ffff`, no
collision). Candidates sourced via `wall_aware_headroom.py --json`
(main's `unknown_files` + `coercible_files` + `no_marker_files`),
filtered to the address/size range and cross-referenced against every
`func_NNNNNNNN` address mentioned anywhere in `codegen-walls.md` to
avoid re-attempting documented walls, plus this session's own
just-shipped/just-confirmed-wall functions from `cm-epilogue-resweep`
(not yet visible on this branch since that PR hadn't merged when this
branch was cut from `origin/main`).

Two full sub-batches of 10 and 13 read-and-drafted; ships and parks
below combine both.

## Ships (8)

| Function | Pattern | Notes |
|---|---|---|
| `func_02067850` | range-guarded word-array write | straightforward once transcribed |
| `func_0207f8d8` / `func_0207f914` | conditional multi-field setter | both needed `.legacy.c` routing — the 5-op predicated body exceeds the default tier's predication threshold (same mechanism as brief 665's retired P-6), branches instead of predicating under `2.0/sp1p5` |
| `func_020a7368` | signed-byte copy loop | needed `void *` return type returning the *original* `dst` — the target preserves incoming r0 across the loop specifically to return it unmodified; without the return, the compiler treats r0 as free scratch for the walking pointer and never introduces the separate register |
| `func_02040c98` | 2-call struct-buffer relay | matched on first attempt |
| `func_0207eae4` | bounds-checked write with predicated success/fail return | needed `.legacy.c` routing — same predication-threshold mechanism as 0207f8d8/f914, confirmed independent of frame shape (this one is a pure leaf, no stack frame at all) |
| `func_0204965c` | null-checked global double-write | needed `.legacy.c` routing, same mechanism again — 3 independent hits on the identical "body too long to predicate under the default tier" pattern in one brief |
| `func_020a3afc` | MMIO-flag-set + tail call | needed a real (if body-unused) passthrough parameter forwarded to the tail call — an *entirely unused* dummy parameter gets optimized away and doesn't force the register reservation; the parameter must actually reach the tail call's argument list to keep r0 reserved throughout |

Each ship verified 100% via `objdiff-cli diff --format json` before
staging; each ported to USA + JPN and individually re-verified 100% at
the ported address (not just gate-passed).

## Parked (11)

All 11 confirmed register-allocation-choice or compiler-optimizer-collapse
walls (logic-correct, reshape-insensitive):

- `func_020644a4` (u16 big-endian read) — target preserves an
  otherwise-redundant `lsl 16/lsr 16` truncation pair on an
  intermediate that mwcc's optimizer removes once it can prove the
  value already fits; explicit `unsigned short` intermediate typing
  reproduced the *shape* but shifted registers instead of removing the
  mismatch (0% either way, no variant reached the exact form).
- `func_0207deb0`, `func_0207e214` — mwcc **fuses** 2-3 consecutive
  word stores into `stmia`/`stmib` where target keeps them separate;
  this is the *opposite* direction of P-2's documented fusion wall
  (mwcc usually under-fuses relative to target; here it over-fuses).
  Reordering fields, forcing a local-struct intermediate (which
  additionally introduced an unwanted stack frame — the struct became
  address-taken and stack-resident instead of register-resident, a
  distinct and recognizable failure mode from this session's
  func_02096040 near-miss) — neither un-fused it.
- `func_020a71e4`, `func_020a724c` — vtable-style double-indirect
  calls; fixed one indirection-level bug (the global is a direct
  struct, not a pointer-to-struct — `port_to_region`-style modeling
  mistakes aren't unique to porting, the same "off by one dereference"
  can happen in first-draft EUR modeling) and added the correct
  passthrough parameter, closing from 37.5% to 42.9%, but a residual
  r1-vs-r3 register choice for the pointer-chase persists — matches
  the documented P-4 "lowest free register" allocator pattern exactly.
- `func_020aee58` — u16 NUL-terminated string copy; confirmed the
  `return dst` insight is necessary (matches `func_020a7368`'s
  pattern) but the two internal pointer roles (persistent walker vs.
  per-iteration snapshot) land on the opposite register pair (r12/r3)
  from target (r3/r12) — declaration-order swap had zero effect,
  matching this session's established "allocator choice, not
  declaration order" finding.
- `func_0206d79c` (ring-buffer availability calc) — the two `ldrh`
  reads and the unconditional-vs-conditional eager load of a third
  field resist every combination of statement order and eager-vs-lazy
  local hoisting tried; every variant just traded one register
  mismatch for another.
- `func_0207e6bc` — `tst`-vs-`ands` choice on a flag check the
  compiler resolves differently despite no explicit source difference
  observed to control it.
- `func_02052704` — mwcc's optimizer collapses a 3-way `||` equality
  chain (`x==2 || x==3 || x==4`) into a single subtract-and-range-check
  (`(x-2) <= 2`), which is *more* efficient than target's literal
  3-branch structure and correspondingly impossible to talk the
  compiler out of — writing the exact same conditions as independent
  sequential `if` statements produced a *worse* match (0%) than
  leaving the natural `||` form (10%), confirming the range-collapse
  optimization fires regardless of source spelling.
- `func_02054840` — argument-reshuffling call wrapper; logic and every
  instruction body matches, but the frame-layout split (how many
  registers go in the `stmdb` push-list vs. how many bytes go in
  `sub sp`) differs while allocating the identical total — a new,
  previously undocumented compiler-choice axis, distinct from register
  *selection* walls; noted here for a future dedicated investigation
  rather than filed as a full P-NN entry off a single instance.
- `func_02077094` (strchr-style scan) — reached 80% (only the `'.'`
  match branch's explicit `beq` is missing, replaced by falling into a
  combined `&&`-style check) via two levers (`return dst`-equivalent
  preserving the original pointer for the final subtraction, and using
  the *incoming parameter itself* as the walker rather than a separate
  local) — 3 further control-flow restructurings (explicit `goto`,
  reordered `!=`/`==` checks, `if`+`break`) either reproduced the same
  80% or regressed sharply (0%), confirming the missing single branch
  is a genuine compiler control-flow-canonicalization choice, not a
  reachable source form.

6 deferred without a compile attempt (population-scoping decision, not
a wall claim): `func_0207708c`, `func_020a9914`, `func_0206be1c`,
`func_02074e4c`, `func_020b3808` are epilogue-only "shared-tail" stub
functions or hand-encoded inter-function jumps — each is a
codegen-inherent E-2-class case (a function that isn't its own
compilable C unit at all), several with their own header comments
already documenting this; `func_02079e4c` (bit-population count via a
`clz`-based loop) was deferred pending confirmation of how this
project's toolchain exposes the ARM9's `clz` instruction from C, which
this brief's time budget didn't reach.

## Levers confirmed / added

- **The predication-threshold routing fix (brief 665's P-6 retirement)
  applies independent of frame shape.** 3 of this brief's 8 ships
  (`0207f8d8`, `0207f914`, `0207eae4`) needed `.legacy.c` routing purely
  to cross a body-length predication threshold — none of the three has
  the `stmfd sp!,{lr}`+`sub sp,#4` epilogue-shape signature this
  session's other routing lever targets (one is a pure leaf, no frame
  at all). The mechanism is the same underlying tier-specific
  predication-cost heuristic P-6 documented, but it fires on *any*
  function shape, not just the epilogue-bearing ones — worth checking
  regardless of frame shape whenever a conditional multi-instruction
  body branches instead of predicating.
- **`return`-the-original-pointer is a distinct, reusable lever** for
  walk-and-return-dst copy/scan loops: whenever a loop's walking
  pointer and the function's eventual return value are the *same*
  parameter conceptually, explicitly returning the untouched parameter
  (not the final walked value) forces the compiler to allocate a
  separate register for the walker — without it, the compiler treats
  the incoming register as free scratch and collapses the two roles
  onto one register, which never matches a target that kept them
  separate. Confirmed on 2 independent functions this brief
  (`020a7368`, partial on `020aee58`).
- **An unused dummy parameter does not reserve a register — it must
  reach a real use.** For `020a3afc`, adding an unreferenced parameter
  had zero effect (the compiler dead-code-eliminates it before
  allocation); only forwarding it into the tail call's own argument
  list forced the reservation. This refines the general "add a
  passthrough parameter" lever documented elsewhere this session:
  the parameter must be *used*, not merely *present*.
- **Store-multiple fusion is bidirectional and neither direction is
  reliably steerable** — P-2 already documented "mwcc fuses, target
  doesn't" and "target fuses, mwcc doesn't" as two faces of the same
  wall; this brief adds two more confirmed instances of the
  "mwcc over-fuses" direction (`0207deb0`, `0207e214`), both resistant
  to field reordering and to a local-struct-intermediate trick that
  worked for nothing here except to introduce a *new* stack-frame
  regression (a variation of this session's own `func_02096040`
  stack-materialization near-miss).

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean
throughout (81 delinks.txt, no duplicate `.text` addresses).
