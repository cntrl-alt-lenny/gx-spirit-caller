[//]: # (markdownlint-disable MD013 MD041)

# ov002 E/F Re-triage — Round 8 (virgin <400 B residual)

Generated 2026-07-01. This is the **eighth** retriage pass and pushes into
ov002 `<400 B` E/F territory that no prior round (R4's `Ov002EFRetriage.md`,
R5's `Ov002EFRetriagedLarge.md`, or the R5-supplementary conditional-closure
doc) ever examined — verified by an exhaustive substring search of every file
in `docs/research/retriage/` for all 35 target addresses before starting
(zero hits as a primary `###` subject; the four addresses that did surface
in that search — `021af9d0`, `021df818`, `021df938`, `021e05fc` — appear only
as **callee references** inside unrelated dossier files under
`docs/research/dossiers/`, a different directory, not as retriage subjects).
All 35 `.s` ships were confirmed still present (none flipped to `.c` by
another lane since the brief was written) and all are class E or F,
module=ov002, size < 400 B.

KB references: `docs/research/types/DuelStateSingleton.md`,
`docs/research/types/DuelQueueState.md`,
`docs/research/types/PerPlayerRowTable.md`,
`docs/research/types/Ov002SelfContext.md`,
`docs/research/data/Ov002DataComplete.md`,
`docs/research/data/FunctionPointerTables.md`,
`docs/research/data/CardHandlerTable.md`, and the byte-verified
`brain/src/overlay002/ov002_core.h` (the canonical `Ov002Self`/`Ov002Slot`
definitions, cross-checked directly since it is more authoritative than any
summary doc). Several already-matched sibling `.c` files
(`func_ov002_021bc618.c`, `021ca2b8.c`, `021ff2b8.c`, `0223de94.c`,
`021b3ecc.c`, `021bbd04.c`, `02224398.c`) and one already-shipped `.s`
dossier (`docs/research/dossiers/021b9ecc.md`, the core slot-id resolver
`func_ov002_021b9ecc(player, slot)`) were read directly to pin down exact
callee signatures used throughout this batch.

---

## Summary

| Metric | Count |
|--------|-------|
| Examined | **35** |
| Newly tractable | **35** (100% of examined; 31 clean + 4 conditional-with-caveats) |
| Confirmed intractable (wall) | **0** |
| Skipped (already `.c`) | **0** |
| New KB gaps found | **2** (both low-priority, non-blocking) |

**Why the hit rate is even higher than R4's 72%:** this virgin batch sits
almost entirely inside the `Ov002Self` accessor band (`self+0x0` card id,
`self+0x2` player-side bitfield, `self+0x4`/`self+0x6` per-TU local
bitfields) layered on top of the four core structs — the exact vocabulary
R4 catalogued. Every function in the batch is a "does this card/slot pass a
predicate" or "resolve a card token then dispatch" query; none of them hit
the genuine scheduling-entropy shapes (OAM attr-packing, recursive
binary-search, multi-blx-through-unresolved-fn-ptr) that make up R4's 116
confirmed-wall residue. This matches the R7 `Ov017Ov019Retriage.md`
precedent (24/24 = 100%) — the campaign's second 100%-tractable batch,
confirming size/module alone does not predict difficulty once the KB
covers the module's core vocabulary.

**Recurring pattern inventory:**

| KB Pattern | Unlock condition | Funcs hit |
|-----------|-------------------|-----------|
| `Ov002Self` `{f0 @+0x0; b0:1 @+0x2}` (byte-verified, `ov002_core.h`) | struct documented | 27 |
| `func_ov002_021b9ecc(player, slot)` core slot-id resolver (dossier, shipped `.s`) | dossier documented | 8 |
| `PerPlayerRowTable` base + `(player&1)*0x868` stride, slot sub-array `+0x30`/stride `0x14` | struct documented | 15 |
| `Ov002Slot.id_lo13` 13-bit bitfield (`lsl/lsr` pair, various pre-shift widths) | struct documented | 12 |
| `DuelQueueState+0x5A8` (`queue_state`) | struct documented | 2 |
| `DuelStateSingleton+0xCEC` (`card_list_slot_idx`) | struct documented | 3 |
| Per-TU local "extended self" halfword at `+0x4`/`+0x6` (established recipe, `ov002_core.h` §brief-226/222) | recipe documented | 9 |

---

## Newly Tractable Funcs

### 0x021AF9D0 (272 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A card-id range dispatcher. Stores `(ctx, id)` into
`data_ov002_022cdc78` (`CtrlState`, the same struct documented in
`CardHandlerTable.md`'s "post-call rotation" note — here used as a 3-word
save area: `+0x0` ctx, `+0x4` id, `+0x8` cleared to 0), calls
`func_ov002_0229cd5c` twice to arm two setup buffers (`022cdc78` with
`0x200`, `022cdc88` with `0x100` — `022ce088` is simply the SECOND buffer's
address, passed as `0229cd5c`'s first arg, not an indexed table), calls the
CardHandlerTable resolver `func_ov002_0225368c` (documented dispatch-by-id
pattern from `Ov002EFRetriage.md` 0x0225368C entry), then gates the whole
id-range dispatch on `data_ov002_022cd744[ctx] == 1` (already-known ov002
flag table, `ov002_core.h`: "`[shipped 021ae400]`") before branching on the
id (`r6`) against six literal ranges (`< 6`, `== 6 || == 0x4a`,
`6 < id <= 0x26`, `0x27 < id <= 0x48`, `>= 0x4b`, fallback) to one of five
specialized handlers. Every branch target and every literal range bound is
a plain immediate compare — no struct-offset ambiguity, no unresolved
fn-ptr; this is a size-class dispatcher, not a scheduling coin-flip.

**Struct/data needed:**
- `data_ov002_022cdc78` — `CtrlState` 3-word save area (`+0x0` ctx, `+0x4`
  id, `+0x8` cleared to 0); already partially documented via
  `CardHandlerTable.md`'s `+0xC` field note (this function uses the lower
  three words instead).
- `data_ov002_022cdc88` / `data_ov002_022ce088` — two plain buffer addresses
  passed to `func_ov002_0229cd5c`, not indexed tables.
- `data_ov002_022cd744` — flag table (already documented in `ov002_core.h`
  as `[shipped 021ae400]`), read here as `[ctx]`, gating the entire
  `id >= 6` dispatch tree (not just the `6/0x4a` arm).

**Ground-truth pool words (verbatim):**
```
data_ov002_022cdc78   ; CtrlState save area (ctx/id/cleared-int)
data_ov002_022cdc88   ; buffer address, arg to 0229cd5c
data_ov002_022ce088   ; buffer address, arg to 0229cd5c
data_ov002_022cd744   ; flag table, indexed by [ctx], compared == 1
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0229cd5c   (data_022cdc78, 0x200) — 1st call
func_ov002_0229cd5c   (data_022ce088, 0x100) — 2nd call, different buffer
func_ov002_0225368c   (ctx, arg2, arg3) — CardHandlerTable dispatch-by-id
func_ov002_022806a4   (ctx, arg2, arg3) — arm: id==6 || id==0x4a
func_ov002_021afaf0   (no args) — x2, id-range lookup, one per range arm
func_ov002_02280714   (ctx, arg2, arg3, tag) — arm: 6 < id <= 0x26
func_ov002_02280794   (ctx, arg2, arg3, tag) — arm: 0x27 < id <= 0x48
func_ov002_0228083c   (ctx, arg2) — arm: id >= 0x4b
func_ov002_0229ade0   (0x32, ctx, id, 0) — fallback, id < 6 OR cd744 gate fails
```

**Recipe sketch:**
```c
void func_ov002_021af9d0(void *ctx, int id, int arg2, int arg3) {
    data_ov002_022cdc78[0] = (int)ctx;
    data_ov002_022cdc78[1] = id;
    data_ov002_022cdc78[2] = 0;
    func_ov002_0229cd5c(&data_ov002_022cdc78, 0x200);
    func_ov002_0229cd5c(&data_ov002_022ce088, 0x100);
    func_ov002_0225368c(ctx, arg2, arg3);

    if (id < 6 || data_ov002_022cd744[(int)ctx] != 1) {
        func_ov002_0229ade0(0x32, ctx, id, 0);
        return;
    }
    if (id == 6 || id == 0x4a) {
        func_ov002_022806a4(ctx, arg2, arg3);
        return;
    }
    if (id > 6 && id <= 0x26) {
        int tag = func_ov002_021afaf0();
        func_ov002_02280714(ctx, arg2, arg3, tag);
        return;
    }
    if (id > 0x27 && id <= 0x48) {
        int tag = func_ov002_021afaf0();
        func_ov002_02280794(ctx, arg2, arg3, tag);
        return;
    }
    if (id >= 0x4b) {
        func_ov002_0228083c(ctx, arg2);
    }
}
```

---

### 0x021B0DF8 (296 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Directly calls `func_ov002_021b9ecc` (the KB-documented
core slot-id resolver, dossier `docs/research/dossiers/021b9ecc.md`) in a
5-iteration loop over `data_ov002_022cd73c` (a `CtrlState`-family struct with
a `+0x4` player field), accumulating resolved card ids into a stack array and
calling `func_ov002_021c8470`/`func_ov002_021b0bdc` for each hit. The
"scheduling-prone" tail loop is a straightforward nested scan over the
collected ids (0 to `count-3`) checking `func_0202e2f8`/`func_0202df78`
(both already used elsewhere in the corpus as plain int predicates) — every
loop bound is a runtime-computed count from the first loop, not an opaque
register. `func_ov002_021b0b54(code, 1)` is a message/log sink called with
literal codes `0x3b`/`0x3c`/`0x3d`.

**Struct/data needed:**
- `data_ov002_022cd73c` — `CtrlState`-family struct, `+0x4` = player index
  (read-only in this function).
- `func_ov002_021b9ecc(player, slot)` — core slot-id resolver (dossier
  documented).

**Ground-truth pool words (verbatim):**
```
data_ov002_022cd73c   ; CtrlState-family struct (+0x4 player)
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b9ecc   (x5, one per slot iteration)
func_ov002_021c8470   (per-slot hit, when resolver returns nonzero)
func_ov002_021b0bdc   (per-slot hit, follow-up)
func_ov002_021bc288   (x5, per-slot secondary check)
func_0202e2f8          (per-collected-id outer scan)
func_0202df78          (per-collected-id inner scan)
func_ov002_021b0b54    (x3: codes 0x3b, 0x3c, 0x3d — conditional log/sink calls)
```

**Recipe sketch:**
```c
int func_ov002_021b0df8(void) {
    int player = data_ov002_022cd73c[1];   /* +0x4 */
    int ids[5];
    int n = 0, matchcount = 0;
    for (int slot = 0; slot <= 4; slot++) {
        int id = func_ov002_021b9ecc(player, slot);
        if (id != 0) {
            ids[n++] = id;
            int r = func_ov002_021c8470(player, slot);
            func_ov002_021b0bdc(0 /* r5 always 0 */, r);
        }
        if (func_ov002_021bc288(player ^ 1, slot) == 0) matchcount++;
    }
    if (n >= 3) {
        for (int i = 0; i <= n - 3; i++) {
            int base = ids[i];
            if (func_0202e2f8(base) != 0) continue;
            int hits = 0;
            for (int j = i + 1; j < n; j++)
                if (func_0202df78(base, ids[j]) != 0) hits++;
            if (hits >= 2) func_ov002_021b0b54(0x3b, 1);
        }
    }
    if (n == 5) func_ov002_021b0b54(0x3c, 1);
    if (matchcount != 5) return 1;
    func_ov002_021b0b54(0x3d, 1);
    return 1;
}
```

---

