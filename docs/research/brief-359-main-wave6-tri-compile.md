[//]: # (markdownlint-disable MD013 MD041)

# Brief 359 — main easy-tier wave 6 (tri-compile)

**Brief:** 359 (scaffolder, co-drain). main is still not thinning (~257 candidates
`≤0x40`, ~50% yield, now in the 0x30 tier). Continue the `<0x80` simple cohort;
**tri-compile every candidate** (`tools/verify.py --cc all`); route the
`||`-equality family to the permuter; route residue out instead of grinding. Per-
pick gate = EUR objdiff 100%. Target ~12–16. Branch `scaffolder/main-wave6`.

## Headline — 13 picks; yield dips as the size tier deepens

**13 shipped**, all EUR objdiff 100%, all drop out of a clean re-delink, and EUR
`ninja sha1` PASSES (main `complete` 1720 → 1733). In the 12–16 target. The
first-pass yield fell to **~36%** (13 of ~36 sampled) — the 0x30/0x34 tier is
more reg/scheduling/peephole-sensitive than the 0x2c tier, so more candidates
land as permuter-class near-misses. The recurring *families* still carry the
clean picks.

## The 13 picks by compiler tier

| tier | suffix | funcs |
|---|---|---|
| mwcc 2.0/sp1p5 | `.c` | `0207d9c4` `02088180` `02018d98` `020191dc` `0201174c` `0201bf4c` `02020278` `0201cf54` |
| mwcc 1.2/sp2p3 | `.legacy.c` | `0207d994` `020a69d0` `02095bc8` |
| mwcc 1.2/sp3 | `.legacy_sp3.c` | `020852cc` `02089c44` |

Shapes: doubly-linked insert-after (`0207d9c4`), buffer-init (`0207d994`),
stride-24 SysWork-entry bitfield reads (`02018d98` bit1, `020191dc` bits8-11),
two MMIO/global RMW + call-pairs (`020852cc`, `02088180`), arg-shuffle calls
(`02089c44`, `02095bc8` stride-12 store, `020a69d0` strlen-append), guard
predicates (`0201174c`, `0201bf4c` lazy-`||`, `02020278`/`0201cf54` flag
forwarders).

All 13: EUR objdiff 100% (direct, per-tier) · 13/13 clean re-delink drop-out ·
EUR `ninja sha1` OK.

## New: the SysWork stride-24 family (and its peephole split)

`GetSystemWork()` returns a base; `entry = base + (func_02019210(a0)-1)*24`; the
function returns a bitfield of `entry->f16`. Members differ only in the extract:
- **`02018d98`** — `(v<<30)>>31` (bit 1) → matches.
- **`020191dc`** — `(v<<20)>>24` (bits 8-11) → matches.
- **`02018dcc`** — bit 0 → **WALL**: mwcc 2.0 **peepholes** `(v<<31)>>31` to
  `and #1`, but the orig keeps `lsl#31; lsr#31`.
- **`0201b690`** — low byte of `entry->f8` → **WALL**: same peephole, `(v<<24)>>24`
  → `and #0xff` vs the orig's `lsl#24; lsr#24`.

**The peephole splits the family:** genuine bit-extracts (mid-bits) keep the
shifts and match; `&`-mask-reducible extracts (bit0, byte) get peepholed and
diverge. The reducible ones → permuter/`.s` (canonicalisation-style residue).
Recipe banked: stride-N entry math `base + (k-1)*24 + off` → `mla`; an unsigned
count field is `ldrb` (a signed `char*` gives `ldrsb`+`and#0xff` — `02095bc8`).

## Walls routed out (the brief's "don't grind")

- **commutative-add canonicalisation** `020195b8` (`add r0,r5,r0` vs orig
  `add r0,r0,r5`) — mwcc fixes the operand order regardless of C; same class as
  wave-4 `02053600` → permuter/`.s`.
- the two peephole family members above (`02018dcc`, `0201b690`).
- reg/scheduling → permuter: `0208c9d4` (MMIO set/clear), `0207d37c` (bitfield
  RMW two-store), `020a2f9c` (load-schedule), `020908c0` (predicated table-set),
  `02022580`/`0201f68c`/`0201be64` (reg-choice), `02034810` (switch cmp-chain,
  15v13). `0201bf80` has an unrelocated intra-gap `bl` (no symbol) — skip.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct, per-tier) | **13/13 byte-identical** |
| clean re-delink drop-out | **13/13** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 8 → `mwcc` · 3 → `mwcc_legacy` · 2 → `mwcc_legacy_sp3` |
| `ruff` (CI scope) / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 8 `.c` + 3 `.legacy.c` + 2 `.legacy_sp3.c`; EUR
`arm9/delinks.txt` +13 `complete` (1720 → 1733). No USA / JPN change. (The
`tools/_vendor/decomp-permuter` ruff findings are config-excluded vendored code,
new on this main; this wave touched no `.py`.)

## Recommendation for the brain

1. **main keeps producing** (~245 `≤0x40` remain) but the **per-pick cost is
   rising** as the tier deepens (~36% this wave vs ~50% before). Still worth a
   wave 7, but the permuter backlog is now the higher-leverage lane for the
   accumulating near-misses.
2. **The permuter is vendored now** (`tools/_vendor/decomp-permuter`) — the
   routed residue is finally actionable: the `||`-equality family (4), the
   commutative-operand canonicalisations (`02053600`, `020195b8`), the
   peephole-split stride-24 members, and the reg-choice pile.
3. Standing: the `va_list` shim (varargs family); `asm_escape --c` tri-compile;
   the legacy/sp3 re-sweep of the catalogued ov004/006/011 backlog.

## Cross-references

- `docs/research/brief-357-main-wave5-tri-compile.md` — wave 5.
- `tools/verify.py --cc all` — the tri-compile gate.
