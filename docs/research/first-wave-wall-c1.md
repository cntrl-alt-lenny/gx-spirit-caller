# First-wave wall — C-1 predicated execution chain

**Brief:** 189 Part 2 (scaffolder). C-1 is the most frequently
predicted wall in the brief 187 queue (10 / 40 = 25 %), but it
also has the highest false-positive rate of the regex-detectable
walls. This note documents what's really C-1 vs what's noise,
and how the decomper should respond.

## Recognition cue

`tools/predict_walls.py` flags any function whose disasm contains
**3+ consecutive predicated-execution instructions** (instructions
with a conditional suffix like `eq` / `ne` / `hi` / `ls` / `gt` /
`lt` / `ge` / `le`). Branches (`b{cond}`, `bl{cond}`, `bx{cond}`)
are excluded — only data-processing predicates count.

```text
cmp     r3, r1
orrhi   r1, r2, r1         ; predicated #1
lslls   r1, r3, #16        ; predicated #2
orrls   r1, r2, r1, lsr #16 ; predicated #3 → C-1 fires
```

vs an early-return source the decomper might write:

```c
if (r3 > r1) {
    r1 |= r2;
} else {
    r1 = (r2 | ((r3 << 16) >> 16)) | r2;
}
```

The wall: mwcc 2.0 may emit a predicated chain when the source
encodes an early-return; matching requires recognising which
shape produces which output. See
[`docs/research/codegen-walls.md` § C-1](codegen-walls.md#c-1)
for the full recipe.

## False positive rate is HIGH

The C-1 classifier is the noisiest of the brief 189 detectors:

- **3-op chains with a single condition** (`moveq` / `moveq` /
  `moveq` selecting one of several small values) are normal ARM
  idioms mwcc 2.0 emits correctly from straightforward C
  ternaries. Not C-1.

- **`tst rN, #flag; instrne ...; instrne ...; instrne ...`** —
  flag-bit test patterns are very common; the chain is just the
  if-true body, not a fused early-return.

- **`cmp r0, #0; moveq r0, #1; bne ...`** — simple "zero → 1"
  + branch pattern. Not C-1.

The **definite C-1** signal:

- 4+ predicated ops in a row, AND
- Mixed conditions on the same flag-set (e.g. `hi` and `ls`
  appearing close together — these are mutually-exclusive
  conditions that only make sense if mwcc fused two branches
  into one chain).

Of the queue's 10 C-1 hits, ~3 look like definite C-1 (4+ ops
with mixed conditions); ~7 are likely false positives.

## Routing decision

**Try the default `.c` routing first.** Unlike StyleA, C-15, or
C-24, C-1 does NOT have a routing-tier escape hatch — the wall
is a peephole behaviour mwcc 2.0 applies regardless of routing.
The fix lives in the C source: refactor early-return → fused
chain (or vice versa) to match what mwcc emits.

```c
// If orig uses fused predication, source needs the COMPOUND form:
result = (cond_a) ? (val_if_a) : (val_else);

// If orig uses early-return, source needs the EARLY-RETURN form:
if (cond_a) return val_if_a;
return val_else;
```

The decomper picks based on the orig asm shape after writing the
default C and checking objdiff.

## Workaround — refactor the source

Per [`docs/research/codegen-walls.md` § C-1](codegen-walls.md#c-1),
the recipes are:

1. **Fused-predication target** (`orrhi` / `movhi` / etc. all
   on the same fall-through path): write the source as a
   compound expression that doesn't BRANCH at all. mwcc 2.0
   then emits predication for the conditional ops.

2. **Early-return target** (predicated `pop` / predicated `bx
   lr` / explicit early-return shape): write the source as
   `if (cond) return X;` followed by the else-path. mwcc 2.0
   emits the early-return cleanly.

The decomper's iteration cycle:

```bash
# 1. Write default C (whichever shape reads naturally).
edit src/main/func_NNN.c
ninja

# 2. Check objdiff. If it shows predication vs early-return
#    divergence, swap the source shape.
ninja objdiff
# (inspect the diff GUI or `report.json`)

# 3. Rewrite + re-iterate. Usually 2-3 cycles for C-1 targets.
```

## Permuter strategy

The decomp-permuter (`tools/permute.py` per brief 098) has had
mixed success on C-1 cases. The permuter mutates variable order
and expression form, but the predication-vs-early-return choice
isn't something the permuter explores by default.

**When to escalate to the permuter:**

- The default `.c` source compiles to ~90 % match but the last
  divergence is in the predication chain.
- Manual refactoring of the if/return shape hasn't converged
  after 3+ iterations.

**Permuter recipe:**

```bash
python tools/permute.py --version eur --module main \
    --addr 0x02094d18 --setup
cd perm_work/<auto-name>/
# Edit base.c to add the alternative shape as a comment
# the permuter can swap to. The randomise_other_statements
# flag in perm_settings.toml may help.
./run.sh
```

Skip the permuter entirely on C-1 cases the classifier reports
in the false-positive subclass (3-op single-condition chains).

## Subclass cheat-sheet

For each C-1-flagged pick, classify into subclass before
spending iteration cycles:

| Disasm shape | Subclass | Action |
|---|---|---|
| 3 ops, single condition (e.g. 3× `moveq`) | Likely false positive | Default `.c`, ignore C-1 |
| 3+ ops, mixed conditions on same flag-set (`hi` + `ls`) | Probable C-1 | Try fused-predication source first |
| 4+ ops, condition transitions across `cmp` instances | Definite C-1 | Consult `codegen-walls.md` § C-1 + iterate |

## Cross-references

- [`docs/research/codegen-walls.md` § C-1](codegen-walls.md#c-1)
  — the full wall entry with the predication-vs-early-return
  recipe + worked examples.
- [`tools/permute.py`](../../tools/permute.py) — brief 098
  permuter wrapper.
- [`docs/research/code-decomp-wall-predictions.md`](code-decomp-wall-predictions.md)
  § *C-1 caveat* — additional context on the classifier's
  false-positive rate.
- [`docs/decomp-workflow.md` § *Code-decomp resumption*](../decomp-workflow.md#code-decomp-resumption--the-post-scaffold-playbook)
  — brief 187's routing-decision tree references this note.