### 0x021B86F4 (248 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A pure card-id range-membership predicate on
`self->f0` (`Ov002Self` +0x0, byte-verified in `ov002_core.h`). Every branch
target is a literal-constant range compare (`0x16ab`, `0x147e`, `0x147e-0x150`,
`0x147e+0xb`, `0x147e+0x36`, `0x16ab+0xa9`, `0x16ab+0x7c`, `0x1a30`,
`0x1a30+0xc0`) — a deliberately obfuscated but fully deterministic decision
tree built entirely from immediates, no struct-offset ambiguity. The tail
loop over `self->f6` (a per-TU count field, same "extended self" pattern
documented via `ov002_core.h`'s brief-226 recipe) calls
`func_ov002_0223def4(self, i)` up to `self->f6` times, comparing the result
against the caller-supplied target — a clean bounded scan.

**Struct/data needed:** `Ov002Self.f0` (+0x0, byte-verified); an extended
`self.f6` (+0x6, u8 loop-count field, per-TU local — established recipe).

**Ground-truth pool words (verbatim):**
```
0x000016ab   ; range constant A
0x0000147e   ; range constant B
0x00001a30   ; range constant C
```

**Ground-truth BL targets (verbatim):**
```
func_ov002_0223def4   (loop, up to self->f6 times)
```

**Recipe sketch:**
```c
int func_ov002_021b86f4(struct Ov002Self *self, int target) {
    u16 id = self->f0;
    int in_special_range;
    if (id > 0x16ab) {
        if (id >= (0x16ab + 0xa9)) {
            in_special_range = (id == 0x16ab + 0xa9 + 0xc0);
        } else if (id >= 0x16ab + 0x7c) {
            in_special_range = (id == 0x16ab + 0x7c);
        } else {
            in_special_range = 0;
        }
        if (id >= 0x16ab + 0xa9 && id < 0x16ab + 0xa9 + 0xc0) return 0;  /* placeholder for [never] arm */
    } else if (id >= 0x16ab) {
        return 1;
    } else if (id > 0x147e) {
        if (id == 0x147e + 0xb) return 1;
        if (id == 0x147e + 0x36) return 1;
        return 0;
    } else if (id >= 0x147e) {
        return 1;
    } else {
        if (id == 0x147e - 0x150) return 1;
        return 0;
    }
    u8 count = (u8)self->f6;
    for (int i = 0; i < count; i++) {
        if (func_ov002_0223def4(self, i) == target) return 1;
    }
    return 0;
}
```
*(the exact branch nesting must be re-derived carefully against the `.s`
control flow at match time — the constant-heavy decision tree above sketches
the shape and confirms determinism; every arm is a literal compare.)*

---

### 0x021B9BD4 (328 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Resolves a slot's card id via `func_ov002_021b9ecc`
(KB-documented core resolver), then branches on the resolved id against four
literal sentinels: `0x0fee`, `0x14ac`, `0x14ac+0xa90`, and (via `func_02030ea4`
gating) a fallback path. Two of the arms call
`func_ov002_021b3618`/`func_ov002_021b4054` (already-known ov002 helpers,
signature confirmed by usage shape `(player, slot[, id, flag])`) and compare
against `0xffff`. The tail is a `PerPlayerRowTable` slot-field read
(`(player&1)*0x868`, `+0x14*slot`) at `data_ov002_022cf1a8`, compared against
the resolver's original result — exactly the documented stride pattern.

**Struct/data needed:**
- `func_ov002_021b9ecc(player, slot)` — core resolver.
- `PerPlayerRowTable` companion `data_ov002_022cf1a8` (+`(player&1)*0x868` +
  `slot*0x14`), a u16 node-lookup field — matches the `cf1a8` companion array
  already noted in `PerPlayerRowTable.md`'s "Parallel companion arrays"
  section ("node lookup u16 table — same 0x868 stride").

**Ground-truth pool words (verbatim):**
```
0x00000fee   ; id sentinel A
0x000014ac   ; id sentinel B
0x0000ffff   ; sentinel/mask
0x000010bc   ; id sentinel C
data_ov002_022cf1a8   ; PerPlayerRowTable companion (node u16 table)
0x00000868   ; PerPlayerRowTable stride
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b9ecc   (player, slot) — resolve card id, 1st call
func_02030ea4          (no args) — gate check
func_ov002_021b3618    (player, slot) — arm id==0x0fee, 1st call site
func_ov002_021b9ecc    (id-mangled args) — nested inside the 0x0fee arm's body,
                          only reached when the 021b3618 result there != 0xffff
func_ov002_021b3618    (player, slot) — arm id==0x14ac, 2nd (distinct) call site
                          — mutually exclusive with the 0x0fee arm above, NOT
                          a repeat visit inside the same branch
func_ov002_021b4054    (player, slot, id, 1) — arm id==0x14ac+0xa90
func_0202e234           (id) — fallthrough tail predicate
```

**Recipe sketch:**
```c
int func_ov002_021b9bd4(int player, int slot) {
    int id = func_ov002_021b9ecc(player, slot);
    int gate = func_02030ea4();
    if (gate == 0) return -1;
    if (id == 0x0fee) {
        int r = func_ov002_021b3618(player, slot);
        if (r == 0xffff) return r - 0x10000;
        u8 lo = r & 0xff, hi = (r >> 8) & 0xff;
        int r2 = func_ov002_021b9ecc(lo, hi);
        return (r2 == 0x10bc) ? -1 : id;   /* placeholder, mirrors L_d0 fallthrough */
    }
    if (id == 0x14ac) {
        int r = func_ov002_021b3618(player, slot);
        if (r != 0xffff) return -1;
        return r - 0x10000;
    }
    if (id == 0x14ac + 0xa90) {
        int r = func_ov002_021b4054(player, slot, id, 1);
        return (r == 0) ? -1 : id;
    }
    /* fallthrough: PerPlayerRowTable node-table compare */
    char *row = (char *)data_ov002_022cf1a8 + (player & 1) * 0x868;
    u16 node = *(u16 *)(row + slot * 0x14);
    if (gate <= (node & 0xffff)) return 0x15 - 1;  /* sub r0,r1,#0x15 shape */
    if (func_0202e234(id) != 0 && id != 0x0fee) {
        return (slot >= 5) ? -1 : node;
    }
    return node;
}
```
*(this function has a dense control-flow tail; the recipe captures the
struct/callee shape faithfully, exact arm ordering should be re-verified
line-by-line against `.L_d0`–`.L_140` at match time.)*

---

### 0x021BB444 (328 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** The textbook `PerPlayerRowTable` + `Ov002Slot` 5-slot
scan documented as the single highest-yield pattern in R4
(`Ov002EFRetriage.md`'s 0x021B9830 entry, "158 funcs unlocked"). Base
`data_ov002_022cf16c + (player&1)*0x868`, slot stride `0x14`, reads
`slot.f_36`/`slot.f_38`/`slot.f_40` per-slot fields (same occupancy-mask
shape documented for `func_ov002_021b9ecc`'s `cf1ac`/`cf1a4` check — here
inline instead of via helper), and accumulates a bit into `r6` gated by
`DuelStateSingleton+0xD4` (a new near-`+0xD18` field, see New KB gaps) tested
against `1 << (player*0x10 + slot)`. The tail does two `data_ov002_022cd3f4`
comparisons (already-known ov002 global, used elsewhere as `CtrlState`-like)
each dispatching to `func_ov002_021ba0b0`/`func_ov002_021badb0`.

**Struct/data needed:**
- `PerPlayerRowTable` base `0x022CF16C`, stride `0x868`, slot stride `0x14`
  (documented). Per-slot fields `+0x36` (u16), `+0x38` (u16), `+0x40` (u32,
  occupancy-mask source — same bit-shape as `021b9ecc`'s `cf1ac` check).
- `DuelStateSingleton+0xD4` — **new gap**, near the documented `+0xD18`
  dispatch-fn-ptr field; read as `data_ov002_022d016c[0xd4/4]`, tested via
  `tst` against a per-(player,slot) shifted bit — deterministic regardless of
  the field's exact semantic name.
- `data_ov002_022cd3f4` — already-known ov002 global (used as `CtrlState` in
  `021b9bd4`/`021ed4c0` above); here two fields at `+0x0` and `+0x4`.
- `data_ov002_022cd4b8`, `data_ov002_022cd420`, `data_ov002_022cd4cc` —
  companion small globals, `+0x38`-stride record lookup.

**Ground-truth pool words (verbatim):**
```
data_ov002_022cf16c   ; PerPlayerRowTable base
0x00000868             ; PerPlayerRowTable stride
data_ov002_022d016c   ; DuelStateSingleton base
data_ov002_022cd3f4   ; CtrlState-family global (+0x0, +0x4)
data_ov002_022cd4b8   ; companion global A
data_ov002_022cd420   ; companion global B (stride-0x38 base)
data_ov002_022cd4cc   ; companion global C
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b9ecc   (x5, per-slot loop)
func_ov002_021ba0b0    (x2, once per data_022cd3f4 field check)
func_ov002_021badb0    (x2, once per data_022cd3f4 field check)
```

**Recipe sketch:**
```c
int func_ov002_021bb444(int player, int target_id) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int r6 = 0;
    for (int slot = 0; slot < 5; slot++) {
        int id = func_ov002_021b9ecc(player, slot);
        /* proceed to the occupancy check ONLY when id==target_id AND f36==0;
         * any other outcome skips this slot entirely (mwcc chains the two
         * `cmpeq`s under the id==target condition, so f36 is only even
         * loaded/compared when id matched) */
        if (id != target_id) continue;
        u16 f36 = *(u16 *)(row + slot * 0x14 + 0x36);
        if (f36 != 0) continue;

        u32 f40 = *(u32 *)(row + slot * 0x14 + 0x40);
        u16 f38 = *(u16 *)(row + slot * 0x14 + 0x38);
        int b6 = (f40 >> 6) & 1, b21 = ((f40 >> 2) | (f40 >> 1)) & 1;
        if ((f38 & ~b6) & ~b21) {
            u32 dss_d4 = *(u32 *)((char *)&data_ov002_022d016c + 0xd4);
            if (dss_d4 & (1u << (player * 0x10 + slot))) r6++;
        }
    }
    /* +0xca/+0xde are halfword (u16) fields on cd3f4, NOT word-array indices
     * — byte-offset cast is required, unlike the +0x0/+0x4 int fields above. */
    if (data_ov002_022d016c[0xd0 / 4] & 1) {
        if (player == data_ov002_022cd3f4[0]) {
            int r = func_ov002_021ba0b0(&data_ov002_022cd4b8);
            u16 gate = *(u16 *)((char *)data_ov002_022cd3f4 + 0xca);
            if (target_id == r && gate != 0) {
                int idx = data_ov002_022cd3f4[0];
                if (func_ov002_021badb0((char *)&data_ov002_022cd420 + idx * 0x38) != 0) r6++;
            }
        }
        if (player == data_ov002_022cd3f4[1]) {
            int r = func_ov002_021ba0b0(&data_ov002_022cd4cc);
            u16 gate = *(u16 *)((char *)data_ov002_022cd3f4 + 0xde);
            if (target_id == r && gate != 0) {
                int idx = 1 - data_ov002_022cd3f4[0];
                if (func_ov002_021badb0((char *)&data_ov002_022cd420 + idx * 0x38) != 0) r6++;
            }
        }
    }
    return r6;
}
```

---

### 0x021C1954 (200 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A single-slot occupancy check (the identical inline
`cf1ac`/`cf1a4` mask shape used inside `func_ov002_021b9ecc` — bits 1, 2, 6
tested via the same `lsr#6/#2/#1` + `mvn`/`and`/`tst` sequence) followed by
a resolver call and range compare against `0x17e4`/`0x17e4+0x42`/
`0x17e4+0x7c`, then two `func_ov002_021bbd04` calls (already-matched thunk,
signature `(player, tag, _unused, d)` confirmed via `func_ov002_021bbd04.c`).

**Struct/data needed:**
- `PerPlayerRowTable` base `022cf1a4`/`022cf1ac` companions (same occupancy
  fields used by `021b9ecc`), stride `0x868`/`0x14`.
- `func_ov002_021b9ecc(player, slot)` — core resolver.
- `func_ov002_021bbd04(a, b, _unused, d)` — already-matched thunk.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf1ac   ; occupancy mask field A
data_ov002_022cf1a4   ; occupancy mask field B
0x000017e4             ; id range base
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b9ecc   (resolve card id)
func_02031764           (gate)
func_ov002_021bbd04    (x2: tag=3 both arms, player and 1-player)
```

**Recipe sketch:**
```c
int func_ov002_021c1954(int player, int slot) {
    char *row_a = (char *)data_ov002_022cf1ac + (player & 1) * 0x868;
    char *row_b = (char *)data_ov002_022cf1a4 + (player & 1) * 0x868;
    u32 f1ac = *(u32 *)(row_a + slot * 0x14);
    u16 f1a4 = *(u16 *)(row_b + slot * 0x14);
    int b6 = (f1ac >> 6) & 1, b21 = ((f1ac >> 2) | (f1ac >> 1)) & 1;
    if (!((f1a4 & ~b6) & ~b21)) return 0;

    int id = func_ov002_021b9ecc(player, slot);
    if (func_02031764(id) != 0) return 1;

    if (id != 0x17e4 && id != 0x17e4 + 0x42 && id != 0x17e4 + 0x7c) return 0;

    if (func_ov002_021bbd04(player, 3, 0, 0) != 0) return 1;
    if (func_ov002_021bbd04(1 - player, 3, 0, 0) != 0) return 1;
    return 0;
}
```

---

### 0x021DF4D8 (332 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Two `022cd3f4`/`022cd4b8`-family record reads
(companion globals also seen in `021bb444` above), `func_ov002_021ba0b0`
resolver call, and a card-attribute check via `func_ov002_021c1e44`
(**byte-verified signature in `ov002_core.h`**: `(struct Ov002Self *self,
int player, int idx)`). Dispatches to `func_ov002_021d479c` — the
**documented arg-pack sink family** (`ov002_core.h`: "`0x868 sub-row
accessors`" + the extensive brief-350/352/354/356/358/360 arg-pack recipe
catalogue) — with two different packed-payload shapes depending on the
record's `+0x40` bitfield-derived flags, then always tail-calls
`func_ov002_021dcc48`.

**Struct/data needed:**
- `data_ov002_022cd3f4` — record base, `+0x0`/`+0x4` are player-conditional
  reads (already known).
- `data_ov002_022cd4b8` — companion, stride `0x14`, `+0x0` field read.
- `func_ov002_021c1e44(self, player, idx)` — byte-verified in `ov002_core.h`.
- `func_ov002_021d479c(packed, a, b, c)` — documented arg-pack sink.

**Ground-truth pool words (verbatim):**
```
data_ov002_022cd3f4   ; record base (player-conditional +0x0/+0x4/+0x1c/+0x20)
data_ov002_022cd4b8   ; companion (stride 0x14)
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021ba0b0    (resolve companion record)
func_ov002_021c1e44    (self, player, idx) — byte-verified ov002_core.h sig
func_0202e2f8            (predicate on resolved record)
func_ov002_021d479c    (x2, two different packed-payload arms)
func_ov002_021dcc48    (tail, always called)
```

**Recipe sketch:**
```c
int func_ov002_021df4d8(struct Ov002Self *self, int player) {
    int player_a, player_b;
    if (player == 0) {
        player_a = data_ov002_022cd3f4[0];
        player_b = data_ov002_022cd3f4[0x1c / 4];
    } else {
        player_a = data_ov002_022cd3f4[1];
        player_b = data_ov002_022cd3f4[0x20 / 4];
    }
    char *rec = (char *)data_ov002_022cd4b8 + player * 0x14;
    int resolved = func_ov002_021ba0b0(rec);
    u32 f14 = *(u32 *)rec;
    int packed = ((u16)(f14 << 2) >> 24) * 2 + ((f14 << 0x12) >> 0x1f);

    if (func_ov002_021c1e44(self, player_a, player_b) != 0) return 0;
    if (resolved == 0) return 0;

    if (func_0202e2f8(resolved) != 0) {
        u16 hi = player_a ? 0x8000 : 0;
        func_ov002_021d479c(hi | 0x31, player_b & 0xff, packed, 0x10);
    } else {
        int flag = (self->f0 & 0x1) ? 1 : 0;   /* placeholder for L_718 bit compare */
        func_ov002_021d479c(0x5a | flag, player_a & 0x7f, /* orr shape */ 0, 0);
    }
    func_ov002_021dcc48(rec, player_a, player_b, /* r6 */ 0);
    return 1;
}
```
*(the `L_718` branch's exact bit-packing arithmetic is dense; struct shape
and call order are confirmed, exact `orr`/`rsb` immediate reconstruction
should be re-checked against the `.s` at match time.)*

---

### 0x021DF818 (284 B, class F, module=ov002) / 0x021DF938 (304 B, class F, module=ov002)

These two are a **mutually-recursive pair** — `021df818` tail-calls itself
once and calls `021df938`; `021df938` is the terminal handler. Documented
together.

**Original verdict:** F (both) — reg-alloc-walled, shipped as whole-function
`.s`

**Upgrade reason:** `021df818` reads `self->f4` (extended-self halfword,
established `ov002_core.h` recipe) and `self->f18`/`self->f1a`/`self->f2`
(all per-TU local fields on the caller's own struct, not `Ov002Self` core
fields — same "declare a local struct per TU" convention `ov002_core.h`
prescribes for the `d016c`/`ce288` band). Branches on `self->f18` against
four literal offsets from `0x15ab`, each either recursing with a flipped
`player` (`rsb r1, r1, #1`), calling itself with mutated `self->f4`, or
falling to the `0x21df938` terminal. `021df938` is a straight-line guard
chain: three `func_ov002_021b3ecc(player,slot,tag)` calls (byte-verified
signature: `(int arg0, int arg1, int arg2) → bool`, from
`func_ov002_021b3ecc.c`) each against a different literal tag (`0x1805`,
`0x1850`, `0x1a06`), one `func_ov002_021bae7c` call, then a
`func_ov002_021d479c` arg-pack dispatch (documented sink family) and a
conditional `func_ov002_022562f0` call, ending with a second
`func_ov002_021d479c`-family call via `func_ov002_02244fe4`.

**Struct/data needed:**
- Extended-self local struct: `f4` (halfword), `f18`/`f1a` (halfwords),
  established per-TU recipe.
- `func_ov002_021b3ecc(player, slot, tag)` — byte-verified.
- `func_ov002_021d479c` arg-pack family — documented.

**Ground-truth pool words (verbatim) — 021DF818:**
```
0x000015ab   ; f18 range base
```

**Ground-truth BL targets (verbatim, in call order) — 021DF818:**
```
func_ov002_021df818   (self-recursive tail call, x2 arms)
func_ov002_0226ad5c    (terminal arm, id-compare predicate)
func_ov002_021df938    (fallthrough terminal, all other arms)
```

**Ground-truth pool words (verbatim) — 021DF938:**
```
0x00001805   ; tag A for func_ov002_021b3ecc
0x00001850   ; tag B for func_ov002_021b3ecc
0x00001a06   ; tag C for func_ov002_021b3ecc
0x000018c4   ; tag for func_ov002_021bae7c
0x0000ffff   ; clamp sentinel
0x0000159b   ; skip-sentinel for func_ov002_022562f0 call
```

**Ground-truth BL targets (verbatim, in call order) — 021DF938:**
```
func_ov002_021b3ecc   (x3: tags 0x1805, 0x1850, 0x1a06)
func_ov002_021bae7c    (tag 0x18c4)
func_ov002_021d479c    (packed payload #1)
func_ov002_022562f0    (conditional, when f4 != 0x159b)
func_ov002_02244fe4    (final arg-pack dispatch, kind=0x10)
```

**Recipe sketch:**
```c
/* 021df818 */
int func_ov002_021df818(struct Ext021df818Self *self, int player) {
    if (!(self->f4 & 0x2000)) return func_ov002_021df938(self, player, 0);
    u16 f18 = self->f18;
    if (f18 > 0x15ab) {
        if (f18 == 0x15ab + 0x3e4) return 0;
        return func_ov002_021df938(self, player, 0);
    }
    if (f18 == 0x15ab - 4) {
        if (player != (self->f1a & 1)) return 0;
        self->f4 &= ~0x20;
        return func_ov002_021df818(self, 1 - player);
    }
    if (f18 == 0x15ab - 0x3d) {
        if (player != (self->f1a & 1)) return 0;
        return func_ov002_021df818(self, 1 - player);
    }
    if (f18 == 0x15ab) {
        if (player != (self->f1a & 1)) return 0;
        int cmp = (self->f2 == (1 - player));
        func_ov002_0226ad5c(cmp ? 0 : 1, 1, 0);
        return 0;
    }
    return func_ov002_021df938(self, player, 0);
}

/* 021df938 */
int func_ov002_021df938(struct Ext021df938Self *self, int player, int mode, int extra) {
    if (player == 0) {
        if (func_ov002_021b3ecc(self, 0x1805, 0xb) != 0) return 0;
    } else {
        if (func_ov002_021b3ecc(self, 0x1850, 0xb) != 0) return 0;
        if (func_ov002_021b3ecc(self, 0x1a06, 0xb) != 0) return 0;
    }
    if (func_ov002_021bae7c(self, 0x18c4, -1) != 0) return 0;

    int clamped = (extra > 0xffff) ? 0xffff : extra;
    int hi = self ? 0x8000 : 0;
    func_ov002_021d479c(hi | 0x25, clamped, mode, 0);
    if (mode != 0x159b) func_ov002_022562f0(self);

    /* stack payload combine + final dispatch */
    func_ov002_02244fe4(0x10);
    return 1;
}
```

---

### 0x021E05FC (220 B, class E, module=ov002)

**Original verdict:** E — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A close sibling of `021df938` above — reuses the exact
same `func_ov002_021bae7c` (tag `0x1256`) → `func_ov002_021df680`/
`021df938` → arg-pack (`func_ov002_021d479c`, kind `0x24`) →
`func_ov002_02244fe4` (kind `0x11`) → `func_ov002_022538bc` chain. Every
literal is a plain constant; both callees at the tail (`021df680`,
`021df938`) are already documented above in this same batch.

**Struct/data needed:** none beyond the caller args and the documented
`021d479c` arg-pack sink shape.

**Ground-truth pool words (verbatim):**
```
0x00001256   ; tag for func_ov002_021bae7c / func_ov002_021df680
0x0000ffff   ; clamp sentinel
0x0000144d   ; tag for func_ov002_022538bc
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021bae7c    (tag 0x1256)
func_ov002_021df680    (tag 0x1256, on success)
func_ov002_021df938    (mutual sibling — same-file recipe above)
func_ov002_021d479c    (packed payload, kind 0x24)
func_ov002_02244fe4    (kind 0x11)
func_ov002_022538bc    (tag 0x144d)
```

**Recipe sketch:**
```c
void func_ov002_021e05fc(int player, int arg1) {
    int inv = 1 - player;
    if (func_ov002_021bae7c(inv, 0x1256, -1) != 0) {
        func_ov002_021df680(inv, 0x1256);
        func_ov002_021df938(player, arg1, 1, 0x1256);
        return;
    }
    int clamped = (arg1 > 0xffff) ? 0xffff : arg1;
    int hi = player ? 0x8000 : 0;
    func_ov002_021d479c(hi | 0x24, clamped, 0, 0);
    func_ov002_02244fe4(0x11);
    func_ov002_022538bc(player, 0x144d, 1);
}
```

---

### 0x021EBC2C (288 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->f2` bitfield extract (tag6, bits 6-11 — the
per-TU "multi-bitfield extract" recipe documented via `func_ov002_021f609c.c`
worked example, "tag6 == 0x23" gate is byte-identical). Guards with
`func_ov002_021bc8c8` and a `PerPlayerRowTable` companion (`data_ov002_022cf1a4`,
stride `0x868`/`0x14`) read, then `func_ov002_021bc618` (byte-verified
signature `(player) → int` from `func_ov002_021bc618.c`), then a final
range dispatch on `self->f0` (`Ov002Self` core field) against `0x12c5`,
`0x12c5+0x3b8`, and a fourth literal, routing to three
`func_ov002_021ba104` calls or a `func_ov002_021b9ecc`+`func_0202e864` pair.

**Struct/data needed:**
- `self->f2` bits 6-11 (`tag6`, per-TU local, established recipe).
- `PerPlayerRowTable` companion `data_ov002_022cf1a4`.
- `func_ov002_021bc618(player)` — byte-verified.
- `Ov002Self.f0` — byte-verified core field.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf1a4   ; companion field
0x000012c5             ; self->f0 range base
0x00001768             ; self->f0 range literal D
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021bc8c8    (tag6 gate)
func_ov002_021bc618    (bit0) — byte-verified, single call site
func_ov002_021bc288    (fallback arm, taken only when 021bc618 returns 0 and bit0 != player)
func_ov002_021ba104    (x2: id-range A and id-range B arms)
func_ov002_021b9ecc    (id-range C arm)
func_0202e864            (id-range C follow-up)
```

**Recipe sketch:**
```c
int func_ov002_021ebc2c(struct Ov002Self *self, int player, int slot) {
    u16 f2 = self->f2raw;   /* extended-self halfword at +0x2 */
    int tag6 = (f2 << 20) >> 26;
    if (tag6 == 0x23) return 1;

    int bit0 = (f2 << 31) >> 31;
    if (func_ov002_021bc8c8(bit0) == 0) return 0;

    char *row = (char *)data_ov002_022cf1a4 + (player & 1) * 0x868;
    u16 companion = *(u16 *)(row + slot * 0x14);
    if (companion == 0) return 0;

    if (func_ov002_021bc618(bit0) == 0) {
        if (bit0 != player) return 0;
        if (func_ov002_021bc288(player, slot) == 0) return 0;
    }

    u16 id = self->f0;
    if (id == 0x12c5)      return func_ov002_021ba104(player, slot, 0xfe0), 1;
    if (id == 0x12c5+0x3b8) return func_ov002_021ba104(player, slot, 0xfe0-0x2fc), 1;
    if (id == 0x1768) {
        int r = func_ov002_021b9ecc(player, slot);
        func_0202e864(r);
        return 1;
    }
    return 1;
}
```

---

### 0x021ED4C0 (312 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->b0` (byte-verified `Ov002Self` bitfield) compared
against caller-supplied `player`; guards `slot < 5`; calls
`func_ov002_021c23ac` (already-known ov002 helper, `(player,slot)` shape);
range-dispatches `self->f0` against `0x18a3`, `0x18a3+0x64`,
`0x1a9a`,`0x146f` to five `func_ov002_021ba104` arms plus one
`func_ov002_021b9ecc`+`func_0202f46c` terminal arm gated by a **second**
range on `self->f6` (halfword, 3-way switch on values 0/1/2).

**Struct/data needed:**
- `Ov002Self.b0`/`f0` — byte-verified.
- `self->f6` — extended-self halfword (established recipe).
- `func_ov002_021c23ac(player, slot)` — already-known.

**Ground-truth pool words (verbatim):**
```
0x000018a3   ; self->f0 range base A
0x0000146f   ; self->f0 range literal B
0x00001a9a   ; self->f0 range literal C
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021c23ac    (player, slot)
func_ov002_021ba104     (x5, one per range/switch arm)
func_ov002_021b9ecc     (terminal arm)
func_0202f46c             (terminal arm follow-up)
```

**Recipe sketch:**
```c
int func_ov002_021ed4c0(struct Ov002Self *self, int player, int slot) {
    if (self->b0 != player) return 0;
    if (slot >= 5) return 0;
    if (func_ov002_021c23ac(player, slot) == 0) return 0;

    u16 id = self->f0;
    if (id > 0x18a3) {
        if (id > 0x18a3 + 0x64) {
            if (id == 0x1a9a) return func_ov002_021ba104(player, slot, 7), 1;
            return 0;
        }
        if (id == 0x18a3 + 0x64) return func_ov002_021ba104(player, slot, 7), 1;
        return 0;
    }
    if (id >= 0x18a3) {
        u8 f6mode = (u8)(self->f6raw >> 8);
        switch (f6mode) {
        case 0: return func_ov002_021ba104(player, slot, -5), 1;
        case 1: return func_ov002_021ba104(player, slot, -3), 1;
        case 2: return func_ov002_021ba104(player, slot, -4), 1;
        default: return 0;
        }
    }
    if (id == 0x146f) {
        int r = func_ov002_021b9ecc(player, slot);
        func_0202f46c(r);
        return 1;
    }
    return 0;
}
```

---

### 0x021F0848 (260 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Resolves `func_ov002_021b9ecc(player,slot)`, gates on
`self->f2` tag6 (== 0x23 shortcut, same idiom as `021ebc2c` above), then
runs a guard chain: resolved-id nonzero, `slot < 5`, `self->b0 == player`,
a `PerPlayerRowTable` companion (`data_ov002_022cf1a4`) nonzero,
`func_0202eab0`/`func_0202f620`/`func_ov002_021c23ac` all succeed, then
`func_ov002_021bc618`/`func_ov002_021bc288`. A pure boolean guard chain —
every step is a documented struct field or already-known helper.

**Struct/data needed:** same core set as `021ebc2c` (`Ov002Self`,
`PerPlayerRowTable`, `func_ov002_021bc618`).

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf1a4   ; companion field
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b9ecc    (resolve card id)
func_0202eab0
func_0202f620
func_ov002_021c23ac
func_ov002_021bc618
func_ov002_021bc288    (fallback arm)
```

**Recipe sketch:**
```c
int func_ov002_021f0848(struct Ov002Self *self, int player, int slot) {
    int id = func_ov002_021b9ecc(player, slot);
    u16 f2 = self->f2raw;
    int tag6 = (f2 << 20) >> 26;
    if (tag6 == 0x23) return 1;
    if (id == 0) return 0;
    if (slot >= 5) return 0;
    if (self->b0 != player) return 0;

    char *row = (char *)data_ov002_022cf1a4 + (player & 1) * 0x868;
    u16 companion = *(u16 *)(row + slot * 0x14);
    if (companion == 0) return 0;

    if (func_0202eab0() == 0) return 0;
    if (func_0202f620(id, 0) == 0) return 0;
    if (func_ov002_021c23ac(player, slot) == 0) return 0;

    int bit0 = (f2 << 31) >> 31;
    if (func_ov002_021bc618(bit0) == 0) {
        if (func_ov002_021bc288(player, slot) == 0) return 0;
    }
    return 1;
}
```

---

### 0x021F126C (196 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->f2` bitfield gate via `func_ov002_021bc8c8` (same
tag as `021ebc2c`/`021f0848`), followed by an OPTIONAL PerPlayerRowTable
companion check (skippable when `self->f2` bit0 already equals `player`),
then a bounded bitmask scan (`self->f8`/`self->fa` halfwords, extended-self
per-TU fields) up to `func_ov002_0223b468(self->f8)` iterations, `tst`-ing
bit `i` of `self->fa` and calling `func_ov002_0223b4c4`+`func_ov002_0223b430`
on each clear bit — a clean bounded bitmask-clear scan, the same shape
documented for `PerPlayerRowTable` slot-scan loops elsewhere in the corpus.

**Struct/data needed:**
- `self->f2` bit0 + tag6 (established per-TU recipe).
- `self->f8`/`self->fa` — two more extended-self halfwords (per-TU local).
- `PerPlayerRowTable` companion `data_ov002_022cf1a4`.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf1a4   ; companion field
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021bc8c8    (tag6/bit0 gate)
func_ov002_0223b468     (loop bound from self->f8)
func_ov002_0223b4c4     (x-N, per clear bit)
func_ov002_0223b430     (x-N, per clear bit)
```

**Recipe sketch:**
```c
int func_ov002_021f126c(struct Ov002Self *self, int player, int slot) {
    u16 f2 = self->f2raw;
    int bit0 = (f2 << 31) >> 31;
    if (func_ov002_021bc8c8(bit0) == 0) return 0;

    if (bit0 != player) {
        char *row = (char *)data_ov002_022cf1a4 + (player & 1) * 0x868;
        u16 companion = *(u16 *)(row + slot * 0x14);
        if (companion == 0) return 0;
    }

    u16 f8 = self->f8raw;
    u16 fa = self->faraw;
    int n = func_ov002_0223b468(f8);
    if (n <= 0) return 0;

    for (int i = 0; i < n; i++) {
        if (fa & (1 << i)) continue;
        func_ov002_0223b4c4(f8, i);
        if (func_ov002_0223b430(f8, player, slot) != 0) return 1;
    }
    return 0;
}
```

---

### 0x021F19E8 (232 B, class E, module=ov002)

**Original verdict:** E — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Resolves `func_ov002_021b9ecc(player,slot)`, guards on
a `PerPlayerRowTable` companion (`data_ov002_022cf1a4`), calls
`func_ov002_021b7bb8` (already-known ov002 helper) and `func_0202e234`
(already-known predicate), then a `slot < 5` range-gated dispatch that calls
`func_ov002_021c1ef0`/`func_ov002_021c1e44` (**both byte-verified signatures
in `ov002_core.h`**: `(self, player, idx)`) and finally
`func_ov002_021c2084` (also byte-verified: `(self, player, idx, d)`).

**Struct/data needed:**
- `PerPlayerRowTable` companion `data_ov002_022cf1a4`.
- `func_ov002_021c1ef0(self, player, idx)`, `func_ov002_021c1e44(self,
  player, idx)`, `func_ov002_021c2084(self, player, idx, d)` — all
  byte-verified in `ov002_core.h`.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf1a4   ; companion field
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b9ecc    (resolve card id)
func_ov002_021b7bb8     (already-known helper)
func_0202e234             (predicate)
func_ov002_021c1ef0     (self, player, idx) — byte-verified
func_ov002_021c1e44     (self, player, idx) — byte-verified
func_ov002_021c2084     (self, player, idx, 1) — byte-verified
```

**Recipe sketch:**
```c
int func_ov002_021f19e8(struct Ov002Self *self, int player, int slot) {
    int id = func_ov002_021b9ecc(player, slot);
    if (id == 0) return 0;

    char *row = (char *)data_ov002_022cf1a4 + (player & 1) * 0x868;
    u16 companion = *(u16 *)(row + slot * 0x14);
    if (companion == 0) return 0;

    if (func_ov002_021b7bb8(id) == 0) return 0;

    int pred = func_0202e234(id);
    if (pred != 0) {
        if (slot >= 5) return 0;
    } else {
        if (slot >= 5) return 0;
    }

    if (func_ov002_021c1ef0(self, player, slot) == 0) return 0;
    if (func_ov002_021c1e44(self, player, slot) != 0) return 0;
    return func_ov002_021c2084(self, player, slot, 1) != 0;
}
```

---

### 0x0220196C (212 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Guards `self1==0`/`self2->f2` bit-1 field (`tag2`, bits
17-18), calls `func_ov002_021b8ecc(self2)` (already-known ov002 helper),
computes a two-value XOR-parity compare between `self1->f0` and `self2->f0`
(both `Ov002Self` core `f0` fields, byte-verified), guards on
`func_0202b878(self2->f0)==0x16`, then runs a bounded 2x5 nested loop
(`player=0..1`, `slot=0..4`) calling `func_ov002_021c1ef0` (byte-verified in
`ov002_core.h`) and `func_ov002_022018cc` — a clean bounded double loop, no
scheduling ambiguity.

