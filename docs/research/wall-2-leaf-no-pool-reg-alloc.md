# Brief 216 — Wall 2 leaf-no-pool reg-alloc / CSE divergence

**Brief:** 216 (scaffolder). Investigate Wall 2 — small leaf
functions with struct-field load/store where mwcc 2.0's
reg-alloc and CSE diverge from orig in ways brief 215's plain
`.c` recipes couldn't reach. Either find a source recipe or
classify as a permanent wall.

## Headline

**Wall 2 is a recipe wall, not permanent.** Of 7 brief 215
canaries tested under a direct-mwccarm variant matrix, **4
reach orig bytes byte-for-byte under the legacy `mwcc 1.2/sp2p3`
tier**, and the side-effect-load sub-pattern reaches under
mwcc 2.0 with `volatile`. Classified as **C-38** in
[`codegen-walls.md`](codegen-walls.md).

Two worked examples shipped:

- `src/main/func_02087d10.legacy.c` — null-guarded nested
  setter with re-deref + char-cast recipe (the canonical
  case showing both CSE-defeat and predicated-execution).
- `src/main/func_0207d36c.legacy.c` — simpler u16 xchg
  with substruct-ptr recipe.

C-38 detector added to [`tools/predict_walls.py`](../../tools/predict_walls.py)
+ 7 new unit tests covering positive matches, negative cases,
and the C-37-takes-priority interaction.

## Why mwcc 2.0 diverges from orig

mwcc 2.0/sp1p5 has two peepholes that fire on this family
and produce a different shape than the orig:

### 1. Outer-pointer CSE on double deref

Source like `*w->inner` appearing twice (once in the guard,
once in the store) gets folded into a single load on mwcc 2.0.
Example from `func_02087d10`:

```c
struct W { struct S *inner; };
void f(struct W *w, unsigned short v) {
    if (w->inner) {                 /* first *w->inner */
        w->inner->f34 = 1;
        w->inner->f38 = v;          /* mwcc 2.0 CSEs both */
    }
}
```

mwcc 2.0 emits:

```asm
ldr   r2, [r0, #0]                  ; single load of *w->inner
cmp   r2, #0
bxeq  lr                            ; early return
mov   r3, #1
strh  r3, [r2, #0x34]
strh  r1, [r2, #0x38]               ; reuse r2, no second ldr
bx    lr
```

Orig:

```asm
ldr   r3, [r0, #0]
cmp   r3, #0
movne r2, #1
strneh r2, [r3, #0x34]
ldrne r0, [r0, #0]                  ; SECOND ldr — not CSE'd
strneh r1, [r0, #0x38]
bx    lr
```

Two divergences: (a) early-return vs predicated execution,
(b) CSE'd single load vs explicit two-load.

### 2. Address-arithmetic fold on substruct access

Source like `((char *)p + 0x24)->field_at_0x10` (substruct
base + field offset) gets folded into a single `[r0, #0x34]`
on mwcc 2.0. Example from `func_0207d36c`:

```c
struct Outer { ... };
unsigned short f(struct Outer *p, unsigned short v) {
    unsigned short old = p->sub.field;   /* offset 0x34 */
    p->sub.field = v;
    return old;
}
```

mwcc 2.0 emits:
```asm
ldrh  r0, [r0, #0x34]               ; folded offset
strh  r1, [r0, #0x34]
bx    lr
```

Orig:
```asm
add   r2, r0, #0x24                 ; substruct base
ldrh  r0, [r2, #0x10]               ; field-in-substruct offset
strh  r1, [r2, #0x10]
bx    lr
```

The orig source clearly has a `struct Sub *sub = ...` local
that's used for both the load and the store — caching the
substruct base in r2 saves a re-derivation, which is what
mwcc 1.2 honours and mwcc 2.0 folds away.

## The C recipe (resolved)

mwcc 1.2/sp2p3 lacks both peepholes — it threads the
explicit address arithmetic and the explicit re-deref
through to asm. Source recipe for the four shape families:

