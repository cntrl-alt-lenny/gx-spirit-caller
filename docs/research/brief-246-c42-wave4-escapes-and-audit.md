[//]: # (markdownlint-disable MD013 MD041)

# Brief 246 — C-42 wave 4 escapes + audit

**Status:** 2 of 2 escapes LOCKED. Both turned out to be standard
gotcha 7 applications at the WRONG arg count. No new gotcha
needed.

## Headline

- **(A) `func_02087528`** — brief 245 misdiagnosed this as an
  objdiff scoring quirk ("bytes match but fuzzy disagrees").
  Actual issue: a real reg-alloc divergence (r1 vs r2 for the
  temp). Standard gotcha 7 application with 2-arg pass-through.
  objdiff was correct all along.
- **(B) `func_ov002_02259f74`** — `movhi` unsigned-compare
  variant. Brief 245 misapplied gotcha 7 with 2-arg pass-through
  (pool to r2). Correct fix: **1-arg pass-through** (pool to r1).
  Function returns helper's int — 1-arg pass-through reserves r0,
  pushing the pool to r1.

2 worked examples shipped. No recipe-gotchas.md changes needed
— both fit existing gotcha 7 framework. The key lesson: when
applying gotcha 7, COUNT THE ORIG'S DESIRED TEMP REGISTER first,
then pick the arg count that produces that target:

| Orig temp reg | Function arg count to apply |
|---|---|
| r1 | 0 or 1 |
| r2 | 1 or 2 |
| r3 | 3 (or more) |

(The mapping depends on whether the helper takes args that
push live registers up.)

## (A) `func_02087528` — sp3 escape

### What brief 245 reported

> Pattern: `if (self->f8 == 0) return; helper(1 << self->f0);`.
> Disasm matches byte-for-byte ARM in objdump, but objdiff reports
> 66.67% fuzzy. Recipe likely correct but objdiff scoring may be
> misled by a relocation difference.

### What's actually happening

Brief 245's claim that objdump shows byte-identical was wrong. A
careful disasm comparison shows a register-allocation diff:

**Mine** (brief 245's recipe):

```text
ldr   r1, [r0, #8]    ; r1 (mine)
cmp   r1, #0
...
mov   r1, #1           ; r1 (mine)
lsl   r0, r1, r0
```

**Orig**:

```text
ldr   r2, [r0, #8]    ; r2 (orig)
cmp   r2, #0
...
mov   r2, #1           ; r2 (orig)
lsl   r0, r2, r0
```

Same instructions, different temp register. objdiff's 66.67%
fuzzy_match correctly reflects this — the bytes are NOT identical.
The 33% "diff" is the register encoding bits.

### Recipe (gotcha 7 — 2-arg pass-through)

```c
/* file: src/main/func_02087528.legacy_sp3.c */
extern void helper(int x, int arg);
void func(struct Self *self, int arg) {
    if (self->f8 == 0) return;
    helper(1 << self->f0, arg);
}
```

The 2nd arg keeps r1 live across the bl, forcing the temp to r2.

### Lesson

Before classifying an escape as a tooling issue, do a manual
register-by-register comparison of the disasm. Brief 245's claim
was likely formed from an objdump comparison that missed the
register diff because the diff is "just one nibble" per
instruction.

## (B) `func_ov002_02259f74` — movhi escape

### Orig

```text
push  {r3, lr}
ldr   r1, [pc, #20]
ldr   r1, [r1, #0xcf8]     ; r1 = pool global (unsigned int)
cmp   r1, #3
movhi r0, #0               ; if r1 > 3 (unsigned): r0 = 0
pophi {r3, pc}
bl    helper
pop   {r3, pc}
```

### What brief 245 tried

> Orig uses r1 for pool address; my 2-arg attempt picked r2 (wrong).
> Re-tried with 1-arg helper (no gotcha 7) — mwcc still picks r2.

Brief 245 mistakenly applied gotcha 7 at the 2-arg level. That
pushes the temp from r0 (natural) → r2 (with 2 args), skipping r1.

### Recipe (gotcha 7 — 1-arg pass-through)

```c
extern int helper(int x);
int func(int x) {
    if (data.f3320 > 3) return 0;
    return helper(x);
}
```

Function takes 1 arg (`x`), helper takes 1 arg (`x`). Effect:
- r0 = x (incoming, live until helper call)
- Pool/global needs a reg → r0 taken → goes to r1
- movhi r0, #0 → cleanly writes r0 (was live, but if we're
  returning 0 here it's no longer needed)
- bl helper → r0 has x for the helper call

Byte-identical match to orig on first try.

### Key insight

The unsigned compare (`> 3` on `unsigned int`) emits `movhi`
naturally — no special source idiom needed. Brief 245's note
that "movhi has different reg-alloc trigger" was incorrect — the
trigger is the same as any predicated tail; only the arg count
was wrong.

## Variant matrix summary

| Escape | brief 245's attempt | Correct | Why |
|---|---|---|---|
| 02087528 | 0-arg → r1 (wrong) | 2-arg → r2 | orig wants r2 |
| 02259f74 | 2-arg → r2 (wrong) | 1-arg → r1 | orig wants r1 |

The fix in both cases: COUNT THE ORIG'S TEMP REG FIRST. Then
gotcha 7 mechanically picks the right arg count.

## Shipped worked examples (2)

- `src/main/func_02087528.legacy_sp3.c` — sp3 + 2-arg gotcha 7
- `src/overlay002/func_ov002_02259f74.c` — movhi + 1-arg gotcha 7

## (C) Opportunistic — meta-observation on recipe-gotchas.md

The catalog is now 11 gotchas + 6-step diagnostic order, ~820
lines. Brief 246 considers whether a different representation
would serve future decomper briefs better.

### Proposal: index by symptom, not by gotcha number

The current organization is chronological (gotchas 1-11 in order
discovered). Decomper briefs would benefit more from a
"symptom → likely gotcha" lookup table at the top of the file,
something like:

| Symptom | First-try gotcha |
|---|---|
| Wrong temp reg (orig r2, mine r1) | 7 (count helper args) |
| Wrong temp reg (orig r1, mine r0) | 7 (1-arg pass-through) |
| Wrong stack-save reg (orig r4, mine r5) | 11 (decl order) |
| Pool/literal reg swap (orig r1 pool, mine r0 pool) | 8 (return-LIT-match) |
| stmfd + sub sp prologue mismatch | 10 (`.legacy_sp3.c`) |
| str+str pair instead of stmia | 10 (1.2/sp3 routing) |
| Extra `moveq r0, #0` | 1 (return r vs return 0) |
| Wrong cond predicate (movge vs movlt) | 3 (ternary polarity) |
| Wrong sub/cmp opcode (subs+movmi vs sub+cmp+movle) | (clamp `<= 0` vs `< 0`) |

This would be a CONCISE prepend at the top of the doc — the
existing gotcha-by-gotcha breakdown stays as the deep-dive
reference. Decomper briefs would scan the table first; if they
match a symptom, jump to the corresponding gotcha for details.

### Not implemented — proposed for brain to decide

Brief 246 surfaces this as a proposal but does NOT replace the
existing doc. The proposed change is additive (a header table)
and zero-risk to existing readers. Brain can decide whether to
adopt it in a future bookkeeping brief.

### Alternative: cluster scout — DONE

Brief 246 re-ran brief 241's cluster scout to check if any new
cluster crossed the 100-pick threshold. Result: **no new
clusters above 100**. The top-5 clusters are unchanged from
brief 241:

| Cluster | Picks (brief 246) | Picks (brief 241) | Delta |
|---|---:|---:|---:|
| stack-frame multi-arg pass-through | 55 | 55 | 0 |
| no-stack-frame 4-arg pass-through | 45 | 45 | 0 |
| indexed-table-bitfield + helper | 40 | 40 | 0 |
| 3-arg pass-through + bl | 26 | 26 | 0 |
| load-field + `blx r1` indirect call | 20 | 20 | 0 |

Wall family histogram (post-drain):
- **C-42 dropped from 851 → 539 picks** (-312 — drained by waves
  1-4 + reclassified by brief 244's detector improvements)
- C-39 family unchanged (1279 picks)
- C-1 / C-23 dominant tiers unchanged (3774 / 3340 picks)

This is a useful negative finding: the 101-pick C-42 drain came
from C-42's own population, NOT from any of the brief 241
clusters. The clusters represent a SEPARATE residue that didn't
benefit from C-42 drain. Brief 247 should either continue C-42
drain (still 539 picks remaining) or pivot to the 55-pick
stack-frame cluster (still the largest unclassified).

Total unclassified after C-42 drain + brief 244 detector
expansion: **1204 picks** (unchanged from brief 241 — the
delta is wall-family migrations within the predicted pool, not
new unclassified arrivals).

## Verification

3-region SHA1 PASS (EUR/USA/JPN).

## Cross-references

- `docs/research/brief-245-c42-opportunistic-drain-wave4.md` —
  original escape filing
- `docs/research/brief-242-c42-reg-alloc-divergence-investigation.md`
  — original gotchas 7-10
- `docs/research/brief-244-c42-reg-alloc-investigation-wave2.md` —
  gotcha 11
- `docs/research/recipe-gotchas.md` — full catalog (11 gotchas
  + 6-step diagnostic order)
