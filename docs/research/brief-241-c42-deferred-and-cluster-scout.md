[//]: # (markdownlint-disable MD013 MD041)

# Brief 241 — C-42 deferred drain + next-cluster scout + calcrom canon

**Status:** 3 deliverables, all landed.

- **(A) Brief 238's 7 deferred picks** — LOCKED. All 7 (8 listed,
  one was a filter bug) ship byte-identical under natural recipes.
  Not new wall class — they fold under C-42 as 5 distinct
  sub-shapes (12-16). Shipped all 7 worked examples.
- **(B) Next-cluster scout** — Top 5 unclassified clusters
  identified across the full 1204-pick post-brief-240 pool. No
  cluster crosses the 100-pick pilot threshold, so no pilot.
  Histogram + 3 samples per cluster documented for brief 242+.
- **(C) Calcrom canon reconciliation** — `tools/calcrom.py`
  output now emits an explanatory note inline after
  `complete_units`. `memory/reference_metric_canon.md` updated
  with brief 239 (D) empirical findings.

3-region SHA1 PASS (EUR/USA/JPN). +7 complete_units (+8 fns).

## (A) C-42 deferred picks — all 7 locked

### Brief 238's deferral

Brief 238 deferred 7 picks (listed as 8; `func_02000c34` was a
filter bug — already shipped). Initial classification was
"struct-layout / pool-deref edge case" with mwcc emitting `add +
ldr` splits for large field offsets. Brief 241 ran the variant
matrix and found this was a MISREADING — the actual issue was 5
distinct sub-shapes, each needing a different recipe nudge.

### Result: all 7 ship under natural recipes

Each pick + recipe:

**`func_020327c0` (36 B)** — null-check + helper + null-write at
struct offset 0xea8 (3752):

```c
struct Self {
    char pad[3752];
    void *p;
};
void func(struct Self *self) {
    if (self->p == 0) return;
    helper(self);                  /* takes self → r0 reserved */
    self->p = 0;
}
```

Key gotcha: with 0-arg `helper()`, mwcc allocates the field load to
**r0** and reuses for cmp. Orig uses **r1**. The `helper(self)`
signature keeps r0 live across cmp, forcing the field load to r1.
0xea8 fits in ARM's 12-bit ldr/str immediate (max 4095) so a
single `ldr r1, [r4, #0xea8]` matches — no add+ldr split needed.

**`func_0202bae4` (40 B)** — clamp pattern:

```c
int r = helper1() - arg;
if (r <= 0) r = 0;        /* not "< 0" */
helper2(self, r);
```

Key gotcha: `r <= 0 → sub + cmp + movle` (matches orig);
`r < 0 → subs + movmi` (sets flags in sub, fails match).

**`func_02049f38` (40 B)** — 2x helper-returns-ptr + 2 field
writes, mwcc 1.2/sp3 routing:

```c
helper()->f28 = arg0;
helper()->f26 = arg1;
```

Helper called twice (mwcc TBAA conservatism doesn't CSE the
pointer across calls). Routed via `*.legacy_sp3.c` for `sub sp,
sp, #4` + style A pop.

**`func_0204b0a8` (40 B)** — 2 helpers + helper3 returns u64:

```c
helper1()->f429 = 0;
{
    struct Target *p = helper1();
    long long v = helper3();
    p->f504 = (int)v;
    p->f508 = (int)(v >> 32);
}
```

helper3 returns `long long` → mwcc lowers to `(r0, r1)` pair;
the two `str` at +504/+508 write the low/high halves.

**`func_02050118` (40 B)** — 2x helper-returns-ptr + 2 strb,
mwcc 1.2/sp3:

```c
helper()->f972 = 0xff;
helper()->f973 = 0;
```

Sibling of `02049f38` but with no register saves (no args, byte
writes only).

**`func_ov002_021eeea4` (32 B)** — bne-skip dispatch:

```c
if (self->f10) helper1(self, a, b); else helper2(self, a, b);
```

Key gotcha: **3-arg pass-through** is needed to force the field
load into **r3** (orig). 1-arg → r1; 2-arg → r2; 3-arg → r3.

**`func_ov002_02242e30` (32 B)** — cmp-dispatch with hard branch:

```c
switch (self->f12) {
case 2:  return helper(self, arg);
default: return 1;
}
```

Key gotcha: `if (...) return h(); return 1;` collapses to
`movne/popne` (conditional-exec, 7 insns). **Switch+case+default**
forces the full `bne` branch — 8 insns matching orig.

