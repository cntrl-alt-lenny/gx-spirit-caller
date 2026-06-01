[//]: # (markdownlint-disable MD013 MD041)

# Brief 305 — cold-RE wave 16: ov002 0x100-0x200 dispatcher tier

**Brief:** 305 (decomper). (A) `0x100-0x200` dispatchers (reframed as the
richest clean-C vein). (B) remaining clean `<0x100`. Defer register-walled
(GLOBAL_ASM tail; tool ready, unused this wave).

## Headline

**5 shipped (all `.c`), all 3-region SHA1 PASS — all from `<0x100`.** The
wave's key result is a **correction to the (A) premise**: the band dispatchers
are **not** a clean-C goldmine — the dense jump-table ones hit a **case-body
layout wall**, and the rest are reg-walled / state-mutating. So this wave's
deliverable is as much the finding (below) as the 5 picks.

## (A) Dispatchers — 0 shipped, and why (the premise correction)

`021bab38` (0x100) is the canonical clean value-map dispatcher: a 6-way jump
table (`sub r1,arg1,#0xB; cmp #5; addls pc,pc,r1,lsl#2`) over kinds 0xB-0x10,
each case a clean helper call, plus a small default + a node-decode tail. **No
global mutation, no uninitialised-var, no loop** — exactly the brief's target
shape. It still failed `ninja sha1` twice:

- mwcc emits the **case bodies in a physical order** (`0xC,0xD,0xE,0xF,0xB`)
  that does not follow source case order — reordering the C `switch` cases to
  match changed the bytes but did not converge. This is a **switch-case-body
  layout wall** — a sibling of the brief-295 block-layout wall, and (like it)
  not controllable from C.

So the dense-jump-table dispatchers join the walled tail. The sparse
state-machine dispatchers (`02212954`, `0222fcb0`, … on `ce288.unk5A8`) are
*also* out — they mutate globals + carry the block-layout wall (brief 297/299).
**Net: the band's clean-C-shippable dispatcher subset is ~0.**

## (B) `<0x100` — 5 `.c`

- `02285984` — two `0229cd70` table copies (cf19c/cfa04 → arg0/arg0+0x64).
- `02258384` — `0227ab9c(d016c.D70, d016c.D74+D78)` then clear `d016c.D50`.
- `02223d48` — `cd3f4.unk14` guard → `021de4b0(arg0, cd3f4.unk4, cd3f4.unk20)`.
- `0223b400` — `arg0 <= 0x14 ? arg0 == 0202b878(arg1) : 0202df78()`.
- `021f89e8` — `021ff500(arg0,arg1)` guard (−1) → `021f4a84(arg0,arg1)`.

Several near-misses **register-walled** (deferred — GLOBAL_ASM tail):
`0228de04` / `02237960` (global value lands `r1` vs orig `r2`), `021d81d4`
(the `arg0&1` temp colours `r3` vs `r2`).

## Sub-recipes / tooling notes banked

1. **Branchy functions need `ninja sha1` to verify — not the per-pick checks.**
   The mnemonic dcheck (vs the m2c-feed disasm) and a byte-level bcheck both
   have blind spots for internal branches (jump tables, if/else): a `b <off>`
   vs `b .Llabel` looks equal textually but the *byte* differs if the target
   layout differs. `021bab38` false-passed dcheck then failed sha1. **A dcheck
   branch-target diff is real — gate it with sha1.**
2. **bcheck's gap-`.o` source is gone once a function is `complete`** (it
   leaves the gap object). For per-pick byte truth, compare against the
   m2c-feed disasm, or just run sha1.
3. **Switch-case-body layout wall** (new): dense jump-table `switch`es lay
   their case bodies out in an mwcc-internal order source-reordering doesn't
   reproduce. Treat dense dispatchers as walled-tail (`.s`), not clean-C.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | objdump byte-identical vs feed (straight-line) / sha1 (branchy) |
| `tools/check_match_invariants.py` | 0 errors (4816 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 5 `.c`; EUR ov002 `delinks.txt` gains 5 `complete`
blocks. No header/tool change.)

## Recommendation for the brain

1. **The (A) dispatcher premise does not hold** — dense jump-table dispatchers
   are layout-walled, not clean-C. ov002 clean-C is now gated by **both**
   register-numbering **and** switch-case-body layout walls; yield is ~4-7/wave
   and falling.
2. **Start using the GLOBAL_ASM / register-rename `.s` tool** (brain says it's
   ready). It is now the only mechanism that drains the bulk of what remains in
   ov002 — the reg-walled composites, the jump-table dispatchers, and the
   `021d479c` packed-post composites. Clean-C drain alone can't sustain the
   12-18/wave target here anymore.
3. **Or pivot the decomper to a fresh overlay** (ov006, where the scaffolder
   is) for clean-C velocity, leaving ov002's walled tail to a dedicated `.s`
   pass.

## Cross-references

- `docs/research/brief-303-coldre-wave15-reachable-drain.md` — the `<0x100`
  depletion + register-rename-hatch recommendation this reaffirms.
- `docs/research/brief-294-*.md` — the ship-as-`.s` endgame for the walled tail.
