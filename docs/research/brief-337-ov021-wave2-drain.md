[//]: # (markdownlint-disable MD013 MD041)

# Brief 337 — co-drain wave 2: ov021 step machines + render bodies

**Brief:** 337 (scaffolder, co-drain). Continue ov021 (wave 1 = brief 335,
PR #851, 12 matched). Per-pick gate = EUR objdiff 100% (direct-mwcc); the brain
runs the 3-region SHA1 on merge. Own `src/overlay021/`, the ov021 `delinks.txt`,
and `ov021_core.h`. Target ~10.

## Headline

**6 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK.** Wave 1 drained
ov021's per-state enter/reset/toggle/audio methods; wave 2 takes the next layer —
the **step state machines and their render bodies**. All 6 attempts in that layer
matched (2 step machines + 1 capture-arm sibling + 3 render bodies). The
remaining tier is the random-unique **loops** and the big `0x100+` **state
bodies**, both register/SR-dense (catalogued for the Mac lane). ov021 matched:
→ +6 (18 total across waves 1-2).

## The 6 picks

| func | size | shape |
|---|---|---|
| `021ab090` | 0xb8 | 4-state step machine (jump table; sibling of wave-1 `021aaa40`) |
| `021aa908` | 0xac | main frame driver (loops both step machines per tick) |
| `021abbc8` | 0xe4 | main-engine capture-arm (sibling of wave-1 sub-engine `021aadbc`) |
| `021abd78` | 0xb8 | centred-caption render |
| `021aae68` | 0xec | segment-row render (`col % 16`, ternary table, signed `/2`) |
| `021abcac` | 0xcc | active-cell render (`&&`-chain + `+0x60/+0x74` indirection) |

## New reshape lever — declaration order fixes register rotation

`021aa908` first came in at **60%**: mwcc had rotated the register assignment of
the loop counter / completion flag / struct-base (orig `g=r6, done=r4, i=r5`;
mine `g=r4, done=r5, i=r6`) — the same whole-function rotation that sank ov015
`021b43a8`. **Fix: declare the counter and accumulator locals BEFORE the
`char *base` local.** mwcc then gives the counter/accumulator the low
callee-saved regs (r4/r5) and the base the high one (r6) = orig. **60% → 100%.**
Banked in `ov021_core.h`.

## Recipes re-proven

- **State machines** (`021ab090`): the ov005/ov015 switch-machine pattern — a
  jump table for 4 dense cases, one terminal case returning early, the rest
  bumping a counter and returning. Matched as written.
- **Capture-arm** (`021abbc8`): the wave-1 `021aadbc` recipe (split
  `|0x204 |0x400`, reuse the reg base + `0xe` offset for the offset store, the
  `data_02104f4c.chan` `:3` bitfield) — main-engine sibling.
- **Render bodies**: VRAM clear + glyph measure (`func_020054a4`) + centre-clamp
  (`rsbs; movmi`) + N-arg blit with stack args. `col % 16` emits mwcc's signed
  mod-16 idiom as written; the ternary table select `(cond ? A : B)[e]` and the
  `&&` short-circuit (`021abcac`) match directly.

## Deferred (NOT shipped — catalogued for the Mac lane)

| func | % | class |
|---|:---:|---|
| `021aa4a0` | — | **permuter** (indirect `blx` dispatch) |
| `021ab9d0` | 78% | register-choice (wave-1 carry-over) |
| `021aba18` `021abaa0` `021aaf5c` | ~28% | random-unique loops — mwcc strength-reduces the `o[0x60+i*4]` accesses to a base pointer where the orig recomputes base+index (same SR class as ov015 `021af704`) |
| `021aab7c` … `021ab6c0` | — | big `0x100+` state bodies (113–195 instr; register-choice-dense) |

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **6/6 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov021 `delinks.txt` | +6 `complete .text`; gap set 16 → 10 (−6, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `main` (`a5255b4` = #851 + #852); cleaned stale
gap files + re-`dis`.

## Recommendation for the brain

1. **ov021's tractable tier is now mostly drained (18 matched, waves 1-2).** The
   remaining ~10 funcs are the random-unique loops (SR-bound) and the big state
   bodies (register-choice-dense) — a yield transition like ov015's, but at a
   higher matched count. A 3rd ov021 wave would be low-yield (~2-4) and grind-y.
2. **Recommend pivoting the scaffolder to a fresh overlay for wave 3** (the
   recipe library is overlay-portable — see brief 335) and routing ov021's
   loop/big-body tail to the **m2c/permuter Mac lane**.
3. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.

## Cross-references

- `docs/research/brief-335-ov021-wave1-drain.md` — wave 1 + the recipe-portability
  finding.
- `src/overlay021/ov021_core.h` — §VERIFIED wave-2 block + the declaration-order
  reshape lever + the deferred catalogue.