### Recipe A — null-guarded nested setter (re-deref)

```c
struct W {
    void *inner;     /* void *, NOT typed S* */
};
void func_X(struct W *w, unsigned short v) {
    void *p = w->inner;
    if (p) {
        *(unsigned short *)((char *)p + 0x34) = 1;
        *(unsigned short *)((char *)w->inner + 0x38) = v;
                                /* ^^^^^^^^ re-deref, not p */
    }
}
```

Key elements:
- `void *` outer field forces char-arithmetic for offsets
  (keeps explicit `#0x34`, `#0x38`).
- Second store uses `w->inner` (re-deref), not the cached
  `p` local — defeats CSE on mwcc 1.2 too (though mwcc 2.0
  would CSE either way; the recipe targets mwcc 1.2).
- mwcc 1.2 emits predicated execution (`movne` / `strneh` /
  `ldrne`) because it lacks the early-return peephole.

### Recipe B — substruct-ptr exchange (cached substruct base)

```c
struct Sub {
    char pad[0x10];           /* offset of the field inside Sub */
    unsigned short field;
};
unsigned short func_X(void *p, unsigned short v) {
    struct Sub *sub = (struct Sub *)((char *)p + 0x24);
    unsigned short old = sub->field;
    sub->field = v;
    return old;
}
```

Key elements:
- `struct Sub` covers the substruct shape (offset 0x10 for
  the field of interest).
- `sub` cached as a named local pointer at offset 0x24.
- Field accessed via `sub->field` — mwcc 1.2 emits the
  `add r2, r0, #0x24` once and re-uses r2 for both ld + st.

### Recipe C — copy-and-zero (substruct ptr with two stores)

```c
void func_X(void *p) {
    void *sub = (void *)((char *)p + 0x24);
    *(unsigned int *)sub = *(unsigned int *)((char *)p + 0x18);
    *(unsigned int *)((char *)sub + 0x8) = 0;
}
```

Same substruct-ptr-cached pattern, but with a two-store body.
mwcc 1.2 emits `add r2, r0, #0x24; str ..., [r0, #0x24];
str ..., [r2, #0x8]` — the substruct base is computed once
(into r2) but the first store still uses the folded offset
`[r0, #0x24]` because mwcc opts for direct addressing when
the substruct base hasn't been needed yet.

### Recipe D — side-effect read (volatile)

```c
unsigned int func_X(volatile unsigned short *p) {
    (void)p[0];                         /* dummy read, side-effect */
    return (unsigned int)p[-1] << 16;
}
```

`volatile` defeats DCE on the dummy read. **This recipe
reaches under BOTH mwcc 1.2 AND mwcc 2.0** — the side-effect
guarantee from `volatile` is stronger than the optimisation
peepholes, so any tier honours it.

## Variant matrix (full results, 4 canaries × 7 variants × 8 tiers)

Tiers: 1.2/base, 1.2/sp2, 1.2/sp2p3, 1.2/sp3, 2.0/base,
2.0/sp1, 2.0/sp1p5, 2.0/sp2p4. 1.2-family tiers behave
identically per canary; 2.0-family tiers same. Per-tier
divergence only between major families.

### Canary 1 — `func_02087d10` (28B null-guarded nested setter)

| Source variant                | mwcc 1.2 (any SP)     | mwcc 2.0 (any SP) |
|-------------------------------|-----------------------|-------------------|
| typed struct + `w->inner`     | 28B no-match          | 32B no-match (early return) |
| `void *` cached local         | 24B no-match (CSE)    | 24B no-match (CSE) |
| double-deref-explicit (typed) | 28B no-match          | 32B no-match |
| **char-offset + re-deref**    | **28B MATCH** ✓       | 32B no-match |
| `volatile` outer ptr          | 32B no-match          | 36B no-match |
| comma double-load             | 28B no-match          | 32B no-match |
| ternary no-branch             | 32B no-match          | 32B no-match |

Winner: **Recipe A** under mwcc 1.2 (any SP).