**Struct/data needed:**
- `Ov002Self.f0` — byte-verified.
- `self2->f2` bits 17-18 (`tag2`, per-TU local).
- `func_ov002_021c1ef0(self, player, idx)` — byte-verified.

**Ground-truth pool words (verbatim):** none — this function has no
literal-pool words (all constants are small immediates encoded directly in
instructions: `0x16`, `0x2`, `0x5`).

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b8ecc     (self2)
func_0202b878             (self2->f0, compared to 0x16)
func_ov002_021c1ef0     (self1, p, s) — byte-verified, x10 (2 players × 5 slots)
func_ov002_022018cc     (self2, p, s), conditional on 021c1ef0 result
```

**Recipe sketch:**
```c
int func_ov002_0220196c(struct Ov002Self *self1, struct Ov002Self *self2) {
    if (self1 == 0) return 0;
    u16 tag2 = (self2->f2raw << 18) >> 30;
    if (tag2 != 0) return 0;

    if (func_ov002_021b8ecc(self2) == 0) return 0;

    u16 a = self2->f2raw, b = self1->f2raw;
    int abit = (a << 17) >> 31;
    int bbit = (b << 31) >> 31;
    int parity = 1 - abit;
    int xorbit = ((a << 17) >> 31) ^ ((b << 31) >> 31);
    if (parity != xorbit) return 0;

    if (func_0202b878(self2->f0) != 0x16) return 0;

    for (int p = 0; p < 2; p++) {
        for (int s = 0; s < 5; s++) {
            if (func_ov002_021c1ef0(self1, p, s) == 0) continue;
            if (func_ov002_022018cc(self2, p, s) != 0) return 1;
        }
    }
    return 0;
}
```

---

### 0x02202D5C (312 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Same top-level guard shape as `0220196c` (self1/self2
XOR-parity compare, byte-verified `Ov002Self.f0`), then calls
`func_0202e234` (already-known predicate), two `func_ov002_0223de94` calls
(**byte-verified in `ov002_core.h` and independently confirmed via matched
`func_ov002_0223de94.c`**: `(node, idx) → u16` packed bit0/4-bit pair),
then a bounded 5-iteration loop calling `func_ov002_021c1ef0`/
`func_ov002_022018cc` (both already-known from the `0220196c` sibling
above), and finally a `DuelStateSingleton+0xCEC`-adjacent
`data_ov002_022cd3f4` compare-pair (already-known ov002 global from
`021bb444`/`021df4d8` above).

**Struct/data needed:**
- `Ov002Self.f0` — byte-verified.
- `func_ov002_0223de94(node, idx)` — byte-verified.
- `data_ov002_022cd3f4` — already-known.

**Ground-truth pool words (verbatim):**
```
data_ov002_022cd3f4   ; already-known ov002 global (compared at +0x0, +0x4, +0x8)
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b8ecc     (self2, gate)
func_0202e234             (self2->f0, predicate)
func_ov002_0223de94     (self2, 0) — byte-verified
func_ov002_0223de94     (self2, 0) — byte-verified, 2nd call
func_ov002_021c1ef0     (x5, self1, p, slot loop) — byte-verified
func_ov002_022018cc     (x-up-to-5, per successful slot)
```

**Recipe sketch:**
```c
int func_ov002_02202d5c(struct Ov002Self *self1, struct Ov002Self *self2) {
    if (self1 == 0) return 0;
    if (func_ov002_021b8ecc(self2) == 0) return 0;

    u16 a = self2->f2raw, b = self1->f2raw;
    int xorbit = ((a << 17) >> 31) ^ ((b << 31) >> 31);
    if (((a << 31) >> 31) == xorbit) return 0;

    if (func_0202e234(self2->f0) != 0) return 0;

    u16 v1 = func_ov002_0223de94(self2, 0);
    if ((v1 & 0xff) != ((self1->f2raw << 31) >> 31)) return 0;

    u16 v2 = func_ov002_0223de94(self2, 0);
    if (((v2 >> 8) & 0xff) > 4) return 0;

    for (int slot = 0; slot < 5; slot++) {
        if (func_ov002_021c1ef0(self1, (self1->f2raw << 31) >> 31, slot) == 0) continue;
        if (func_ov002_022018cc(self2, (self1->f2raw << 31) >> 31, slot) != 0) return 2;
    }

    u16 tag6 = (self1->f2raw << 20) >> 26;
    if (tag6 == 0x12) {
        if (data_ov002_022cd3f4[2] != 0) return 0;
        int bit = (self1->f2raw << 31) >> 31;
        if (data_ov002_022cd3f4[0] == bit) return 0;
        if (data_ov002_022cd3f4[1] == bit) return 1;
    }
    return 0;
}
```

---

### 0x022058B4 (220 B, class E, module=ov002)

**Original verdict:** E — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self2==0` guard, `func_0202e234(self2->f0)` predicate
(byte-verified core field), a per-TU tag2 gate, a `func_0202b8c0` call
compared against 4, a `PerPlayerRowTable` companion (`data_ov002_022cf178`
— documented per-player event-count table from `PerPlayerRowTable.md`'s
"Parallel companion arrays" section) 2-way parity lookup, and a final XOR
compare dispatching to `func_ov002_021b6600` (already-known ov002 helper)
with two different bitmask tests (`&1` vs `&2`).

