[//]: # (markdownlint-disable MD013 MD041)

# Brief 289 — cold-RE wave 8: adopt ov002_core.h, batch the families

**Brief:** 289 (decomper). (A) Copy brief-286's `ov002_core.h` into the
build path and `#include` it for new picks (leave wave-7 `.c` as-is).
(B) Continue the 0x868 family + open the shared-sink families
(`0229ade0`/`02253458`/`021ff3bc`/`021ca2b8`) on the header's proven
prototypes.

## Headline

**17 shipped, all 3-region SHA1 PASS — header adopted, `02253458` family
opened and largely drained.** `ov002_core.h` copied to `src/overlay002/`
and `#include`d; the first pick (`021e76b4`) matched through it, confirming
the include path + the shared structs/sinks. Then the **`02253458` "post a
list event" family** turned out to be a clean one-skeleton batch — 16 of
the 17 are members, drained at near-template speed.

## (A) Header adoption

`cp docs/research/ov002_core.h src/overlay002/ov002_core.h`; new `.c` do
`#include "ov002_core.h"` (resolves from the TU's own dir; configure.py
does not compile the `.h`). It supplies `struct Ov002Self`/`Ov002Slot`,
the 8 per-player globals, and 9 sink prototypes — eliminating the
per-pick struct boilerplate that was copy-pasted 15× in wave 7. The 15
wave-7 `.c` are untouched (additive; SHA1 stays green).

**Slot access nuance:** `Ov002Slot.id` is at offset 0, so the byte offset
(`0x30` for the 20-byte sub-rows, `288` for the `idx*4` array) goes in the
*pointer expression* and mwcc folds it into the `ldr` immediate:
`((Ov002Slot *)((char *)cf16c + (player&1)*0x868 + idx*K + OFF))->id`
→ `ldr [base+idx*K, #OFF]`, matching orig.

## (B) Shipped (17)

- **0x868 family (1):** `021e76b4` (b0/idx/f30 guards → `021c1ef0` →
  `021c1e44 == 0`) — the wave-7 family, now via the header.
- **`02253458` "post list event" family (16):**
  - *count-guard* (2): `0224b464` (`if (cf17c[player]) sink(player,13,0)`),
    `0224cc54` (opponent variant, `1 - player`).
  - *id + per-type-helper guards* (14): `0224f74c` `0224d19c` `0224915c`
    `0224bae8` `0224cd9c` `02248f60` `0224d718` `0224fa6c` `0224f370`
    `02251d78` `022523cc` `02252438` `02252d2c` `02253154`.

### The `02253458` family skeleton (banked)

```c
#include "ov002_core.h"
void f(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c
              + (player & 1) * 0x868 + idx * 4 + 288))->id;   /* idx*4 array @ +288 */
    if (<helper(id) guards>) return;       /* 0202xxxx type maps + 021ca440/021ca3f0 */
    func_ov002_02253458(player, 11, idx);  /* (or 13,0 for the count-guard shape) */
}
```

Members vary only by the guard chain (`func_0202e234`/`0202b878`/
`0202eac8`/`0202f430`/`0202e2e0`/`0202ed90`/`0202e258` type maps; constant
compares like `!= 17`, `!= 9`, `== arg1`; the `021ca440`/`021ca3f0`
predicate). The skeleton (field read + sink) is identical — read the
guard chain off the m2c draft and assemble. **This is the cleanest
template family found yet: 16 members, no per-member reverse-engineering
beyond the guard list.**

## Deferred → permuter

| group | members | nuance |
|---|---|---|
| `02253458` key-decode | `0224ea54` `0224bdd4` `0224c620` | the `(base+288)[idx]` grouping + `(hi8<<1)+bit13` key decode → register-numbering divergence (orig holds `cf16c` in r4, mine r0) |
| 0x90 cf1a4+f30 | `021e8b34` `021eb128` `021ebf40` | gotcha-19 add-order on the shared-idx_off f30 read (wave-7 group; scaffolder cracking it) |

The key-decode reg-numbering is the same *class* as the add-order group —
both are reg-alloc/operand-order, the permuter's domain.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 17/17 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4721 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2310 passed |

(`src/overlay002/` gains 17 `.c` + `ov002_core.h`; EUR ov002
`delinks.txt` gains 17 `complete` blocks. No USA/JPN config change.
`find_callsites.py` gave the family worklists.)

## Recommendation for the brain

1. **The `02253458` family has ~20 more members** (159 callers total,
   many `<0x100` simple-shape; `find_callsites func_ov002_02253458`,
   filter unshipped, skip the 159 *loop* callers). The skeleton is locked
   — a wave-9 batch should clear most in one pass.
2. **Open the remaining shared-sink families** `0229ade0` (46),
   `021ff3bc` (37), `021ca2b8` (35) — the header has their proven
   prototypes; same recover-the-sink-shape-once approach.
3. **Route the key-decode + add-order reg-alloc residue to the permuter**
   as one batch — shared root cause.

## Cross-references

- `docs/research/ov002_core.h` (+ brief-286) — the adopted header.
- `docs/research/brief-284-ov002-family-mining.md` — the family map
  (`02253458` = §3 shared-sink family).
- `docs/research/brief-287-coldre-wave7-accessor-family.md` — the 0x868
  family + the add-order deferral this continues.
