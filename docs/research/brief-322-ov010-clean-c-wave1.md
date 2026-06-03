[//]: # (markdownlint-disable MD013 MD041)

# Brief 322 — ov010 clean-C wave 1 (overlay pivot off ov004)

**Brief:** 322 (decomper). Pivot to a fresh overlay after ov004's easy clean
tier thinned (17 → 15 → 6). ov010 had 13 funcs matched long ago (brief 251, the
C-42 family wave) then went dormant; this revives it as a clean-C target.
Playbook: survey `size_census --shape`, small-first, stand up `ov010_core.h`
(cached-base mandatory), `m2c_feed` → m2c → coerce, offsets DECIMAL, gate =
3-region `ninja sha1` (NOT `ninja check`).

## Headline

**15 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK.** Right at the
target floor (15–25). ov010 leans more **dispatcher / stack-heavy / loop** than
ov004's accessor-rich tail, so the clean simple yield is lower and the wave
surfaced a steady stream of reg-alloc / framing walls (6 defers). The dominant
*unlock* was the **divmod helper recipe** (`func_020b3870`), which is why the
wave clusters around scroll/row math.

## The 15 picks

| family | funcs |
|---|---|
| struct-compute scroll math (divmod **quotient**, explicit call) | `021b36e4`, `021b39c0`, `021b23f4` (clamp+lerp), `021b238c` (dirty-bit lerp) |
| row-round height (divmod **remainder**, s64 `>>32`) | `021b403c` (mgr-B ×4), `021b6814` (mgr-A ×2) |
| panel state-updater **pair** | `021b4090` (`021b9260`), `021b6868` (`021b9890`) |
| message-window open/config + per-mode dispatch + MMIO | `021b3c58`, `021b3ce4` |
| handle-count loop | `021b691c` |
| sequence / bind / init | `021b69b4` (inline-reload ×3), `021b4144` (table-bind), `021b2df8` (task-init), `021b3664` (sprite-cell init) |

## The wave's biggest gotcha — divmod must call `func_020b3870` explicitly

`func_020b3870` is the runtime signed divmod (quotient r0, remainder r1). The
obvious C — the `/` and `%` operators — **compiles and passes dcheck but FAILS
`ninja sha1` at link**: mwcc emits `bl _s32_div_f`, and `_s32_div_f` is
*undefined* in this link (`mwldarm: Undefined "_s32_div_f"`). dcheck masks the
`bl` target, so the breakage is invisible until the link step. Fix:

- **Quotient:** `extern int func_020b3870(int, int);` → result in r0.
- **Remainder:** `extern long long func_020b3870(int, int);` then
  `rem = (int)(func_020b3870(a, b) >> 32);` — the s64 high word *is* r1, and the
  `>>32` reproduces the orig's direct-r1 use with **no extra `mov`**
  (`bl func_020b3870; sub r0, r, r1` — byte-identical on 403c/6814).

This is now documented at the top of `ov010_core.h`. (The earlier ov004 “÷ →
`func_020b3870`” recipe was really *call it explicitly*, never the operator.)

## Recipes banked (wave 1)

1. **DIVMOD via explicit `func_020b3870`** (above) — the headline.
2. **Loop:** `while (h != stop) { h = next(...); … }` reproduces the orig
   guard+do-while shape. A callee out-param that's filled 12 bytes wide must be a
   **12-byte local** (`int slot[3]`) to force `sub sp,#12` — a bare `int` makes
   mwcc push a dummy `r3` for the slot instead. Assign the accumulator at **first
   use** (`cnt = 0;` after the decl), not at declaration, or mwcc hoists the
   `mov` too early (`021b691c`).
3. **MMIO halfword RMW:** cast `*(unsigned short *)` (→ `ldrh`, not the signed
   `ldrsh`) for BGnCNT-style `(x & ~3) | n`; the 32-bit DISPCNT stays
   `*(int *)` (`021b3ce4`).
4. **switch tail case:** an explicit empty `case N: break;` reproduces the dead
   `cmp #N; b tail` mwcc emits for the unhandled case (`021b3c58`/`3ce4`, N=3).
5. **Reg-order by decl order:** declare the cached base pointer *before* the
   `ret`/zero local so the base reg numbers below the constant (`021b3ce4`:
   `d→r4`, `ret→r5`).
6. **`(x & ~1) | 1`** writes `bic;orr` in one store (vs `|= 1`'s single `orr`) —
   the state-updater flag clear-then-set (`021b4090`/`6868`).
7. **Carried:** status-message `func_02037208(ID, -1, 0, 1)` → `mov rX,#ID; sub
   rY,rX,#(ID+1)` (ids 86, 56). **Inline-reload** (not cache) a base the orig
   reloads per access across calls (`021b69b4`, reloads `021b9884` ×3).

## Walls — the thinning (reg-alloc / framing / scheduling tail)

| func | wall |
|---|---|
| `021b2490` | materialized-divisor reg: `arg1` stuck in r1, needs `mov r1,r2` (orig parks it in r2 via `movs`). 1 instr over |
| `021b46a8` | r0↔r1 swap on the held `hit` temp (mwcc r0 vs orig r1) — functionally identical |
| `021b2514` | mwcc chose frameless + `bx` tail vs orig framed dispatch; case-2 load scheduling differs |
| `021b28a8` | `movne#1;moveq#0` emission order (orig `moveq` first) — unsteerable |
| `021b7104` | tail-call `bx ip` vs orig `push;bl;add r0,r0,#0;pop` (no-op add forwarder) |
| `021b35e4` | nested tilemap-fill loop strength-reduction (`i*N` counter + `strh [p],#2` post-inc) |

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 15 carved) |
| `check_match_invariants.py` | 0 errors (5064 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| `ninja check` | NOT run (benign label drift, per the brief) |

EUR-only config change (`config/eur/.../ov010/delinks.txt` +15 `complete`
blocks); `src/overlay010/` gains 15 `.c` + `ov010_core.h`. **Process catch:** one
carve (`021b23f4`) was initially sized 0x60 vs the true 0x5c and overlapped the
next (committed) function — the delink overlap check caught it; sizes are now
audited against the gap symbol table before the gate.

## Recommendation for the brain

ov010's clean-C is **thinning fast** — the wave hit 6 defers against 15 ships,
and the residue is dominated by reg-alloc/framing walls, not fresh clean shapes.
Options:

1. **One more ov010 wave at diminishing returns** (~8–12) — the larger
   0x100–0x200 composites and a few scattered `<0x100` shapes remain (~55 in the
   gap). Expect heavy defer rate.
2. **Permuter pass** on the deferred reg-alloc tail (`021b2490`, `021b46a8`,
   `021b2514`) — uniform 1-instr misses.
3. **Pivot to a fresh overlay** — ov008 / ov016 from the original survey are
   untouched; this is likely the higher-yield move given the thinning.

## Cross-references

- `src/overlay010/ov010_core.h` — §VERIFIED + the DIVMOD header block.
- `docs/research/brief-320-ov004-clean-c-wave3.md` — the ov004 wave that thinned,
  triggering this pivot.