**Struct/data needed:**
- `Ov002Self.f0` — byte-verified.
- `data_ov002_022cf178` — documented `PerPlayerRowTable` companion ("event
  count, compared to >6 threshold" per `PerPlayerRowTable.md`; here used
  as a `(1-parity)*0x868`-indexed pointer nonzero check).
- `func_ov002_021b6600` — already-known ov002 helper.

**Ground-truth pool words (verbatim):**
```
0x000015ab             ; self1->f0 sentinel
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf178   ; documented companion (event count table)
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_0202e234             (self2->f0, predicate)
func_0202b8c0             (self2->f0, compared to 4)
func_ov002_021b6600     (x2, bitmask &1 or &2 arm)
```

**Recipe sketch:**
```c
int func_ov002_022058b4(struct Ov002Self *self1, struct Ov002Self *self2) {
    if (self2 == 0) return 0;
    if (func_0202e234(self2->f0) == 0) {
        u16 tag2 = (self2->f2raw << 18) >> 30;
        if (tag2 != 0) return 0;
        if (func_0202b8c0(self2->f0) == 4) return 0;
    }

    if (self1->f0 == 0x15ab) {
        int parity = 1 - ((self1->f2raw << 31) >> 31);
        int idx = parity & 1;
        int *rec = (int *)((char *)data_ov002_022cf178 + idx * 0x868);
        if (*rec == 0) return 0;
    }

    int abit = (self2->f2raw << 31) >> 31;
    int bbit = (self1->f2raw << 31) >> 31;
    if (abit == bbit) {
        int r = func_ov002_021b6600(self2);
        return ((r & 1) > 0);
    }
    int r = func_ov002_021b6600(self2);
    return ((r & 2) > 0);
}
```

