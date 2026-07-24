# Brief 664 — ov002 unknown pool, batch 1 (queue item cm-unknown-ov002-651)

**Result: 6/11 shipped (55%), 5 documented near-misses, 3-region gate PASS.**

## Method

Brief 650 (PR #1231) already sampled 15 ov002 functions (5 shipped);
this batch explicitly excludes all 15 of those addresses (read from
`docs/research/brief-650-ov002-sweep.md`'s own per-candidate table,
which lists all 15 including the 10 parked/unshipped ones — the PR
diff alone only shows the 5 that landed). Sampled the NEXT smallest
files in ov002's `unknown` pool (the report called these 505B+ based on
on-disk `.s` file length — the selector had no `.text` size field yet).
That label is not a validated `.text` threshold, and the claim that
everything below it had already been swept is void. Header-read before
compiling.

### Measurement correction

Use the selector's committed-delinks `text_size` field for future tiers, not
filesystem byte length. The historical 6/11 result is still valid for the
files actually attempted, but it must not be used as evidence that the
ov002 pool below 505 B of `.text` was exhausted.

## Ships (6)

| Function | Shape | Notes |
|---|---|---|
| `func_ov002_022bdb18` | zero 17 struct fields | pointer-walk vs array-index lever |
| `func_ov002_02202b2c` | 6-bit bitfield range check | switch lever, reused sibling bitfield type |
| `func_ov002_0220cf0c` | 6-bit bitfield range check | first try, 100% |
| `func_ov002_022ae718` | null-guard + global-flag check | new nested-if lever (see below) |
| `func_ov002_02216530` | bitfield-compare + second check | same nested-if lever, zero-shot |
| `func_ov002_0223b3cc` | linear search returning element ptr | unsigned-loop-counter lever |

All 6 ported to USA + JPN (18 objects total across 3 regions), each
individually verified 100% via objdiff before the final gate.

## New lever: inverted nested-if for asymmetric branch/predicate shape

Several ov002 functions have the shape "if (guard) return 0; return
(second_check) ? X : 0;" where the target wants the FIRST guard as a
real **branch** but the return's OWN comparison predicated normally.
Neither the plain early-return form nor the brief-655-style converged
if/else (both arms writing to one `result` local) reproduced this —
both over-predicated the first guard. The fix is inverting the first
guard and nesting the second check strictly inside it, with the
early return only on the INNERMOST single-statement branch:

```c
/* wrong: both forms below over-predicate the outer guard */
if (guard) return 0;
return check ? X : 0;

if (guard) { result = 0; } else { result = check ? X : 0; }
return result;

/* right: outer guard inverted, no else, return only inside */
if (!guard) {
    if (check) {
        return X;
    }
}
return 0;
```

Confirmed on 2 functions (`func_ov002_022ae718`, `func_ov002_02216530`
— the second one zero-shot once the pattern was known). Distinct from
brief-655's "converge to one return" lever, which defeats *unwanted*
predication for a *single* early return — this fixes a *two-guard*
shape where the outer guard specifically wants a branch while an
*inner* single-statement return still predicates normally.

## Parked near-misses (5)

| Function | Match% | Diagnosis |
|---|---|---|
| `func_ov002_021b91d0` (swap two ints) | 30%→0% | Target reserves a stack slot via `push {r3}` (a caller-saved register used purely for +4 bytes of scratch) and genuinely stores `tmp` there; our compile keeps `tmp` in a register with no frame at all. `volatile` overcorrects to a completely different (`sub sp,#8`, double-reload) shape. No working lever found. |
| `func_ov002_021aff4c` (insert byte into u16 array element) | 27%–38% | Target computes the byte-insert via `lsl#24` then an embedded `lsr#16` in the final `orr`; masking (`&0xff`), an explicit shift-pair, and a real bitfield-write all canonicalize to the SAME (wrong, AND-based) instruction selection. Confirmed instruction-selection wall, not reg-alloc. |
| `func_ov002_021f95f8` (bitfield switch + call) | 54.5% | Pure register-letter swap (r1 vs r2) for the bitfield-extraction scratch register. 3 source variants (named local, raw shift expression, declaration order) produced byte-identical wrong output — matches the documented reg-alloc/scratch-register anti-pattern (0W/7F). |
| `func_ov002_0220cff8` (bitfield-vs-global compare, two globals) | 26.7%–28.6% | Same bitfield-compare-then-branch shape as the 2 shipped siblings, but register assignment (r1↔r2) is swapped versus target; the nested-if control-flow fix (which worked for the siblings) is present here too, just with the wrong register letters. Operand-order and explicit-local variants didn't change it. |
| `func_ov002_022576d8` (double-null-guard + tail call) | 81.8% | Logic, branch shape, and epilogue all match exactly; only the scratch register holding `result->field8` differs (target keeps a fresh r1, ours reuses r0 since `result` is dead after the read). Both `\|\|` and De Morgan `&&` forms produce identical output. Strongest near-miss of the batch — a single-register residue. |

## Tooling fix carried over from brief 663

The scratchpad `activate.py`/`activate2.py`/`revert.py`/`revert2.py`
helpers only knew about `config/<region>/arm9/delinks.txt` (main's
path). Extended them this session to also search
`config/<region>/arm9/overlays/<ovNNN>/delinks.txt` for overlay
modules — needed for every ship and revert in this batch. Also
reused brief 663's fix for full-block delinks.txt replacement (not
just the header line) when porting to USA/JPN.

## Gate

`python tools/gate3.py --scope all` — 3-region PASS (EUR, USA, JPN
sha1 all OK).