**`func_ov002_022951a4` (32 B)** — bitfield-test + helper-tail:

```c
if (self->f2.field2 != 0) return 1;
return func_helper(self, arg);
```

field2 is bits 12-13 of the u16 f2 field (same shape as 02206608
from brief 239). 2-arg pass-through forces bitfield extract to r2.

### New gotcha added to recipe-gotchas.md

Gotcha 7: **arg-count tunes the temp register**. mwcc's allocator
chooses the temp register based on which arg-passing registers are
"live" for an upcoming `bl`. If the natural source produces the
wrong temp register, adjust the helper signature: each extra
pass-through arg shifts the allocator one register higher
(r0→r1→r2→r3).

### Verdict

C-42 family expands from 11 to 16 sub-shapes (+5 from brief 241):

| New sub-shape | Picks | Description |
|---|---:|---|
| **C-42:struct-large-offset** | 1 | direct large ldr/str (4095-byte max) |
| **C-42:clamp** | 1 | `n <= 0 → movle`, separate cmp |
| **C-42:legacy_sp3-dup-helper** | 2 | `sub sp, sp, #4` + 2x same helper |
| **C-42:helper3-u64-return** | 1 | `long long` → (r0,r1) split write |
| **C-42:cmp-dispatch-switch** | 3 | switch defeats conditional-exec |

All ship under existing C-42 recipes with arg-count + control-flow
tuning. No new wall class needed.

## (B) Next-cluster scout — top 5 clusters

### Methodology

Ran `predict_walls.py` + `next_targets.py` on EUR post-brief-240
state. Filtered to hard-tier picks WITHOUT a wall prediction
(1204 picks). Indexed every gap-obj symbol → disasm, clustered
by first-5-insns signature.

### Top 5 unclassified clusters

| # | Picks | Shape (first 5 insns) | Description |
|---|---:|---|---|
| 1 | **55** | `push\|sub\|mov\|mov\|mov` | stack-frame multi-arg pass-through |
| 2 | **45** | `push\|mov\|mov\|mov\|mov` | no-stack-frame 4-arg pass-through |
| 3 | **40** | `push\|mov\|ldr\|ldr\|and` | indexed-table + bitfield + helper |
| 4 | **26** | `push\|mov\|mov\|mov\|bl` | 3-arg pass-through + bl |
| 5 | **20** | `push\|mov\|ldr\|cmp\|beq` | load-field + `blx r1` indirect call |

No single cluster crosses the 100-pick pilot threshold, so brief
241 logs the histogram + 3 samples each and defers pilots to
brief 242+.

### Sample disasms

**Cluster 1 — stack-frame multi-arg pass-through (55 picks)**
Sample: `func_02045c34` (72 B):

```text
push  {r4, r5, r6, r7, lr}
sub   sp, sp, #4
mov   r5, r2
mov   r7, r0
mov   r6, r1
mov   r4, r3
mov   r0, r5
mov   r1, #0
bl    helper1
mov   r2, r0
mov   r0, r7
mov   r1, r6
mov   r3, r4
bl    helper2
mov   r0, r5
bl    helper3
add   sp, sp, #4
pop   {r4, r5, r6, r7, pc}
```

Likely C-42 variant — multi-call thunk with 3-4 register saves +
small stack frame (4 B). Brief 239's stack-frame filter excluded
these (sub sp > 0). Decision: don't auto-revert the filter;
brief 242 should pilot 3 picks to confirm shippability.

**Cluster 2 — no-stack-frame 4-arg pass-through (45 picks)**
Sample: `func_02068d50` (72 B): 4-register arg shuffle, byte-
swap arithmetic (`and #0xff`, `orr`, `lsl/lsr` u16-narrow), tail
helper call. Looks like an endian-flip wrapper.

**Cluster 3 — indexed-table + bitfield + helper (40 picks)**
Sample: `func_ov002_0224d19c` (84 B):

```text
push  {r3, r4, r5, lr}
mov   r4, r0
ldr   r0, [pc, #60]   ; pool-A
ldr   r1, [pc, #60]   ; pool-B
and   r3, r4, #1      ; bit0 of arg
mla   r0, r3, r0, r1  ; index = bit0 * size + base
mov   r5, r2
add   r0, r0, r5, lsl #2
ldr   r0, [r0, #288]  ; table[bit0][arg2 * 4 + 0x120]
lsl   r0, r0, #19
lsr   r0, r0, #19     ; (u16) field
bl    helper
...
```