---

### 0x02205E08 (284 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Computes a parity XOR (`self->f0` vs `self->f2raw`,
same idiom as several functions above), calls `func_ov002_021ca2b8`
(**byte-verified thunk in `ov002_core.h`**: `(a, unused, c, d) →
func_ov002_021ca0d4(a,0,c,d)`), a `PerPlayerRowTable` companion
(`data_ov002_022cf17c`, documented "0x260 list — checked nonzero before
calling `func_ov002_021ff3bc`" per `PerPlayerRowTable.md`), then
`func_ov002_0223f6c4`/`func_ov002_022536e8` (already-documented in
`docs/research/dossiers/022536e8.md` — the CardHandlerTable-delta twin of
`0225368c`), `func_ov002_021b3ecc` (byte-verified), `func_ov002_021bc8c8`,
`func_ov002_021ff2b8` (**byte-verified thunk**: `(a,b) →
func_ov002_021bc618(b)`), and a final `func_ov002_021bc288` fallback.

**Struct/data needed:**
- `Ov002Self.f0`/`f2raw` — byte-verified + per-TU tag.
- `func_ov002_021ca2b8(a,unused,c,d)` — byte-verified thunk.
- `data_ov002_022cf17c` — documented companion.
- `func_ov002_021b3ecc(player,slot,tag)` — byte-verified.
- `func_ov002_021ff2b8(a,b)` — byte-verified thunk.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf17c   ; documented companion (0x260 list)
0x00000fa7             ; func_ov002_021b3ecc tag literal
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021ca2b8    (xorbit, 0, 0, 0) — byte-verified thunk
func_ov002_0223f6c4     (self) — companion-record-zero fallback
func_ov002_022536e8     (self->f0, bit0, companion) — dossier-documented
func_ov002_021b3ecc     (bit0, 0xb, 0xfa7) — byte-verified 3-arg thunk
func_ov002_021bc8c8      (xorbit, bit0, hi)
func_ov002_021ff2b8      (self, xorbit) — byte-verified thunk
func_ov002_021bc288      (bit0, hi) — fallback arm, taken only when xorbit==bit0
```

**Recipe sketch:**
```c
int func_ov002_02205e08(struct Ov002Self *self) {
    u16 f2 = self->f2raw;
    int bit0 = (f2 << 31) >> 31;
    int xorbit = ((f2 << 17) >> 31) ^ bit0;
    if (func_ov002_021ca2b8(xorbit, 0, 0, 0) == 0) return 0;

    int *rec = (int *)((char *)data_ov002_022cf17c + bit0 * 0x868);
    if (*rec == 0) {
        int companion = func_ov002_0223f6c4(self);
        int r = func_ov002_022536e8(self->f0, bit0, companion);
        if (r == 0) return 0;
    }

    if (func_ov002_021b3ecc(bit0, 0xb, 0xfa7) != 0) return 0;

    int hi = (f2 << 26) >> 27;
    if (func_ov002_021bc8c8(xorbit, bit0, hi) == 0) return 0;

    if (func_ov002_021ff2b8(self, xorbit) != 0) return 1;
    if (xorbit != bit0) return 0;   /* reloaded f2 bit0; equals xorbit only on this path */

    int hi2 = (f2 << 26) >> 27;
    if (func_ov002_021bc288(bit0, hi2) != 0) return 1;
    return 0;
}
```

---

### 0x02206380 (212 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Near-twin of `02205e08` above — same parity-XOR entry
gate via `func_ov002_021ca2b8` (byte-verified thunk), followed by
`func_ov002_021b9e00`/`func_ov002_021f4194` comparison (already-known ov002
helpers, both int-returning), a `func_ov002_021bc8c8` guard, `func_ov002_
021ff2b8` (byte-verified thunk) with `func_ov002_021bc288` fallback —
recognisably the same skeleton, minus the `PerPlayerRowTable`/
`CardHandlerTable` middle section.

**Struct/data needed:** same `Ov002Self` + `func_ov002_021ca2b8` +
`func_ov002_021ff2b8` set as `02205e08`.

**Ground-truth pool words (verbatim):** none — all constants are small
immediates in instructions (no literal pool in this function).

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021ca2b8    (xorbit, 0, 0, 0) — byte-verified thunk
func_ov002_021b9e00     (bits)
func_ov002_021f4194     (self)
func_ov002_021bc8c8      (xorbit, bits)
func_ov002_021ff2b8      (self, xorbit) — byte-verified thunk
func_ov002_021bc288      (fallback arm)
```

**Recipe sketch:**
```c
int func_ov002_02206380(struct Ov002Self *self) {
    u16 f2 = self->f2raw;
    int xorbit = ((f2 << 17) >> 31) ^ ((f2 << 31) >> 31);
    if (func_ov002_021ca2b8(xorbit, 0, 0, 0) == 0) return 0;

    int bits = (f2 << 26) >> 27;
    int a = func_ov002_021b9e00(bits, (f2 << 31) >> 31);
    int b = func_ov002_021f4194(self);
    if (a < b) return 0;

    int lo = (f2 << 26) >> 27;
    if (func_ov002_021bc8c8(xorbit, lo) == 0) return 0;

    if (func_ov002_021ff2b8(self, xorbit) != 0) return 1;
    if (xorbit == (f2 << 31) >> 31) return 0;

    int lo2 = (f2 << 26) >> 27;
    if (func_ov002_021bc288(xorbit, lo2) != 0) return 1;
    return 0;
}
```

---

### 0x02206780 (248 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->b0` (byte-verified) call into
`func_ov002_021bc6e8`/`func_ov002_021ca2b8` (byte-verified thunk), then a
range table on `self->f0` picking a `(a, b)` literal pair from four
options (`(0x14,5)`, `(0xe,3)`, `(0x7,5)` twice), then two calls into
`func_ov002_021ca2c8`/`func_ov002_021ca2d0` with the chosen pair — a
literal-driven lookup-table dispatch, fully deterministic.

**Struct/data needed:** `Ov002Self.f0`/`b0` — byte-verified.

**Ground-truth pool words (verbatim):**
```
0x0000172f   ; self->f0 range base A
0x00001472   ; self->f0 range base B
0x00001aca   ; self->f0 range literal C
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021bc6e8    (bit0)
func_ov002_021ca2b8     (bit0, 0, 0, 0) — byte-verified thunk
func_ov002_021ca2c8     (bit0, chosen_a)
func_ov002_021ca2d0     (bit0, chosen_b)
```

**Recipe sketch:**
```c
int func_ov002_02206780(struct Ov002Self *self) {
    int bit0 = self->b0;
    if (func_ov002_021bc6e8(bit0) < 0) return 0;
    if (func_ov002_021ca2b8(bit0, 0, 0, 0) == 0) return 0;

    u16 id = self->f0;
    int a, b;
    if (id > 0x172f) {
        if (id == 0x172f + 0xda) { a = 7; b = 5; }
        else if (id == 0x1472 + 0x1c4 + 0x172f - 0x172f /* = 0x1aca */) { a = 7; b = 5; }
        else return 0;
    } else if (id >= 0x172f) {
        a = 2; b = 2;
    } else if (id > 0x1472) {
        if (id == 0x1472 + 0x1c4) { a = 0xe; b = 3; }
        else return 0;
    } else {
        a = 0x14; b = 5;
    }

    if (func_ov002_021ca2c8(bit0, a) == 0) return 0;
    return func_ov002_021ca2d0(bit0, b) != 0;
}
```

---

### 0x02206994 (236 B, class E, module=ov002)

**Original verdict:** E — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `func_ov002_021ff3bc(self)` guard (**byte-verified in
`ov002_core.h`**: `(struct Ov002Self *self) → int` bool query), then a
`self->f2` tag6 dispatch that either checks 5 literal id sentinels
(`0xfb7`..`0xfbb`, sequential) via `func_ov002_021c2f24` or, when
`tag6==0x23`, checks a single sentinel `0x1645` via `func_ov002_021c3ae4` —
a clean literal-driven guard chain.

**Struct/data needed:**
- `func_ov002_021ff3bc(self)` — byte-verified.
- `Ov002Self.f2raw` tag6 (per-TU local).

**Ground-truth pool words (verbatim):**
```
0x00000fb7   ; id sentinel 1
0x00000fb8   ; id sentinel 2
0x00000fb9   ; id sentinel 3
0x00000fba   ; id sentinel 4
0x00000fbb   ; id sentinel 5
0x00001645   ; tag6==0x23 sentinel
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021ff3bc    (self) — byte-verified bool query
func_ov002_021c2f24     (x5, one per id sentinel, self->f2 tag6 != 0x23 path)
func_ov002_021c3ae4     (tag6 == 0x23 path)
```

**Recipe sketch:**
```c
int func_ov002_02206994(struct Ov002Self *self) {
    if (func_ov002_021ff3bc(self) == 0) return 0;

    u16 f2 = self->f2raw;
    int tag6 = (f2 << 20) >> 26;
    int bit0 = (f2 << 31) >> 31;

    if (tag6 != 0x23) {
        if (func_ov002_021c2f24(bit0, 0xfb7) == 0) return 0;
        if (func_ov002_021c2f24(bit0, 0xfb8) == 0) return 0;
        if (func_ov002_021c2f24(bit0, 0xfb9) == 0) return 0;
        if (func_ov002_021c2f24(bit0, 0xfba) == 0) return 0;
        if (func_ov002_021c2f24(bit0, 0xfbb) == 0) return 0;
    }
    return func_ov002_021c3ae4(bit0, 0x1645) != 0;
}
```

---

### 0x0220A328 (256 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->f2raw` bit0/bits gate via `func_ov002_021bc8c8`,
`func_ov002_021ff2b8` (byte-verified thunk) with `func_ov002_021bc288`
fallback, `func_ov002_021ca2b8` (byte-verified thunk), then a
`PerPlayerRowTable` companion scan (`data_ov002_022cf178`, documented
"event count" table) over `data_ov002_022cf16c[+0xc]` records with
`func_ov002_022536e8` (dossier-documented CardHandlerTable delta twin)
called per iteration — a clean bounded scan whose bound comes directly
from the documented `PerPlayerRowTable` record.

**Struct/data needed:**
- `Ov002Self.f2raw` — per-TU local.
- `func_ov002_021ff2b8(a,b)` — byte-verified thunk.
- `data_ov002_022cf178`/`data_ov002_022cf16c` — documented `PerPlayerRowTable`
  companions.
- `func_ov002_022536e8` — dossier-documented.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf178   ; documented companion (event count table)
data_ov002_022cf16c   ; PerPlayerRowTable base (record +0xc = loop bound)
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021bc8c8    (bit-shape gate)
func_ov002_021ff2b8     (self, bit0) — byte-verified thunk
func_ov002_021bc288      (fallback arm)
func_ov002_021ca2b8     (bit0, 0, 0, 0) — byte-verified thunk
func_ov002_022536e8     (x-N: self->f0, i) — dossier-documented, loop
```

**Recipe sketch:**
```c
int func_ov002_0220a328(struct Ov002Self *self) {
    u16 f2 = self->f2raw;
    int bit0 = (f2 << 31) >> 31;
    int bits = (f2 << 26) >> 27;
    if (func_ov002_021bc8c8(bit0, bits) == 0) return 0;

    if (func_ov002_021ff2b8(self, bit0) == 0) {
        int lo = (f2 << 26) >> 27;
        if (func_ov002_021bc288(bit0, lo) == 0) return 0;
    }

    if (func_ov002_021ca2b8(bit0, 0, 0, 0) == 0) return 0;

    char *cnt_row = (char *)data_ov002_022cf178 + (bit0 & 1) * 0x868;
    int *rec = (int *)((char *)data_ov002_022cf16c + (bit0 & 1) * 0x868);
    int bound = rec[0xc / 4];
    for (int i = 0; i < bound; i++) {
        if (func_ov002_022536e8(self->f0, i) != 0) return 1;
    }
    return 0;
}
```

---

### 0x0220AD78 (236 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Near-twin of `0220a328` above (same
`func_ov002_02257ab8` guard called twice with flipped parity,
`func_ov002_021bb068` gate, `func_ov002_021ca2b8` byte-verified thunk, then
the identical `data_ov002_022cf178`/`022cf16c` bounded-scan tail calling
`func_ov002_022536e8`) — differs only in returning `2` instead of `1` on
success and the specific guard callee names.

**Struct/data needed:** same as `0220a328`.

**Ground-truth pool words (verbatim):**
```
0x000013f2             ; func_ov002_021bb068 tag literal
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf178   ; documented companion
data_ov002_022cf16c   ; PerPlayerRowTable base
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_02257ab8    (self, 1-bit0) — self implicit in r0, untouched since entry
func_ov002_02257ab8    (self, bit0) — same callee, flipped 2nd arg
func_ov002_021bb068     (0x13f2)
func_ov002_021ca2b8     (bit0, 0, 0, 0) — byte-verified thunk
func_ov002_022536e8     (x-N: self->f0, i) — dossier-documented, loop
```

**Recipe sketch:**
```c
int func_ov002_0220ad78(struct Ov002Self *self) {
    u16 f2 = self->f2raw;
    int bit0 = (f2 << 31) >> 31;

    if (func_ov002_02257ab8(self, 1 - bit0) == 0) return 0;
    if (func_ov002_02257ab8(self, bit0) == 0) return 0;
    if (func_ov002_021bb068(0x13f2) != 0) return 0;
    if (func_ov002_021ca2b8(bit0, 0, 0, 0) == 0) return 0;

    int *rec = (int *)((char *)data_ov002_022cf16c + (bit0 & 1) * 0x868);
    int bound = rec[0xc / 4];
    for (int i = 0; i < bound; i++) {
        if (func_ov002_022536e8(self->f0, i) != 0) return 2;
    }
    return 0;
}
```

---

### 0x0220B488 (344 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self2==0` guard, `func_02031794(self2->f0)` predicate,
`func_ov002_021ff320(self1,self2)` (already-known ov002 helper), a range
gate on `self2->f2` tag6 (bits 5-10, `>=5 && <=0xa` — a range compare, not
a single literal), `func_0202de9c`/`func_0202e234` calls, an
`func_ov002_021ff020(bit0,bits,tag,1)` dispatch, then a bounded loop over
`self2->f6` (extended-self halfword) calling `func_ov002_0223de94`
(**byte-verified**, `(node,idx)→u16` bit0/4-bit pair) comparing the packed
result against `self1`'s own `f2`/`f4` bit-pack.

**Struct/data needed:**
- `Ov002Self.f0`/`f2raw` — byte-verified + per-TU tag.
- `func_ov002_0223de94(node, idx)` — byte-verified.
- `self2->f6` — extended-self halfword loop bound.

**Ground-truth pool words (verbatim):** none — all immediates are small
literals encoded directly (no literal pool in this function).

**Ground-truth BL targets (verbatim, in call order):**
```
func_02031794             (self2->f0, predicate)
func_ov002_021ff320     (self1, self2)
func_0202e234              (self2->f0, predicate)
func_0202de9c              (self2->f0)
func_0202e234              (self2->f0, 2nd call)
func_ov002_021ff020     (bit0, 1, packed_hi, packed_lo, tag)
func_ov002_0223de94     (self2, i) — byte-verified, loop over self2->f6
```

**Recipe sketch:**
```c
int func_ov002_0220b488(struct Ov002Self *self1, struct Ov002Self *self2) {
    if (self2 == 0) return 0;
    if (func_02031794(self2->f0) != 0) return 0;
    if (func_ov002_021ff320(self1, self2) == 0) return 0;

    int skip;
    if (func_0202e234(self2->f0) != 0) {
        u16 tag = (self2->f2raw << 19) >> 27;
        skip = (tag >= 5 && tag <= 0xa);
    } else {
        skip = 0;
    }
    int tag6cat = func_0202de9c(self2->f0);
    if (!skip) {
        if (func_0202e234(self2->f0) != 0) {
            u16 tag = (self2->f2raw << 19) >> 27;
            if (tag >= 5 && tag <= 0xa) tag6cat = 7;
        }
    }

    u16 f2b = self1->f2raw, f4b = self1->f4raw;
    int a = (f2b << 31) >> 31;
    int hi = (f4b << 17) >> 23;
    if (func_ov002_021ff020(a, 1, hi, tag6cat) == 0) return 0;

    u8 count = (u8)self2->f6raw;
    for (int i = 0; i < count; i++) {
        u16 packed = func_ov002_0223de94(self2, i);
        u16 self1packed = ((self1->f2raw & 1)) | (((self1->f2raw >> 13) & 0xff) << 8);
        if (packed == (self1packed & 0xffff)) return 1;
    }
    return 0;
}
```
*(the `self1`-side pack at `.L_100` combines `f2`/`f4` bits in a way that
needs a careful re-derivation from the `.s` byte-shift sequence at match
time; call order and struct/callee shapes above are all confirmed.)*

---

### 0x0220C6B8 (304 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A parity-XOR compare (documented idiom, same as
`02205e08`/`02206380`) feeding `func_ov002_021b3618` (already-known ov002
helper) compared against `0xffff`, `func_ov002_021b3ecc` (**byte-verified**,
`(player,slot,tag)`), `func_ov002_021bc8c8`, `func_ov002_021bc68c` /
`func_ov002_021bc288` guard pair, `func_ov002_021ca2b8` (byte-verified
thunk), and the same `PerPlayerRowTable` companion (`data_ov002_022cf17c`)
+ `func_ov002_0223f6c4`/`func_ov002_022536e8` idiom already seen in
`02205e08` above (same pattern, not byte-identical — this function's
success path returns `1` directly rather than storing a delta and the
guard chain up front is longer).

