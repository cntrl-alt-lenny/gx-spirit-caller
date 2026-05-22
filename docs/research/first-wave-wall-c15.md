# First-wave wall — C-15 flat-thunk arg-setup constant pair

**Brief:** 189 Part 2 (scaffolder). C-15 is the third-most-common
wall in the brief 187 queue (2 / 40 = 5 %; project-wide 869 /
9,849 ≈ 8.8 %). Same routing family as the Style A epilogue
(`.legacy.c` / mwcc 1.2/sp2p3), so it's frequently a co-fire
with StyleA detection.

## Recognition cue

`tools/predict_walls.py` flags any function whose disasm contains
either of:

1. **`mvn rN, #0`** — explicit "-1" materialisation. Common in
   the mwcc 1.2 form.
2. **`mov rN, #K` immediately followed by `sub rM, rN, #1`** —
   the mwcc 2.0 alternative to (1).

Both forms produce the same constant value (`-1` or `K-1`), but
mwcc 2.0/sp1p5 prefers the `mov; sub` form via peephole
optimisation that mwcc 1.2/sp2p3 lacks.

Example queue picks:

| Pick | Module | Size | Disasm context |
|---|---|---|---|
| `func_0200b2f4` | main | 0x68 | flat-thunk arg setup `mov rN, #K; sub rM, rN, #1` |
| `func_02021b38` | main | 0x74 | same shape + a C-1 predicated chain |

## Why this is a wall

mwcc has two ways to produce the constant pair `(K, K-1)` or
`(K, -1)`:

- **mwcc 1.2/sp2p3 (legacy)** emits `mov rN, #K; mvn rM, #0`
  when the source uses `(K, -1)`. The two values are
  independent immediates.
- **mwcc 2.0/sp1p5 (default)** applies a peephole that derives
  the second value from the first: `mov rN, #K; sub rM, rN, #1`.
  Strictly fewer pool bytes; structurally different asm.

When the orig was built with mwcc 1.2 (Style A epilogue
territory), it uses the `mvn` form. Default-routing C source
under mwcc 2.0 produces the `mov; sub` form, which doesn't
match.

## Routing decision

**`.legacy.c` (mwcc 1.2/sp2p3).** Same routing as StyleA — both
walls have a strong correlation in the orig because both are
"this function was compiled with mwcc 1.2" tells.

```bash
# Rename to .legacy.c BEFORE writing C source:
touch src/main/<func>.legacy.c
```

If the function ALSO hits StyleA (which is common — they're
in the same compiler-family), one `.legacy.c` suffix handles
both.

## Workaround — none required at the source level

Like StyleA, C-15's "workaround" is purely the routing decision.
You can't coerce mwcc 2.0 into the `mvn #0` form via any
C-source trick — the peephole is unconditional in 2.0. The fix
is exclusively `.legacy.c` routing.

If a function has the `mvn #0` shape in orig but its caller-
context forces it to NOT be `.legacy.c` (e.g. it shares a TU
with another function that must be default-routed), file a
codegen-walls follow-up note documenting the constraint —
that's a multi-symbol-TU edge case worth tracking.

## Permuter strategy

**Not needed.** C-15 is a deterministic routing decision once
recognised. Don't burn permuter time on it.

If after `.legacy.c` routing the function STILL doesn't match,
the divergence is elsewhere (likely C-1 or some unflagged wall);
look there before suspecting the constant pair shape.

## Worked examples from the queue

### `func_0200b2f4` (size 0x68)

Predictor says C-15. Disasm shows:

```text
... mov rN, #K ...
... sub rM, rN, #1 ...   ; ← mwcc 2.0's derived form
```

(Specific mov/sub addresses extractable via
`arm-none-eabi-objdump -D -b binary -m armv5te
--start-address=0xb2f4 --stop-address=0xb35c
extract/eur/arm9/arm9.bin`.)

Action: `touch src/main/func_0200b2f4.legacy.c` and write the
natural C with the `(K, K-1)` constant pair. mwcc 1.2/sp2p3
emits the `mvn` form to match orig.

### `func_02021b38` (size 0x74, also hits C-1)

Predictor says C-15 + C-1. Suggests the function has BOTH a
constant pair AND a predicated chain. Treat as Style A / C-15
family first (route to `.legacy.c`); if that closes the
constant pair divergence but the predication still doesn't
match, escalate to the C-1 recipe.

## Cross-references

- [`docs/research/codegen-walls.md` § C-15](codegen-walls.md#c-15)
  — the full wall entry with peephole-machinery discriminator
  + per-SP sweep table.
- [`docs/research/first-wave-wall-style-a.md`](first-wave-wall-style-a.md)
  — sibling routing decision (same `.legacy.c` suffix).
- [`docs/research/codegen-walls.md` § C-23 / C-26](codegen-walls.md#c-23)
  — other `.legacy.c`-routed walls in the same compiler-family.
- [`docs/decomp-workflow.md` § *Code-decomp resumption*](../decomp-workflow.md#code-decomp-resumption--the-post-scaffold-playbook)
  — brief 187's routing-decision tree references this note.