13-bit field extract from indexed-2D-table — common bitfield-array
pattern in DS engines. Needs `extern struct[]` + pool wiring.
Likely shippable with right struct decl.

**Cluster 4 — 3-arg pass-through + bl (26 picks)**
Sample: `func_ov002_021efcf4` (68 B): 3 args saved, bl helper1,
cmp/popeq on result, 4-arg call to helper2. C-42 3-call variant.

**Cluster 5 — load-field + `blx r1` indirect call (20 picks)**
Sample: `func_02084a9c` (40 B):

```text
push  {r4, lr}
mov   r4, r0
ldr   r1, [r4, #16]   ; fnptr = self->f16
cmp   r1, #0
beq   .L_null
blx   r1              ; (mis-disassembled as "msr SP_hyp")
```

**Recipe candidate**: `void (*fn)(struct Self*); ... if ((fn =
self->fnptr) != NULL) fn(self);` — indirect call through stored
function pointer. Brief 242 should pilot 2-3 of these to confirm.

### Saved cluster data

Full histogram + sample disasms saved to `/tmp/brief241/
unclassified_clusters.json` (not committed, regenerable via
`tools/predict_walls.py` + brief 241's scout script).

## (C) Calcrom canon reconciliation

### Brief premise

The mf > cu delta reported by `tools/calcrom.py` was previously
ambiguous — could be read as "missing complete markers." Brief 239
(D) empirically falsified this: 0 incomplete `.text` entries
across the 9 affected overlays.

### Changes

1. **`tools/calcrom.py`** — added explanatory note inline after
   the `complete_units` line in the per-region summary:

   > Note: matched_functions > complete_units is NATURAL — mf
   > counts per function while cu counts per TU. Multi-fn-per-TU
   > shipping contributes N to mf and 1 to cu. The delta is NOT
   > a 'missing complete marker' indicator (see brief 239 (D) for
   > the empirical audit: 0 incomplete entries across all 9
   > overlays where mf > cu).

2. **`memory/reference_metric_canon.md`** — appended a new section
   "`matched_functions > complete_units` is NATURAL (brief 241)"
   with the metric-units explanation and the brief 239 (D)
   reference.

### Future bookkeeping audit

If a real bookkeeping gap audit is needed (e.g., gap-object fns
that are byte-identical to orig but live in `_dsd_gap@*.o` rather
than dedicated `.s`/`.c` files), it'd be a separate analysis
orthogonal to calcrom — likely a `tools/audit_gap_obj_matches.py`
that scans gap-obj .text bytes vs orig and flags exact matches.
Out of scope for brief 241.

## Shipped worked examples (7)

- `src/main/func_020327c0.c` (36 B) — struct-large-offset
- `src/main/func_0202bae4.c` (40 B) — clamp `r <= 0`
- `src/main/func_02049f38.legacy_sp3.c` (40 B) — sp3 dup-helper
- `src/main/func_0204b0a8.c` (40 B) — helper3 returns u64
- `src/main/func_02050118.legacy_sp3.c` (40 B) — sp3 dup-helper + 2 strb
- `src/overlay002/func_ov002_021eeea4.c` (32 B) — 3-arg if-else
- `src/overlay002/func_ov002_02242e30.c` (32 B) — switch bne
- `src/overlay002/func_ov002_022951a4.c` (32 B) — bitfield 2-arg

(8 files total — the `02242e30` is small enough to also count
the `021eeea4` and `022951a4` as sibling ships under the same
recipe family.)

## Detector + tests

No detector changes needed — all picks fold under existing C-42
recipe with arg-count tuning + control-flow form. Recipe gotchas
expanded with gotcha 7 (arg-count → temp-reg allocation).

All 119 existing tests pass.

## Cross-references

- `docs/research/recipe-gotchas.md` — pre-flight reference (now
  with gotcha 7 added)
- `docs/research/codegen-walls.md` — C-42 sub-shape catalog
- `docs/research/brief-238-c42-drain-wave1.md` — original 7
  deferred picks
- `docs/research/brief-239-c39e-sub-c42-audit-gotchas.md` —
  C-42 detector audit (97.3% TP) + calcrom verdict
- `memory/reference_metric_canon.md` — mf > cu canon (updated)
- `tools/calcrom.py` — per-region note added
- `tools/predict_walls.py` — C-42 detector unchanged