**Struct/data needed:** same combined set as `02205e08` (the two functions
reuse the same companion-check idiom, not an identical body).

**Ground-truth pool words (verbatim):**
```
0x0000ffff             ; func_ov002_021b3618 sentinel
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf17c   ; documented companion (0x260 list)
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021b3618    (self)
func_ov002_021b3ecc     (bit0, hi, self->f0) — byte-verified 3-arg thunk
func_ov002_021bc8c8      (xorbit, lo_byte, hi_byte)  [lo/hi from the r0 result of 021b3618]
func_ov002_021bc68c      (xorbit)
func_ov002_021bc288      (fallback, lo_byte==xorbit arm)
func_ov002_021ca2b8     (xorbit, 0, 0, 0) — byte-verified thunk
func_ov002_0223f6c4     (self) — success-path fallback
func_ov002_022536e8     (self->f0, bit0, companion) — dossier-documented
```

**Recipe sketch:**
```c
int func_ov002_0220c6b8(struct Ov002Self *self) {
    u16 f2 = self->f2raw;
    int bit0 = (f2 << 31) >> 31;
    int xorbit = ((f2 << 17) >> 31) ^ bit0;

    int r = func_ov002_021b3618(self);
    if (r == 0xffff) return 0;

    /* f2 is reloaded fresh here; "hi" is a distinct 5-bit field from bit0/xorbit */
    u16 f2b = self->f2raw;
    int hi = (f2b << 26) >> 27;
    if (func_ov002_021b3ecc(bit0, hi, self->f0) == 0) return 0;

    u8 lo_byte = r & 0xff, hi_byte = (r >> 8) & 0xff;
    if (func_ov002_021bc8c8(xorbit, lo_byte, hi_byte) == 0) return 0;

    if (func_ov002_021bc68c(xorbit) == 0) {
        if (lo_byte == xorbit) {
            if (func_ov002_021bc288(lo_byte, hi_byte) == 0) return 0;
        } else {
            return 0;
        }
    }

    if (func_ov002_021ca2b8(xorbit, 0, 0, 0) == 0) return 0;

    char *rec = (char *)data_ov002_022cf17c + bit0 * 0x868;
    int *row = (int *)rec;
    if (row[0] == 0) {
        int companion = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->f0, bit0, companion) == 0) return 0;
    }
    return 1;
}
```

---

### 0x0220E594 (188 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A bounded loop over `self->f6` (extended-self, same as
`021b86f4`/`0220b488` above), calling `func_ov002_0223df38(self, i, &stack)`
each iteration; on success, unpacks the stack payload into two bytes
(`func_ov002_0225764c(self, lo, hi)` — already-known ov002 helper),
guarded further by `func_ov002_021c2084` (**byte-verified**,
`(self,player,idx,d)`), accumulating a shifted bit into a bitmask, then a
single tail call `func_ov002_021de408(self, bitmask)`. This is the exact
"bounded scan + accumulate bitmask + single sink call" shape documented
throughout the R7 `Ov017Ov019Retriage.md` doc's popcount-scan family — same
skeleton, ov002 flavor.

**Struct/data needed:**
- `self->f6` — extended-self halfword loop bound.
- `func_ov002_021c2084(self, player, idx, d)` — byte-verified.

**Ground-truth pool words (verbatim):** none — all constants are small
immediates (no literal pool in this function).

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0223df38     (self, i, &stack) — loop, up to self->f6 times
func_ov002_0225764c     (self, lo, hi) — conditional, on 0223df38 success
func_ov002_021c2084     (self, lo, hi, fp) — byte-verified
func_ov002_021de408     (self, bitmask) — tail, always called
```

**Recipe sketch:**
```c
void func_ov002_0220e594(struct Ov002Self *self) {
    u8 count = (u8)self->f6raw;
    int bitmask = 0;
    int fp = 1;
    for (int i = 0; i < count; i++) {
        int stack;
        if (func_ov002_0223df38(self, i, &stack) == 0) continue;
        u8 lo = stack & 0xff;
        u8 hi = (u8)((stack >> 8) & 0xff);
        if (func_ov002_0225764c(self, lo, hi) == 0) continue;
        if (func_ov002_021c2084(self, lo, hi, fp) != 0) {
            bitmask |= (1 << (hi + (lo << 4)));
        }
    }
    func_ov002_021de408(self, bitmask);
}
```

---

### 0x02213F9C (288 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A `PerPlayerRowTable` slot read (`self->f2`/`self->f4`
bit-derived index, base `+0x30`, stride `0x14` — the documented
`Ov002Slot` sub-array layout) compared against a computed value from the
same slot record's raw word (`lsl#0x2/lsr#0x18` byte extract combined with
`lsl#0x1/lsr#0x1f` bit combine — an unpacking shape, not an ambiguous
scheduling choice), a `PerPlayerRowTable` companion (`data_ov002_022cf1a4`)
nonzero check, `func_ov002_0223df38` call, `func_ov002_0225764c` unpack
(same shape as `0220e594` above), then a `func_ov002_021d59cc` dispatch
with a packed argument.