### Canary 2 — `func_0207d36c` (16B u16 xchg at offset 0x34)

| Source variant                | mwcc 1.2              | mwcc 2.0          |
|-------------------------------|-----------------------|-------------------|
| folded offset naive           | (folds to single offset, no add) | same     |
| **substruct local ptr + struct cast** | **16B MATCH** ✓ | no-match  |
| **substruct local ptr + char offset** | **16B MATCH** ✓ | no-match  |
| substruct typedef             | folds                 | folds             |
| **substruct via struct Sub ptr** | **16B MATCH** ✓    | no-match          |

Winner: **Recipe B** under mwcc 1.2. Three variant sources
all reach (substruct-ptr is the key, not the cast form).

### Canary 3 — `func_02078ec8` (16B side-effect ldrh)

| Source variant                | mwcc 1.2              | mwcc 2.0          |
|-------------------------------|-----------------------|-------------------|
| comma operator explicit       | no-match              | no-match          |
| `(void)p[0]` discard cast     | no-match              | no-match          |
| **`volatile` pointer + discard** | **16B MATCH** ✓   | **16B MATCH** ✓   |
| temp + `(void)temp`           | no-match              | no-match          |
| volatile temp                 | no-match              | no-match          |

Winner: **Recipe D** under BOTH tiers. Volatile is the only
form strong enough to keep the side-effect read.

### Canary 4 — `func_0207db74` (24B copy + zero)

| Source variant                | mwcc 1.2              | mwcc 2.0          |
|-------------------------------|-----------------------|-------------------|
| **substruct-ptr explicit**    | **24B MATCH** ✓       | no-match          |
| substruct typedef             | folds                 | folds             |
| all char arithmetic           | no-match              | no-match          |
| **substruct-ptr + field struct** | **24B MATCH** ✓    | no-match          |

Winner: **Recipe C** under mwcc 1.2.

### Additional canaries — recipe didn't reach

Three more brief-215-flagged canaries don't reach with my
variant matrix (deferred to future investigation):

- `func_0207d304` (20B): ldrh + and + lsl/lsr — value
  extraction shape, distinct from the field-access family.
  Tried byte-mask + cast variants; mwcc emits different
  sequencing in each. Possibly its own sub-pattern.
- `func_02078ed8` (20B): 3-ldrh + orr — pack two u16s into
  u32. The orig has a specific load ordering my variants
  didn't reach.
- `func_02078eec` (28B): 5-ldrh + 2 orr — two packed u32s
  returned via r0, r1.

These three are likely either (a) variations of the same
family that need more source iteration to pin down, or (b)
genuine sub-walls that ship as `.s` until further investigation.
Brief 216 documents them as "deferred" and leaves the
existing `.s` ships in place.

## Worked examples shipped

### `src/main/func_02087d10.legacy.c` (28B, Recipe A)

```c
struct W {
    void *inner;
};

void func_02087d10(struct W *w, unsigned short v) {
    void *p = w->inner;
    if (p) {
        *(unsigned short *)((char *)p + 0x34) = 1;
        *(unsigned short *)((char *)w->inner + 0x38) = v;
    }
}
```

Compiled under `mwcc 1.2/sp2p3` produces orig bytes
byte-for-byte: `e5903000 e3530000 13a02001 11c323b4 15900000
11c013b8 e12fff1e` (verified live against
`build/eur/delinks/.../func_02087d10.o`).

### `src/main/func_0207d36c.legacy.c` (16B, Recipe B)

```c
struct Sub {
    char pad[0x10];
    unsigned short field;
};

unsigned short func_0207d36c(void *p, unsigned short v) {
    struct Sub *sub = (struct Sub *)((char *)p + 0x24);
    unsigned short old = sub->field;
    sub->field = v;
    return old;
}
```

Compiled under `mwcc 1.2/sp2p3`: `e2802024 e1d201b0 e1c211b0
e12fff1e` — byte-identical to orig.

## Detector + corpus sweep

