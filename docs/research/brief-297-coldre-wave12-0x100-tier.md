[//]: # (markdownlint-disable MD013 MD041)

# Brief 297 — cold-RE wave 12: keep draining + begin the 0x100-0x200 tier

**Brief:** 297 (decomper). (A) Continue the `<0x100` reachable drain
(families + `.s`-hatch). (B) Begin the `0x100-0x200` reachable tier (brief
296's worklist + header extension *if landed*). Bigger functions → slower;
same shape-triage (simple/dispatcher ship; loop/liveness/reg-numbering defer).

## Headline

**14 shipped (all `.c`), all 3-region SHA1 PASS** — 12 from the `<0x100`
simple-wrapper tail, **2 from the new `0x100-0x200` band** plus a full
**tractability map of that band** (brief 296's scaffolder worklist had not
landed — header unchanged, no doc — so this wave both opens the tier and
characterises it for the next one). The `.s` hatch contributed 0 this wave:
the straight-line canonicalisation accessors are drained, and the band's
residue accessors have internal branches asm_escape still can't emit.

## (A) `<0x100` drain — 12 `.c`

The remaining `<0x100` tail is **simple wrappers**, not the (drained) bitfield
predicates:

- **Forwarder predicates** (call-first / args-forwarded → reg-stable):
  `0220b004` `02204d78` `0220d6d8` (fn-pointer args) `0223fd74` `021c9dac`
  `021efcf4` `02240f44` `0220a2e0`.
- **`021d479c` packed-event posts** (`(arg0 ? 0x8000 : 0) | cmd` + packed
  payload): `021d86fc` `021df73c`.

### Sub-recipe: u16-param truncation in packed posts

`021d479c(u16,u16,u16,u16)` truncates *every* argument on entry
(`lsl #16; lsr #16`). A wrapper arg declared `u16` is **not** re-truncated
(mwcc trusts it) — so the byte-near form declares the wrapper args **`int`**
and lets the u16 *callee* prototype force each truncation (`021d86fc`: u16
args → 1 instr short → REFUSE-by-diff; int args → ✓).

## (B) `0x100-0x200` tier — 2 `.c` + the tractability map

- **`02259f98`** — flat readiness predicate: a global flag + four uniform
  `021b3ecc(player, 11, code)` queries + two `021bae7c`/`021bd364` pairs. No
  bitfield reads at all → no reg-wall.
- **`0220a5b8`** — flat `021ca2b8` predicate reading `bit0`/`field5` but
  **passing them as call arguments** (`021c23ac(bit0, field5)`), so they land
  in r0/r1 (forced) → reg-stable.

### The band map (702 unshipped funcs in `[0x100,0x200]`)

Sampling ~120 of the smallest, the shapes and why they (don't) ship:

| shape | fate | why |
|---|---|---|
| loops (`do/while`, `goto loop_`) | defer | liveness — brief-294 walled cohort |
| switch state-machines (on `022ce288.unk5A8/5B8`) | defer | block-layout + global mutation |
| global-mutating procedures (write `cf198`/`d016c`/…) | defer | side-effect ordering, not predicates |
| flat predicate, bitfield **compared** to a value | **reg-wall** | field → r1(mine)/r2(orig); see `021f0848`, `02204b08`-class |
| flat predicate, cf16c-f30 **+** cf1a4 (CSE'd `idx*20`) | needs `.s` | commutative-add wall — but big bodies have internal branches asm_escape can't emit (`021ec41c`, `021f2e0c`) |
| flat predicate, bitfields **as args** / forwarded only | **✓ ship `.c`** | args force r0/r1/r2 (`02259f98`, `0220a5b8`) |

**So the band's `.c`-shippable subset is narrow** — the args-only flat
predicates. Everything else is loop/switch/mutation/reg-wall/CSE.

### Reg-wall, refined (extends the wave-11 map)

- bitfield **compared** to a constant → walls (`021f0848` field6/bit0 in r0 vs
  r2). Bitfield passed **as a call arg** → stable.
- global **directly** compared to a constant (`g != 2`) → stable (`0220a2e0`);
  global with **arithmetic then** compared (`(g + 1) < 4`) → walls (`0220ddac`:
  the `g+1` temp lands in r0 vs r2).

## Deferred this wave (with reason)

| func | wall |
|---|---|
| `021f0848` `021f2e0c` `021ec41c` | band: bitfield-compare reg-wall / mutation+internal-branch / cf16c-CSE-needs-.s |
| `0220ddac` | reg-numbering (arithmetic-on-global then compare) |
| `02281994` | u16 param not truncated where orig truncates (reuse detail) |
| `021d5d08` | packed post with `ip`-held flag + u8 masks + stack arg |
| band loops / switches / mutating procedures | liveness / block-layout / side-effect |

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | objdump byte-identical (bl/pool modulo) |
| `tools/check_match_invariants.py` | 0 errors (4781 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 14 `.c`; EUR ov002 `delinks.txt` gains 14 `complete`
blocks. No USA/JPN config change. No tool change.)

## Recommendation for the brain

1. **The `asm_escape` internal-branch enhancement is now the top band
   unblock** (recommended in brief 295, still unbuilt): the band's
   canonicalisation-residue predicates (cf16c-f30 + cf1a4) are bigger and
   carry internal branches, so the hatch can't emit them. Label in-range
   branch targets → unlocks that whole sub-band.
2. **The brief-296 scaffolder worklist did not land** (no doc, `ov002_core.h`
   unchanged at 68 lines). A ranked `0x100-0x200` worklist + a header
   extension (the band's recurring globals — `022ce288`, `022d016c`,
   `022cf178`/`cf198`/`cf170` — as named structs) would materially speed the
   next wave; right now each band pick re-derives globals by offset.
3. **The band `.c` yield is structurally low** (~args-only flat predicates).
   Expect ~3-6 `.c`/wave from `0x100-0x200` until the `.s` internal-branch
   unblock or the reg-rename hatch lands. The `<0x100` simple-wrapper tail
   (forwarders + `021d479c` posts) still has runway and is faster.

## Cross-references

- `docs/research/brief-294-*.md` — the reg-alloc wall verdict (ship-as-`.s`
  endgame; this wave's deferrals are that cohort).
- `docs/research/brief-295-coldre-wave11-reachable-drain.md` — the reg-wall map
  this extends + the asm_escape internal-branch recommendation.
- `tools/asm_escape.py` — the `.s` hatch (internal-branch enhancement target).