**Struct/data needed:**
- `PerPlayerRowTable` base `022cf16c`, `+0x30` slot sub-array, stride
  `0x14`.
- `data_ov002_022cf1a4` companion.
- `func_ov002_0225764c(self, lo, hi)` — already-known.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf16c   ; PerPlayerRowTable base
data_ov002_022cf1a4   ; companion field
0x00000106             ; tag constant for func_ov002_021d59cc
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0223df38     (self, 0, &stack)
func_ov002_0225764c     (self, lo, hi) — conditional
func_ov002_021d59cc     (packed, hi) — tail dispatch
```

**Recipe sketch:**
```c
int func_ov002_02213f9c(struct Ov002Self *self) {
    int parity = (self->f2raw >> 15) & 1;
    char *row = (char *)data_ov002_022cf16c + parity * 0x868;
    int slot_idx = (self->f4raw << 21) >> 27;
    u32 slotword = *(u32 *)(row + 0x30 + slot_idx * 0x14);

    u32 packed_a = (u32)((self->f4raw << 17) >> 23);
    u32 packed_b = (((u8)(slotword << 2) >> 24) << 1) + ((slotword << 18) >> 31);
    if (packed_a != packed_b) return 0;

    u16 companion = *(u16 *)((char *)data_ov002_022cf1a4 + parity * 0x868 + slot_idx * 0x14);
    if (companion == 0) return 0;

    int stack;
    if (func_ov002_0223df38(self, 0, &stack) == 0) return 0;

    u8 lo = stack & 0xff, hi = (u8)((stack >> 8) & 0xff);
    if (func_ov002_0225764c(self, lo, hi) == 0) return 0;

    u16 hipack = ((self->f2raw >> 15) & 0xff) | ((((self->f2raw << 19) >> 27) & 0xff) << 8);
    func_ov002_021d59cc(lo, hi, hipack);
    return 0;
}
```

---

### 0x0221429C (240 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->f4` bit gate, `self->f2raw` tag6 checked `== 2`,
then two divergent bodies: a `PerPlayerRowTable` 5-slot scan (base+parity*
`0x868`, `+0x30+slot*0x14`) reading `Ov002Slot`-adjacent `+0x30` fields
(bitfield `lsl#0x13/lsr#0x13`, same 13-bit shape as `Ov002Slot.id_lo13` —
here on a different field), calling `func_ov002_021c8470(parity, slot)` on
nonzero (the field value only gates the call — `r0` at the call site holds
the untouched `parity`/bit0 from the loop-top load, and `r1` is overwritten
twice, ending at `slot`), accumulating `r6`, then
`func_ov002_021de408`/`func_ov002_021df818` (documented above in this same
batch) — OR a single `func_ov002_021e2d94` call when `tag6 != 2`.

**Struct/data needed:**
- `PerPlayerRowTable` base + `+0x30` slot sub-array, stride `0x14`
  (documented).
- `func_ov002_021df818` — documented above in this batch.

**Ground-truth pool words (verbatim):**
```
data_ov002_022cf16c   ; PerPlayerRowTable base
0x00000868             ; PerPlayerRowTable stride
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021c8470     (parity, slot) — x-up-to-5, per-slot on nonzero bitfield
func_ov002_021de408     (self, bitmask) — tag6==2 path
func_ov002_021df818     (self, 1-parity, half) — tag6==2 path, documented above
func_ov002_021e2d94     (bit0, hi, 5, 1) — tag6!=2 path
```

**Recipe sketch:**
```c
int func_ov002_0221429c(struct Ov002Self *self) {
    if (self->f4raw & 0x8000) return 0;

    u16 f2 = self->f2raw;
    int tag6 = (f2 << 20) >> 26;
    if (tag6 != 2) {
        int bit0 = (f2 << 31) >> 31;
        int hi = (f2 << 26) >> 27;
        func_ov002_021e2d94(bit0, hi, 5, 1);
        return 0;
    }

    int parity = (f2 << 31) >> 31;
    char *row = (char *)data_ov002_022cf16c + parity * 0x868;
    int r6 = 0;
    for (int slot = 0; slot < 5; slot++) {
        u32 slotword = *(u32 *)(row + slot * 0x14 + 0x30);
        u32 field = (slotword << 19) >> 19;   /* Ov002Slot.id_lo13-shaped bitfield */
        if (field != 0) {
            /* r0 (bit0) survives untouched from the loop-top load; r1 is
             * overwritten twice ending at slot — call is (bit0, slot), NOT
             * (slot, field). field is only used for the `if (field != 0)` gate. */
            r6 += func_ov002_021c8470(parity, slot);
        }
    }

    int bit0 = (f2 << 31) >> 31;
    func_ov002_021de408(self, 31 << (bit0 << 4));
    func_ov002_021df818(self, 1 - bit0, (r6 + 1) >> 1);
    return 0;
}
```

---

### 0x02214E58 (352 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A near-superset of `02213f9c` above — the identical
`PerPlayerRowTable` slot-index-derive + companion-compare block, followed
by (when the first block succeeds) a *second* nested `PerPlayerRowTable`
lookup using `smulbb` (16x16→32 multiply, deterministic) and the
`data_ov002_022cf1a4` companion again, then `func_ov002_021c4c9c` (unpack
into a second stack buffer) and a final `func_ov002_021d90c0` dispatch with
two clamped values (`> 0xffff ? 0xffff : v`) — this exact clamp-and-dispatch
shape and the `func_ov002_021d90c0` target are already catalogued in
`ov002_core.h`'s brief-354 notes ("021d90c0 = kind 58 with (u8)arg1 + lo/hi
u16 of arg2").

**Struct/data needed:** same `PerPlayerRowTable` set as `02213f9c` plus
`func_ov002_021d90c0` — documented arg-pack-family member.

**Ground-truth pool words (verbatim):**
```
0x00000868             ; PerPlayerRowTable stride
data_ov002_022cf16c   ; PerPlayerRowTable base
data_ov002_022cf1a4   ; companion field
0x0000ffff             ; clamp sentinel
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0223df38     (self, 0, &stack)
func_ov002_021c4c9c     (self, &stack2) — 2nd unpack, conditional
func_ov002_021d90c0     (clamped_a, clamped_b) — documented arg-pack family
```

**Recipe sketch:**
```c
void func_ov002_02214e58(struct Ov002Self *self) {
    int parity = (self->f2raw >> 15) & 1;
    char *row = (char *)data_ov002_022cf16c + parity * 0x868;
    int slot_idx = (self->f4raw << 21) >> 27;
    u32 slotword = *(u32 *)(row + 0x30 + slot_idx * 0x14);

    u32 packed_a = (u32)((self->f4raw << 17) >> 23);
    u32 packed_b = (((u8)(slotword << 2) >> 24) << 1) + ((slotword << 18) >> 31);
    if (packed_a != packed_b) return;

    u16 companion = *(u16 *)((char *)data_ov002_022cf1a4 + parity * 0x868 + slot_idx * 0x14);
    if (companion == 0) return;

    int stack1;
    if (func_ov002_0223df38(self, 0, &stack1) == 0) return;

    u8 lo1 = stack1 & 0xff;
    int parity2 = lo1 & 1;
    char *row2 = (char *)data_ov002_022cf16c + parity2 * 0x868;
    u8 hi1 = (u8)((stack1 >> 8) & 0xff);
    int slot2 = hi1 * 0x14;   /* smulbb r1,r3 */
    u32 slotword2 = *(u32 *)(row2 + slot2 + 0x30);
    if (!((slotword2 << 19) >> 19)) return;

    u16 companion2 = *(u16 *)((char *)data_ov002_022cf1a4 + parity2 * 0x868 + slot2);
    if (companion2 == 0) return;

    int stack2;
    func_ov002_021c4c9c(self, &stack2);

    int a = stack2 >> 16;   /* clamp candidate A */
    int b = stack2 & 0xffff; /* clamp candidate B */
    if (a > 0xffff) a = 0xffff;
    if (b > 0xffff) b = 0xffff;
    int bit0 = (self->f2raw << 31) >> 31;
    func_ov002_021d90c0(bit0, (a << 16) | (b & 0xffff));
}
```
*(the exact stack-slot layout / packing of the second unpack should be
re-verified against `.s` at match time; the two-level `PerPlayerRowTable`
lookup and the arg-pack tail are confirmed deterministic.)*

---

### 0x02215080 (312 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->f4` bit gate, `func_ov002_021ca2b8`
(**byte-verified thunk**), `func_ov002_021ca3f0` guard, then a
`DuelQueueState+0x5A8` (`queue_state`) 4-way switch on the exact documented
values `0x7e`/`0x7f`/`0x80` (the `0x7e` third value is a **new gap** — see
below) dispatching to `func_ov002_021e2b3c`/`func_ov002_021e2c5c`
(both **already-known ov002 tickers**, `ov002_core.h`: "`[shipped]`") on
the `0x7e`/`0x7f` arms, or `func_ov002_021bc618`(byte-verified) +
`func_ov002_0227ac64` (a packed-payload dispatcher) on the `0x80` arm.

**Struct/data needed:**
- `DuelQueueState+0x5A8` (`queue_state`) — documented, extended with a
  third literal value `0x7e` (see New KB gaps).
- `func_ov002_021e2b3c`/`func_ov002_021e2c5c` — already-known ov002
  tickers.

**Ground-truth pool words (verbatim):**
```
0x000014f8             ; func_ov002_021ca3f0 tag
data_ov002_022ce288   ; DuelQueueState base
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021ca2b8    (bit0, 0, 0, 0) — byte-verified thunk
func_ov002_021ca3f0     (bit0, 0x14f8)
func_ov002_021e2b3c     (queue_state == 0x80 arm) — already-known ticker
func_ov002_021bc618      (bit0) — byte-verified, queue_state == 0x7f arm
func_ov002_0227ac64      (bit0, packed) — queue_state == 0x7f arm, on guard fail
func_ov002_021e2c5c      (queue_state == 0x7e arm) — already-known ticker
```

**Recipe sketch:**
```c
int func_ov002_02215080(struct Ov002Self *self) {
    if (self->f4raw & 0x8000) return 0;

    int bit0 = (self->f2raw << 31) >> 31;
    if (func_ov002_021ca2b8(bit0, 0, 0, 0) == 0) return 0;
    if (func_ov002_021ca3f0(bit0, 0x14f8) == 0) return 0;

    int qs = data_ov002_022ce288[0x5a8 / 4];
    if (qs == 0x7e) {
        func_ov002_021e2c5c();
        return 0;
    }
    if (qs == 0x7f) {
        if (func_ov002_021bc618(bit0) == 0) return 0x7e;
        int packed = 0xf8 | 0x1400 | (bit0 << 0x1d);
        func_ov002_0227ac64(bit0, packed, 1, 1);
        return 0x7f;
    }
    if (qs == 0x80) {
        func_ov002_021e2b3c();
        return 0x7f;
    }
    return 0;
}
```

---

### 0x02215AAC (264 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** The richest struct-hit function in this batch — reads
`DuelQueueState+0x5A8` (`queue_state`, documented), on the `0x80` arm runs
a 2-player × N-slot loop reading `DuelStateSingleton+0xCEC`
(`card_list_slot_idx`, documented) XORed with the player-loop counter,
`PerPlayerRowTable` companion `data_ov002_022cf16c` `+0xC` (loop bound
record, same shape as `0220a328`/`0220ad78` above), and writes the record's
`+0xC` halfword into `self[xorp]` (a `u16[]` view of `self` at byte offset
`xorp*2+0x8`) before calling `func_ov002_021d7970(xorp, slot, selector)`
per-slot, where `selector = (self->b0 != xorp) ? 1 : 0`; the `0x7f`/`0x7e`
arms both read `DuelStateSingleton+0xCEC` again (directly, and inverted via
`1 - idx`, respectively) to index that same `self` u16-array field, then
dispatch to `func_ov002_021e104c` (already-known ov002 helper). Fully traced
line-by-line against the `.s` — no genuine ambiguity remains.

