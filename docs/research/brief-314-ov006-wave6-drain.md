[//]: # (markdownlint-disable MD013 MD041)

# Brief 314 — co-drain wave 6: ov006 second stream (+ thinning verdict)

**Brief:** 314 (scaffolder, co-drain). Continue ov006 (waves 1–5 = 100 matched
`.c`); if the reachable cohort is thinning, say so for the wave-7 overlay
pick. Collision-free footing: own `src/overlay006/`, own EUR `delinks.txt`,
own `ov006_core.h`. Per-pick gate = **EUR objdiff 100%** (direct-mwcc); the
brain reproduces the 3-region SHA1 on merge.

## Headline

**16 shipped (all `.c`), all EUR objdiff 100%**, all drop out of a clean
ov006 re-delink, and **EUR `ninja sha1` PASSES** with the wave applied. ov006
matched `.c`: 134 → **150**.

**Thinning verdict: ov006's hand-matchable-from-C vein is largely mined.**
This wave examined ~40 candidates and the 16 picks came almost entirely from
the last two cohesive families (init-sequence ×5, centred-text-layout ×5) plus
scattered guards; **~20 other examined candidates hit register-numbering /
instruction-scheduling walls** (ship-as-`.s` territory). See § Cohort sizing —
recommend pivoting wave 7 to a fresh overlay.

## The 16 picks

| family / shape | funcs |
|---|---|
| **init-sequence** (`021c155c`/`6964`/`755c`/`9ed4`/`cac10`/`cb030` over per-region globals + a kick/node prefix + state seed) | `021b5524` `021b48b8` `021b5490` `021b4818` `021b3290` |
| **centred-text-layout** (`q=0208dd9c(); 02001d0c(buf,pal,3); 02001d68(mode); 02001d98(buf,5); g=0202c0c0(glyph); 02004f58(buf,g,q+64, X-02005554(g,12,5)/2, …); 02001d98(buf,-1)`) | `021c4768` `021c46c0` `021bf454` `021c6798` `021c4b20` |
| **guarded / sequence** | `021b543c` (6-call + predicated post) · `021c6b34` (guarded retarget) · `021c8fa0` (channel-config) · `021cb030` (lazy-init loop) · `021c7d08` (guarded clears ×2) · `021be4d0` (3-way mode write) |

## Banked recipes & gotchas (new this wave)

- **centred-text-layout family**: the `X - width/2` centring is `rsb r3, (w/2),
  #X` from `w = func_02005554(glyph,12,5)`; written inline as `X -
  func_02005554(g,12,5)/2` it matches (the signed `/2` is the `add r0,r0,r0,
  lsr#31; asr #1` idiom). `02004f58` is a **6-arg call (2 on the stack)** —
  `(buf, g, base, x, 5/12, 12)` — and matches directly. Members differ in the
  buf offset, palette, glyph source (literal id, table-indexed, or
  `obj[n]+const`), and the X constant.
- **signed vs unsigned compare (new)**: `*(unsigned short*)p < 40` emits
  `bcs` (unsigned); the orig uses `bge` (signed). Read into an **`int` temp**
  first (`int n = *(unsigned short*)p; if (n < 40)`) to get the signed
  compare. (`021be4d0`.)
- **pool-load hoist**: assigning a needed pointer to a **top-level local**
  (`char *p = data_…;`) makes mwcc materialise it before a leading branch,
  matching the orig's early `ldr`. (`021be4d0`.)
- **nested-call arg order**: `a + 9 + b*20` (write the addend first) matches
  the `mla acc` order where the orig computes `b*20 + (a+9)`. (`021c8fa0`.)
- **init-sequence family**: clone by the per-member prefix (`021b50b0`/`43d8`/
  `2fb0` kick + 0–2 `021b6250`/`60a4`/`9ef8` node registrations) and the state
  word/value; the 6-sink tail over `0225c4dc`/`cb5c`/`de70`/`df3c`/`e068`/
  `e100`/`e138` is invariant. **Watch the per-call global mapping** — an
  off-by-one (reusing a global) CSEs the pool and shortens the output.

## Cohort sizing (the thinning evidence)

| metric | value |
|---|---|
| total ov006 funcs (`symbols.txt`) | 395 |
| matched `.c` (func blocks in `delinks.txt`) | **150** (38%) |
| unmatched defined in gap objects | ~171 |
| unmatched ≤ 0x40 | **2** (the simple cohort is gone) |
| unmatched 0x40–0x80 | 22 |
| unmatched 0x80–0x100 | 69 |
| unmatched > 0x100 | 94 |

Scaffolder cumulative ov006 picks: ~116 of brief-300's ~157 reachable. The
**remaining reachable tail is wall-dominated**: leaf bit-twiddle / byte-swap,
MMIO-packed-offset and config-heavy reg-numbering, command-record /
two-buffer store-scheduling, counter-normalise double-`cmp`, snapshot-hold-vs-
reload, and a `ldmib`/bitfield/`mla` class — all byte-identical-from-C **except**
register numbering or scheduling (the brief-294 ship-as-`.s` cohort). The rest
is large loop composites (0x100–0x13d0).

### Deferred this wave (walls)

`021c7edc` `021beec4` `021b53d4` `021b59e4` `021b8bf4` `021c4028`/`63cc`
`021c426c`/`6454` `021c11c8` `021c8e98` `021bd6bc` `021b9d1c`/`9d58`/`9d98`/`8d9c`
`021b8fa8` `021ca4b8`/`518` `021ba090` `021cae24` `021c1958` `021b79ac`/`7a20`
`021b6d1c` `021c9bc8` `021bd7cc` + the >0x100 loop composites.

## Verdict for the brain (wave-7 overlay pick)

**ov006 clean-C is thinning — recommend pivoting wave 7 to a fresh overlay.**
A wave-7 ov006 would likely yield <10 clean `.c` and increasingly fight
reg-alloc walls. Two paths:

1. **Pivot to a new clean-C overlay** (brief-300 cross-overlay reachability
   ranked ov004 > ov000 > ov008). The decomper appears to be heading to ov004
   (per the ov011 track), so the **scaffolder should take ov000 or ov008** to
   stay collision-free. (The brain assigns.)
2. **A ship-as-`.s` pass on the ov006 tail** (`asm_escape.py
   --whole-function`, brief 302) would convert the ~20+ reg-alloc/scheduling
   walls here into byte-exact `.s` — the only way to keep draining *ov006*
   itself toward completion.

Recommendation: do (1) for wave 7 (keep the clean-C momentum on a fresh
overlay) and schedule (2) as a separate ov006-finish pass.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **16/16 byte-identical** |
| clean re-delink drop-out | **16/16** out of the ov006 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| ov006 `delinks.txt` | 16 `complete .text` blocks (matched-set subtracted first; overlap 0) |
| USA / JPN `ninja sha1` | deferred to the brain on merge (EUR-baseline `.c`) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay006/` +16 `.c`; EUR ov006 `delinks.txt` +16 `complete`;
`ov006_core.h` §VERIFIED extended. No tool / USA / JPN change.

## Cross-references

- `docs/research/brief-312-ov006-wave5-drain.md` — wave 5 (command-record
  family); the store-scheduling walls noted there recur here.
- `docs/research/brief-300-ov006-premap.md` — the cross-overlay reachability
  ranking (ov004 > ov000 > ov008) for the wave-7 pivot.
- `docs/research/brief-294-*.md` — the ship-as-`.s` endgame for the ov006
  reg-alloc tail (path 2 above).