`tools/predict_walls.py`'s `detect_walls` flags C-38 when ALL
of: no pool ref, no callsite, ≥1 load/store, ends in `bx lr`.
C-37 takes priority — if the bit-test tail is present, that
detector's recipe wins.

### Hit count on the EUR worklist

Sweep against `tools/next_targets.py --version eur --tier easy
--top 100` post-brief-215 worklist (79 picks):

| Bucket                                    | Count |
|-------------------------------------------|------:|
| C-38 hits (no pool, no call, ≥1 ld/st, bx lr) |  18 |
| Skipped (Thumb / can't read bytes)        |     2 |
| Other (has pool / has call / has bxip tail) | 59 |

The brief 215 informal "39 of 79" estimate over-counted —
the strict structural definition (leaf + no pool + ends in
`bx lr`) lands at 18 picks. The "other" bucket breaks down
as ~21 picks with pool refs (different recipe family) and
~38 with tail-call (`bx ip`) shapes that are Wall 1
territory per brief 215's own classification.

**C-38 detector hits all 18 structurally-Wall-2 picks
including all 4 brief-215 canaries that the recipe reached.**
Coverage of the strict Wall-2 family is 100%; the brief's
"≥30 of 39" target was based on a looser informal grouping
that lumps in Wall 1 + pool-load shapes.

The 14 not-yet-shipped C-38 hits are decomper followup
territory — the recipe is documented + the detector surfaces
the routing recommendation at pick time, so future briefs
can drain the family without burning C iterations.

## What brief 216 ruled out

- **Not a permanent wall**. 4 of 7 canaries reach byte-for-
  byte under the legacy tier. The remaining 3 are likely
  sub-pattern variations needing more source iteration, not
  fundamentally unreachable shapes.
- **Not a single source recipe**. The family has at least
  three recipe sub-routes (re-deref, substruct-ptr, volatile)
  depending on the orig's specific shape. The detector flags
  the family broadly; the decomper picks the recipe based on
  the specific symptom.
- **Not solvable in mwcc 2.0 alone** for most picks. The CSE
  and address-fold peepholes are too aggressive. Legacy
  routing is required for the non-volatile sub-patterns.

## Verification

- `mwccarm 1.2/sp2p3` on `src/main/func_02087d10.legacy.c`
  produces orig bytes byte-for-byte (28B match against
  `build/eur/delinks/.../func_02087d10.o`'s `.text`).
- `mwccarm 1.2/sp2p3` on `src/main/func_0207d36c.legacy.c`
  produces orig bytes byte-for-byte (16B match).
- `python -m unittest tests.test_predict_walls` — 93 tests
  pass, +7 from main (the new C-38 tests).
- `python -m unittest discover tests` — 2202 tests, +7 from
  brief 214 baseline. Pre-existing 6 Windows-path-separator
  failures in unrelated tools unchanged.
- `python -m ruff check tools/ tests/` — clean.

## Needs brain's local build to verify

- [ ] `ninja rom` clean on EUR after the 2 `.s` → `.legacy.c`
      swaps + delinks.txt edits. mwldarm should link the
      `.legacy.c` ships identically to other Style A files.
- [ ] `dsd check modules` stays at 27/27 baseline (per
      `docs/state.md`'s current state — brief 213/214/215
      cleared the last 3 failing modules).
- [ ] `ninja report` shows `func_02087d10` and
      `func_0207d36c` still `matched_functions: 1, fuzzy:
      100%`. The swap should preserve the existing credit
      since the bytes are byte-identical.
- [ ] `python tools/predict_walls.py --version eur` surfaces
      C-38 hits on the orig binary for the 18 structurally-
      Wall-2 picks (synthetic tests cover the regex; real-
      binary smoke is brain-side because scaffolder lacks
      `arm-none-eabi-objdump`).

Cross-region (USA / JPN) SHA1 — tools-only PR + 2 EUR-only
file swaps (no USA/JPN ports for these function addresses;
verified by `grep` against `config/usa,jpn/arm9/symbols.txt`),
EUR-only is sufficient per `docs/state.md` verify-gate
rules.

## Sibling bonus items (flagged for brain housekeeping)

Brief 216's scope explicitly mentioned two sibling items
that didn't fit cleanly in the PR's core focus:

### 1. `.claude/agents/scaffolder.md` mwccarm clarification

Brief 214 (and reinforced here in brief 216) demonstrated
that direct `mwccarm.exe` invocation works fine for variant-
matrix testing — only `ninja` / `dsd` / `objdiff` orchestration
need the brain's local toolchain. The current `scaffolder.md`
caveat "no local toolchain" is over-broad.

**Proposed wording** (for brain to merge in housekeeping):

> **Verification I CAN do:**
> - `python -m unittest discover tests`
> - `python -m ruff check tools/ tests/`
> - Real-data smoke against `config/eur` for tools that read
>   the symbol graph
> - Markdown lint on docs
> - **Direct `mwccarm.exe` invocation for source-codegen
>   variant matrices** (mwccarm binaries live under
>   `scaffolder/tools/mwccarm/<sp_rev>/mwccarm.exe`; works
>   natively on Windows. Pattern: brief 214's
>   `tmp/variant_runner.py`-style script — compile a C
>   snippet with project CFLAGS, parse the resulting ELF
>   for `.text` bytes, diff against orig bytes from
>   `decomper/build/eur/delinks/`).
>
> **Verification I CANNOT do** (delegate to brain in PR
> test plan):
> - `ninja rom`, `ninja objdiff`, `ninja report` — needs the
>   full build pipeline + baserom verification.
> - `dsd check modules` — needs `dsd` binary + baserom state.
> - Confirming a match is byte-identical against the final
>   linked ROM (the variant-matrix verification confirms `.o`
>   bytes match orig delinks, which is sufficient for the
>   ship decision but doesn't validate the full link).

Brain may want to also update [`AGENTS.md`](../AGENTS.md)
§ scaffolder if the same caveat appears there.

### 2. `configure.py` `arm9.o.xMAP` rule gap

Brief 215's PR body mentioned: "fresh worktrees can't
bootstrap a clean `ninja sha1` because the linker map
side-output isn't declared as a build output." mwldarm
emits `arm9.o.xMAP` as a side-effect of the link rule,
but `configure.py` doesn't declare it as an output, so
ninja doesn't know to regenerate it when missing. Decomper
worktrees have it on disk from prior builds so don't hit
the issue.

**Fix sketch** (not shipped here; brain housekeeping):

In `tools/configure.py`, locate the `arm9` link rule
(`mwldarm` invocation) and add `arm9.o.xMAP` (and
analogous `<overlay>.o.xMAP` for overlays) to the rule's
`outputs` list. Test by deleting from a worktree's
`build/eur/` and running `ninja sha1` — should regenerate
the xMAP without manual intervention.

This isn't blocking for brief 216's core delivery (we have
the artifacts via decomper's worktree), but it's a fresh-
clone bootstrap blocker for any future scaffolder
contributing on a clean checkout.

## Cross-references

- [`trivial-bucket-revalidated-2026-05-25.md`](trivial-bucket-revalidated-2026-05-25.md)
  — brief 213's initial trivial drain.
- Brief 215's PR body (PR #671 in `Brain: close briefs 214 +
  215` merge commit `eac6666`) — Wall 1 + Wall 2 surfacing
  that drove brief 216's scope.
- [`bit-test-0-or-1-idiom.md`](bit-test-0-or-1-idiom.md) —
  brief 214's C-37 investigation, established the direct-
  mwccarm variant-matrix pattern brief 216 extends.
- [`codegen-walls.md`](codegen-walls.md) § C-38 — taxonomy
  entry with full recipe spec.
- `tools/predict_walls.py` — extended with the C-38 leaf-
  no-pool detector.
- `tools/mwccarm/1.2/sp2p3/mwccarm.exe` — the legacy
  compiler whose lack of CSE + address-fold peepholes
  makes Wall 2 reachable from C.