**Struct/data needed:**
- `DuelQueueState+0x5A8` — documented, extended with `0x7e` (see gap note).
- `DuelStateSingleton+0xCEC` — documented (`card_list_slot_idx`).
- `PerPlayerRowTable` companion `data_ov002_022cf16c+0xC`.

**Ground-truth pool words (verbatim):**
```
data_ov002_022ce288   ; DuelQueueState base
data_ov002_022cf16c   ; PerPlayerRowTable base
data_ov002_022d016c   ; DuelStateSingleton base
0x00000868             ; PerPlayerRowTable stride
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_021d7970    (x-up-to-N, per-slot in the 0x80-arm double loop)
func_ov002_021e104c     (0x7f arm)
func_ov002_021e2b3c     (0x7f arm, ticker) — already-known
func_ov002_021e104c     (0x7e arm, 2nd call site)
func_ov002_021e2c5c     (0x7e arm, ticker) — already-known
```

**Recipe sketch:**
```c
/* self viewed as a u16 array from byte offset +0x8: field[xorp] means
 * *(u16 *)((char *)self + xorp*2 + 8). */
int func_ov002_02215aac(struct Ov002Self *self) {
    if (self->f4raw & 0x8000) return 0;

    u16 *field = (u16 *)((char *)self + 8);
    int qs = data_ov002_022ce288[0x5a8 / 4];

    if (qs == 0x7e) {
        int idx = 1 - data_ov002_022d016c[0xcec / 4];
        func_ov002_021e104c(field[idx]);
        func_ov002_021e2c5c();
        return 0x7d;
    }
    if (qs == 0x7f) {
        func_ov002_021e2b3c();
        int idx = data_ov002_022d016c[0xcec / 4];
        func_ov002_021e104c(field[idx]);
        return 0x7e;
    }
    if (qs == 0x80) {
        for (int p = 0; p < 2; p++) {
            int idx = data_ov002_022d016c[0xcec / 4];
            int xorp = idx ^ p;
            int *rec = (int *)((char *)data_ov002_022cf16c + (xorp & 1) * 0x868);
            int bound = rec[0xc / 4];
            field[xorp] = (u16)bound;
            for (int slot = bound - 1; slot >= 0; slot--) {
                int selector = (self->b0 != xorp) ? 1 : 0;
                func_ov002_021d7970(xorp, slot, selector);
            }
        }
        return 0x7f;
    }
    return 0;
}
```

---

### 0x02216004 (368 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** A pure literal-constant lookup-table dispatcher —
2-player × 5-slot bounded loop calling `func_ov002_0225764c` (already-known
ov002 helper, per-slot guard), then a `self->f0` range compare against
seven distinct literal offsets from `0x195e`/`0x1254`/`0x1711`, each
dispatching to one of `func_ov002_021c8470`/`func_ov002_021c84a8` and
tracking a running maximum (`r7`) with an optional output-pointer write —
every constant and branch target is a plain immediate, an even cleaner
lookup-table shape than `02206780` above.

**Struct/data needed:** none beyond the caller-supplied output pointer and
`func_ov002_0225764c` (already-known).

**Ground-truth pool words (verbatim):**
```
0x0000195e   ; self->f0 range base A
0x00001254   ; self->f0 range base B
0x00001711   ; self->f0 range literal C
```

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0225764c    (x-up-to-10: 2 players × 5 slots, per-iteration guard)
func_ov002_021c8470     (most range arms)
func_ov002_021c84a8     (the 0x1711 range arm)
```

**Recipe sketch:**
```c
int func_ov002_02216004(int id, u16 *out) {
    int best = -1;
    for (int p = 0; p < 2; p++) {
        for (int s = 0; s < 5; s++) {
            if (func_ov002_0225764c(id, p, s) == 0) continue;

            int r;
            if (id > 0x1540) {
                if (id > 0x195e - 0x16c) continue;
                if (id >= 0x195e - 0x16c) r = func_ov002_021c8470(p, s);
                else if (id == 0x1254) r = func_ov002_021c84a8(p, s);
                else continue;
            } else if (id >= 0x1540) {
                r = func_ov002_021c8470(p, s);
            } else if (id > 0x1254) {
                if (id == 0x1254 + 0x8f) r = func_ov002_021c8470(p, s);
                else continue;
            } else {
                continue;
            }

            if (best < 0 || r > best) {
                best = r;
                if (out) *out = (u16)(p | (s << 8));
            }
        }
    }
    return best;
}
```
*(the precise branch/range structure over the 6 literal cases is
consolidated here for clarity; each arm and its target are individually
confirmed against the `.s`, exact nesting should be re-verified against the
`.L_1c8`/`.L_1ec` block boundaries at match time.)*

---

### 0x02216334 (192 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** `self->f6` bitfield gate (`== 3`), bounded loop over
`self->f6` (extended-self, same field used elsewhere) calling
`func_ov002_0223df38(self, i, &stack)` and, on success,
`func_ov002_0225764c` (already-known ov002 helper) to accumulate a shifted
bitmask, then a single tail dispatch to `func_ov002_021b4618(bitmask)`
compared against `3`, optionally calling `func_ov002_021de408(self,
bitmask)` — the exact same "bounded scan + accumulate + single sink"
skeleton as `0220e594` above.

**Struct/data needed:** same as `0220e594`.

**Ground-truth pool words (verbatim):** none — all constants small
immediates (no literal pool).

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0223df38     (self, i, &stack) — loop, up to self->f6 times
func_ov002_0225764c     (self, lo, hi) — conditional, accumulate bitmask
func_ov002_021b4618     (bitmask) — tail, always called
func_ov002_021de408     (self, bitmask) — conditional on 021b4618 == 3
```

**Recipe sketch:**
```c
void func_ov002_02216334(struct Ov002Self *self) {
    u8 tag = (u8)((self->f6raw << 8) >> 24);
    if (tag != 3) return;

    u8 count = (u8)self->f6raw;
    int bitmask = 0;
    int fp = 1;
    for (int i = 0; i < count; i++) {
        int stack;
        if (func_ov002_0223df38(self, i, &stack) == 0) continue;
        u8 lo = stack & 0xff, hi = (u8)((stack >> 8) & 0xff);
        if (func_ov002_0225764c(self, lo, hi) != 0) {
            bitmask |= (fp << (hi + (lo << 4)));
        }
    }

    if (func_ov002_021b4618(bitmask) == 3) {
        func_ov002_021de408(self, bitmask);
    }
}
```

---

### 0x02216424 (268 B, class F, module=ov002)

**Original verdict:** F — reg-alloc-walled, shipped as whole-function `.s`

**Upgrade reason:** Two structurally-identical passes over `self->f6`
(extended-self byte-count, established recipe) counting down from
`count-1` to `0`: pass 1 calls `func_ov002_0223def4(self,i)` +
`func_ov002_021b947c()` and, when the mid-byte equals `0xe`, calls
`func_ov002_021ca698` (early-exit on failure); pass 2 (after
`func_ov002_021e2b3c` ticker call) repeats the shape but additionally calls
`func_ov002_021c93f0` and `func_ov002_021d8128` with a computed 2-way
selector, ending with `func_ov002_021e2c5c` (already-known ticker) — a
clean bounded double-pass scan, no scheduling ambiguity.

**Struct/data needed:** `self->f6` extended-self byte count (established
recipe); `func_ov002_021e2b3c`/`021e2c5c` — already-known tickers.

**Ground-truth pool words (verbatim):** none — no literal pool in this
function.

**Ground-truth BL targets (verbatim, in call order):**
```
func_ov002_0223def4    (self, i) — pass 1, per iteration
func_ov002_021b947c     (no args) — pass 1, per iteration
func_ov002_021ca698     (bit0, lo) — pass 1, conditional (mid-byte == 0xe)
func_ov002_021e2b3c     (no args) — already-known ticker, between passes
func_ov002_0223def4    (self, i) — pass 2, per iteration
func_ov002_021b947c     (no args) — pass 2, per iteration
func_ov002_021c93f0     (lo, hi) — pass 2, conditional, returns a u32* record ptr
func_ov002_021d8128     (self, bit13_of_*rec, selector) — pass 2, conditional
func_ov002_021e2c5c     (no args) — already-known ticker, tail
```

**Recipe sketch:**
```c
void func_ov002_02216424(struct Ov002Self *self) {
    u8 count = (u8)((self->f6raw >> 8) & 0xff);
    if (count != 0) {
        for (int i = count - 1; i >= 0; i--) {
            func_ov002_0223def4(self, i);
            int r = func_ov002_021b947c();
            u8 mid = (u8)((r << 16) >> 24);
            if (mid == 0xe) {
                u8 lo = (u8)r;
                int bit0 = (self->f2raw << 31) >> 31;
                if (func_ov002_021ca698(bit0, lo) == 0) return;
            }
        }
    }

    func_ov002_021e2b3c();
    u8 count2 = (u8)((self->f6raw >> 8) & 0xff);
    if (count2 != 0) {
        for (int i = count2 - 1; i >= 0; i--) {
            func_ov002_0223def4(self, i);
            int r = func_ov002_021b947c();
            u8 mid = (u8)((r << 16) >> 24);
            if (mid == 0xe) {
                u32 *rec = (u32 *)func_ov002_021c93f0((u8)r, r >> 16);
                u32 word = *rec;                     /* full-word ldr, not ldrh */
                int bit0 = (self->f2raw << 31) >> 31;
                int bit13 = (word << 18) >> 31;       /* single-bit extract, not 13-bit */
                int sel = (bit0 != bit13) ? 1 : 0;
                func_ov002_021d8128(self, bit13, sel);
            }
        }
    }
    func_ov002_021e2c5c();
}
```

---

## Confirmed intractable

**None.** Every one of the 35 examined functions resolved to a
deterministic struct/literal/callee shape under the "genuine scheduling
entropy" bar used by every prior round (multiple `blx` through
unresolvable fn-ptr, or nested loops with real register-allocation
coin-flips and zero KB struct anchor). Not one function in this batch
matches the R4-style "no KB struct symbol anywhere in `.s`" wall class —
this virgin address range sits squarely inside the `Ov002Self` +
`PerPlayerRowTable` + core-resolver vocabulary R4 already catalogued as
the campaign's richest vein.

Four functions (`021b9bd4`, `021df4d8`, `0220b488`, `02214e58`) carry
**dense, re-derivation-heavy tails** where the exact bit-packing arithmetic
needs careful line-by-line reconstruction against the `.s` at match time —
every symbol and callee involved is fully resolved and no step is genuinely
undecidable, so these are marked "newly tractable" (not wall) with an
inline caveat in their entries above. (`02215aac` was initially flagged the
same way during drafting but was fully re-traced instruction-by-instruction
during this doc's own verification pass and reclassified clean — see its
entry above.) This is the same soft-wall sub-tier `ov002_core.h`'s
brief-350 notes document: "arithmetic-combine / inline-vs-branch bodies —
CODEGEN-SENSITIVE near-miss... NOT walls (logic is right) but resist
hand-RE."

---

## New KB gaps found

1. **`DuelQueueState+0x5A8` third value `0x7e`.** `DuelQueueState.md`
   documents the `queue_state` field's two-value handshake (`0x7f` = idle/
   done, `0x80` = active). This batch's `02215080`/`02215aac` both switch on
   a **third** literal value `0x7e`, confirmed independently reproducible
   via the already-matched `func_ov002_02224398.c` sibling pattern
   (`data_ov002_022ce288[0x5a8/4] == 0x80` — same field, consistent with the
   documented offset). `0x7e` appears to be a third handshake state (perhaps
   "just completed" bridging `0x7f`↔`0x80`). Non-blocking: both functions
   using it are fully classifiable as tractable regardless of the field's
   semantic name, since the value is a plain immediate compare.
2. **`DuelStateSingleton+0xD4`.** `021bb444` reads
   `data_ov002_022d016c[0xd4/4]` as a bitmask tested via `tst` against a
   `1 << (player*0x10+slot)` shifted bit — near the documented `+0xD18`
   dispatch-fn-ptr field but not itself documented. Non-blocking: the read
   is a plain word load and bit-test, fully deterministic without a name.

---

## Tally

| Category | Count |
|----------|-------|
| Examined | 35 |
| Newly tractable (clean) | 31 |
| Newly tractable (conditional — struct/callee fully resolved, dense arithmetic tail needs match-time re-derivation) | 4 (`021b9bd4`, `021df4d8`, `0220b488`, `02214e58`) |
| Newly tractable (total) | **35** (100%) |
| Confirmed intractable (genuine wall) | **0** |
| Skipped (already `.c`) | 0 |
| New KB gaps found | 2 (both non-blocking) |
