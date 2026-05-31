[//]: # (markdownlint-disable MD013 MD041)

# Brief 287 — cold-RE wave 7: the 0x868 accessor family (multiplier wave)

**Brief:** 287 (decomper). Batch the brief-284 ~101-member 0x868 sub-row
accessor family, starting with the pure wrappers, on one recipe
(brief-282 signature + `f30:13` bitfield + gotcha 26 pass-through +
gotcha 5 predicated guards).

## Headline

**15 shipped, all 3-region SHA1 PASS — one recipe, 15 members.** brief-286
(`ov002_core.h`) hadn't landed, so the recipe was inlined per pick. The
representative `func_ov002_021e77fc` matched first compile, locking the
skeleton; the other 14 are guard-set / tail variants of it. The family is
**not** a blind template (each member has its own guard combination) but
the *skeleton is uniform*, so per-pick work is just reading the guards off
the m2c draft and assembling. ~80 family members remain for wave 8.

## The skeleton (verified)

```c
struct self_t { char _pad[2]; unsigned short b0 : 1; ...; };  /* arg0 */
struct subrow { char _pad[0x30]; unsigned int f30 : 13; ...; };  /* cf16c row */
int f(struct self_t *self, int player, int idx) {
    /* 0-N guards drawn from: */
    if (player == self->b0) return 0;          /* opponent (barrel form) */
    if (idx >= 5) return 0;                     /* idx range */
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1)*0x868 + idx*20);
    if (sr->f30 == 0) return 0;                 /* sub-row id (bitfield, gotcha 25) */
    /* + cf1a4/cf1a2 field guards, secondary helper calls, post-checks */
    return func_ov002_021c1ef0(self, player, idx) != 0;  /* forward all 3 (gotcha 26) */
}
```

**The pass-through is the whole game (gotcha 26):** all three args
(`self`/`player`/`idx`) are forwarded unchanged to `021c1ef0`/`021c1e44`,
keeping them in r0-r2 so the row/index temps colour r3+/ip — exactly the
original. `f30` *must* be an `unsigned:13` bitfield (gotcha 25), else mwcc
folds `(v<<19)>>19` to a `tst #0x1fff` mask.

## Shipped (15)

`021e77fc` (rep), `021eac30` (idx+f30), `021eaae8` (cf1a4≠0+cf1a2==0),
`021f09e8` (f30+b0+idx), `021ee988` (call-then-f30), `021e9a44` /
`021f1ce0` (two-helper chains), `021f0698` (call-chain), `021e8a18` (==1
guard), `021f192c` (b0+f30, `==0` tail), `021e961c` / `021e9738`
(`021c2084` variants), `021f0954` (f30+b0+idx two-helper), `021ede94`
(conditional `021b8fcc`), `021ecec8` (f30-read-early across 2 calls).

## Sub-recipes banked

- **b0-guard operand order controls the codegen form.** `player ==
  self->b0` → the **barrel** form (`ldrh; lsl#31; cmp player, _, lsr#31`);
  `self->b0 != player` → the **separate** form (`lsl#31; lsr#31; cmp b0,
  player`). Match the orig by ordering the comparison operands
  accordingly (player-left = barrel).
- **`idx > 4` vs `idx >= 5`.** Orig `cmp #4; movgt` ⇒ write `idx > 4`;
  `cmp #5; movge` ⇒ `idx >= 5`. Use whichever immediate the orig shows.
- **f30 read: single-use folds to `mla` (matches); shared idx_off does
  not.** When `idx*20` feeds only the f30 read, mwcc emits `mla r,idx,20,
  base` and matches. When `idx*20` is *also* used for a cf1a4/cf1a2 read,
  mwcc computes it once (`mul`) and the f30's `base+player+idx` uses two
  `add`s — whose commutative operand order (gotcha 19) then diverges
  (`add lr,lr,ip` orig vs `add lr,ip,lr` mine). Offset-0 cf1a4/cf1a2 reads
  use `ldrh [idx_off, base]` (two-reg addressing) and are fine; only the
  `+0x30` f30 read needs the add. **These shared-idx_off variants → permuter.**

## Deferred → permuter (the residue)

| group | members | nuance |
|---|---|---|
| shared-idx_off f30 add-order | `021ec094` `021f15a8` `021eec48` `021efc64` `021f0174` | gotcha-19 commutative `add` operand order on the `+0x30` read |
| cond-move tail order | `021f103c` | `moveq;movne` order on a cd3f4 `?0:1` tail |
| arg-pack (021d479c) | `021d5a08` `021d6808` | brief-284 scheduling-sensitive sink |
| extra-tail / cd3f4-arg | `021edce8` `02200310` `0220257c` `021e9860` | per-member tails (hand-RE later, not template) |

Small residue vs 15 shipped; the add-order group shares one root cause (a
good permuter batch).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 15/15 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4704 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2310 passed |

(`src/overlay002/` gains 15 `.c`; EUR ov002 `delinks.txt` gains 15
`complete` blocks. No USA/JPN config change. `find_callsites.py` gave the
precise caller list — 159 callers, 96 unshipped `<0x100`; the in-process
shape-triage was too slow at this size, `find_callsites` is the right
family-worklist tool.)

## Recommendation for the brain

1. **Wave 8 continues this family** — ~80 members remain (`find_callsites
   func_ov002_021c1ef0`/`021c1e44`, filter unshipped). The skeleton is
   locked; each is a guard-set read-off. Many of the larger ones add a
   cd3f4 tail or a secondary helper — still hand-RE, just per-member.
2. **Batch the add-order residue to the permuter** — the shared-idx_off
   f30 variants all diverge on one gotcha-19 `add`; one permuter weight
   profile likely clears them.
3. If `ov002_core.h` (brief 286) lands, switch the per-pick struct
   boilerplate to an `#include` — it is copy-pasted across all 15 here.

## Cross-references

- `docs/research/brief-284-ov002-family-mining.md` — the family map +
  shape score.
- `docs/research/brief-282-ov002-accessor-signature.md` — the recipe
  (signature + struct + gotcha 26).
- `docs/research/recipe-gotchas.md` — gotcha 5/6/19/25/26 (all applied).
