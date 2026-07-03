[//]: # (markdownlint-disable MD013 MD041)

# Imported sm64ds-decomp levers — UNVERIFIED-ON-2.0

**Status:** build-free research, 2026-07-03. Mined from
[`bmanus2-dotcom/sm64ds-decomp`](https://github.com/bmanus2-dotcom/sm64ds-decomp)
(active project, **68.8% matched** / 66.9%→70%-goal per its own runbook at fetch
time, 4,400+ byte-exact pairs), specifically `notes/mwccarm-codegen.md` (493
lines), `notes/research-matching-levers.md` (a deep-research tooling/pipeline
report, 125 lines), `notes/pret-idioms.md` (66 lines, mined from
`pret/pokeplatinum` + `pret/pokediamond`), and `notes/crack-loop-runbook.md`
(249 lines).

## Read this first — every entry below is a hypothesis, not a fact

sm64ds-decomp compiles with **mwccarm 1.2/sp2p3** (plus a `1.2/sp3` legacy tier
of their own — not to be confused with our `1.2/sp2p3`/`1.2/sp3` legacy tiers,
which are a *different* pair of SP revisions serving a *different* routing
purpose; see `CLAUDE.md`'s toolchain table). **We compile with mwccarm
2.0/sp1p5** (decomp.me id `mwcc_30_131`). These are different compiler
releases with a major version gap. Two concrete, confirmed divergences beyond
the headline version gap:

- Their flags include `-lang c99` explicitly. Our `CC_FLAGS`
  (`tools/configure.py`) has no `-lang c99`/`c89` token in the shared flags —
  language mode is set per-TU as bare `-lang=c` or `-lang=c++` (see
  `configure.py` line ~1125-1129). If a lever's mechanism depends on C99 vs
  C89/ANSI semantics (e.g. mid-block declarations), it may behave differently
  for us by default.
- Their flags have no explicit `-str noreuse`; ours does. Our flags also set
  `-Cpp_exceptions off -RTTI off` explicitly (present because our `.cpp`
  per-file C++ opt-in — see `CLAUDE.md` — is already a live, exercised path,
  not theoretical).
- Full comparison — ours (`tools/configure.py` `CC_FLAGS`): `-O4,p -enum int
  -char signed -str noreuse -proc arm946e -gccext,on -fp soft -inline noauto
  -Cpp_exceptions off -RTTI off -interworking -w off -sym on -gccinc -nolink
  -msgstyle gcc`. Theirs (per `mwccarm-codegen.md` §1): `-O4,p -enum int -lang
  c99 -char signed -interworking -proc arm946e -gccext,on -msgstyle gcc`.

**Every lever in this document is tagged `UNVERIFIED-ON-2.0`.** None of it may
be cited as fact, used to justify a match, or copied into
[`contained-reshape-catalog.md`](contained-reshape-catalog.md) or
[`../recipe-gotchas.md`](../recipe-gotchas.md) until a build-capable agent runs
its verification protocol on our actual toolchain and the predicted asm shape
is confirmed. This document does not touch `src/`, `config/`, or `tools/` —
it is a work queue for a *future* build-capable session.

### How to graduate a lever out of this file

1. Run the protocol (decomp.me with compiler `mwcc_30_131`, our flag string
   above, is the fastest loop — no repo build-graph changes needed; see
   `CLAUDE.md`'s "Scratches" note for the equivalent local `ninja
   build/…/*.ctx.c` path).
2. If the predicted asm shape appears: port the lever into
   `contained-reshape-catalog.md` (if it's a reshape recipe) or
   `../recipe-gotchas.md` (if it's a register/CSE-timing gotcha) **with a real
   worked example** from our own matched corpus, per those files' own
   contribution guidelines — do not just delete the entry here and assume
   it's "known" without a real anchor.
3. If it does not reproduce, or reproduces a *different* shape than predicted:
   update this entry with the actual finding (still valuable — it prunes the
   search space) and move it to a "falsified on 2.0" section rather than
   deleting it outright.
4. Either way, cross out or annotate the entry so the next reader doesn't
   re-spend the 5 minutes.

## Counts

| Category | Count |
|---|---:|
| KNOWN-to-us (convergent with our existing catalog — no action needed) | 17 |
| NEW (not in our catalog; needs verification before use) | 25 |
| CONTRADICTS-ours (conflicts with a documented finding; needs urgent verification) | 2 |
| **Total sm64ds findings triaged** | **44** |

---

## Tier 1 — highest value, verify these first

### SM-1. Access-EXPRESSION (deref vs index) changes r0/r1 register ordering — **NEW**

**Their claim** (`mwccarm-codegen.md` §2, the chapter's own "KEY LEVER"):
`*(T*)G |= mask` (cast-and-dereference) and `G[0] |= mask` (array-index) are
semantically identical C but allocate registers *differently*. On their
`global_field_bitop` family, the deref form reproduced ROM's r0/r1 ordering;
the index form swapped r0 and r1. This is now their template default for any
single-global read-modify-write.

**Why it's new to us:** our closest lever, `recipe-gotchas.md` gotcha 19
(commutative-operand order), controls which of *two* pool-loaded globals is
the left operand of a binary op. This is a different axis: the *notation*
used to access a *single* global (pointer-cast-deref vs subscript) allegedly
changing allocation on its own.

**5-minute protocol:**

```c
/* variant A — cast + deref */
extern int g_flags_a;
void test_a(void) {
    *(unsigned int *)&g_flags_a |= 0x40;
}

/* variant B — index (decl as a 1-elem array so the syntax is legal) */
extern unsigned int g_flags_b[1];
void test_b(void) {
    g_flags_b[0] |= 0x40;
}
```

Compile both on decomp.me (`mwcc_30_131`, our flag string above). **Expected
if the lever holds:** the pool-load + `ldr`/`orr`/`str` sequence uses a
different low register for the loaded value between A and B (e.g. A puts the
loaded value in r0 and the pool base stays in r1; B swaps them), even though
instruction *count* is identical. **Expected if it doesn't reproduce:**
byte-identical output for A and B — mwcc 2.0's allocator doesn't
distinguish the two notations.

**Known-function follow-up:** `recipe-gotchas.md` gotcha 19's worked example,
[`func_ov006_021b4d68`](../../../../brain/src/overlay006/func_ov006_021b4d68.c),
is a real matched accessor of this general shape (commutative op over a
pool-loaded global) — if the synthetic test confirms the lever, that
function's *sibling family* (not the function itself — don't touch a matched
file) is the place to check whether any still-unmatched relative differs by
exactly a deref/index swap.

---

### SM-2. u64-mask laundering for base-address materialization — **CONTRADICTS our P-14 wall**

**Their claim** (`mwccarm-codegen.md` §6g, "RETIREMENT LIFTED"): the idiom

```c
*(int *)(((int)base + 0xOFF) & 0xFFFFFFFFFFFFFFFFULL) |= x;
```

(routing the computed address through a 64-bit bitwise-AND identity
operation) forces mwcc to materialize `add rA, base, #off` followed by a
zero-offset `[rA]` access, instead of folding the offset into the addressing
mode. Confirmed by sm64ds on 3 corpus files and 2 freshly-retired drafts
(`func_ov072_0211f9c4`, `Player::St_Squish_Init`) — genuine byte-exact
matches on **their** compiler. Variant: if the AND splits into `mov+adds`
instead of a single `add`, wrap the *completed* 32-bit address instead:
`((long long)(int)(base + OFF)) & 0xFFFFFFFFFFFFFFFFLL`.

**Why this contradicts us:** [`codegen-walls.md`](../codegen-walls.md)'s
**P-14** ("sub-struct base-offset fold, in-range") is the exact same
phenomenon — mwcc CSEs the outer base and folds a compile-time-constant
offset into a single `[self, #combined]` access instead of emitting the
orig's `add r4, self, #K` + `[r4, #inner_off]` split. We ran a 6-idiom
matrix against `func_02032724` (nested access, pointer alias, `(char*)self +
K` cast, helper-takes-`&inner`, `volatile int *`, cast-back-through-`char*`)
and **none reproduced the split** — logged as "no C idiom forces the
in-range split," locked permanent. The u64-mask laundering idiom was **not**
among the 6 tested forms. If it works on 2.0/sp1p5, P-14 is not actually
permanent — it just needed a 7th idiom we hadn't tried.

**5-minute protocol:**

```c
/* baseline: known-folded shape (predicts single [r,#combined] access) */
struct Outer { char pad[0x1fc]; struct Inner { char pad2[0xc80]; int field; } inner; };
void baseline(struct Outer *self) {
    self->inner.field = 0;
}

/* laundered: predicts split add+deref if the lever holds */
void laundered(struct Outer *self) {
    *(int *)(((int)self + 0x1fc + 0xc80) & 0xFFFFFFFFFFFFFFFFULL) = 0;
}
```

Compile both on decomp.me (`mwcc_30_131`). **Expected if the lever holds:**
`baseline` folds to one `str r0, [r?, #0xe7c]`-style instruction (our
existing P-14 finding); `laundered` emits a materialized `add r?, r0, #0xe7c`
(or equivalent split) followed by a zero-offset `str`. **Expected if it
doesn't reproduce:** both fold identically — the laundering idiom is a
1.2-specific optimizer quirk that doesn't exist on 2.0.

**Known-function follow-up:** [`func_02032724`](../../../../brain/src/main/func_02032724.s)
is the exact P-14 worked example (`../codegen-walls.md` lines 6957-7052) —
confirmed still unmatched as of 2026-07-03 (it's a bare `.s`, consistently
across every worktree checked; symbol table entry: `func_02032724
kind:function(arm,size=0x24) addr:0x02032724` in
`config/eur/arm9/symbols.txt` line 1087). Re-attempt it directly with the
laundered form once the synthetic test confirms the mechanism — re-check
`git log`/symbols.txt first in case it landed between this writing and
whenever the protocol is actually run. If already matched by another route,
use the next P-14-census entry in `codegen-walls.md` instead. **This is the
single highest-value re-test in this whole import** — P-14 is a
locked-permanent wall class with a nonzero population; lifting it recovers
real matches, not just a documentation update.

---

### SM-3. `#pragma opt_strength_reduction off` — **CONTRADICTS our memory's strength-reduction finding**

**Their claim** (`mwccarm-codegen.md` §6f + §6e, `crack-loop-runbook.md`):
across a 20-pragma × 96-near-miss sweep (1,920 compiles), all but two pragmas
were confirmed **inert** (silently accepted, zero effect — see the
methodology caution below). `#pragma opt_strength_reduction off` was one of
the two live ones: it keeps pointer-induction loops un-reduced (i.e. blocks
mwcc from rewriting `arr[i]`-style indexing into pointer-increment form),
validated on `func_ov034_02112020`.

**Why this contradicts us:** our own persistent lever notes (the
`mwcc-register-reuse-recipe` memory, not yet in this repo) state plainly:
*"addressing/loop-lowering: `(o+i)[K]` vs `o[i+K]` only matters for word
arrays; strength-reduction is NOT blockable from C (tried multiple forms,
none work)."* That conclusion was reached by testing **source-level** forms
only. A `#pragma` is a different lever category entirely — nothing in our
prior testing rules it out.

**Methodology caution (from their own sweep):** an unrecognized pragma name
compiles cleanly with **zero** effect on mwcc 1.2 (confirmed: `#pragma
scheduling off` / `#pragma peephole off` are silently accepted no-ops per
`crack-loop-runbook.md`'s "Pragmas tested, dead end" section). **"Compiles
without error" is not evidence the pragma did anything** — only a disassembly
shape change counts. Budget the 5 minutes for an A/B disassembly diff, not
just a successful compile.

**5-minute protocol:**

```c
/* baseline — predicts mwcc strength-reduces to pointer-increment form */
int sum_baseline(int *arr, int n) {
    int i, total = 0;
    for (i = 0; i < n; i++) {
        total += arr[i] * 3;
    }
    return total;
}

/* pragma'd — predicts array-indexing form survives if the lever holds */
#pragma opt_strength_reduction off
int sum_pragma(int *arr, int n) {
    int i, total = 0;
    for (i = 0; i < n; i++) {
        total += arr[i] * 3;
    }
    return total;
}
#pragma opt_strength_reduction reset
```

Compile on decomp.me (`mwcc_30_131`). **Expected if the lever holds:**
`sum_baseline` shows a pointer `add rN, rN, #4` walking the array; `sum_pragma`
shows repeated `ldr rX, [arr, i, lsl #2]`-style scaled-index addressing
instead — a real instruction-shape difference. **Expected if it doesn't
reproduce:** both functions emit byte-identical loop bodies — flag `#pragma
opt_strength_reduction` as inert on 2.0/sp1p5 and update this entry.

**Known-function follow-up:** none named yet on our side — our memory's
finding doesn't cite a specific parked address. If the synthetic test
confirms the pragma works, grep `nearmiss/` (if mirrored here) or
`codegen-walls.md` for any wall entry whose diagnosis mentions
"strength-reduc" and retry it with the pragma before concluding it's still
permanent.

---

### SM-4. Real C++ virtual dispatch reproduces pre-indexed writeback — **NEW, "the single biggest unlock" per source**

**Their claim** (`mwccarm-codegen.md` §5): a source file starting with the
literal comment `//cpp` compiles under `-lang c++` while keeping `extern "C"`
linkage (unmangled symbol, so it's a drop-in replacement for a C-declared
function). This unlocks C++-only codegen shapes no C form under any flag
combination reproduces — chiefly, virtual-call pre-indexed writeback:
`ldr rV, [r0, #OFF]!`. **Critical, dated finding (2026-07-02):** a C
emulation of a vtable call (`(*(fn**)(*(int*)obj+0x48))(obj,3)`) always
*hoists* the vtable load off the object register; only a real C++ virtual
call through a pointer with dummy virtuals ahead of the target
(`((Obj*)c)->m48(3)`) produces the `mov r0,r4; ldr r2,[r0]` this-temp shape
mwcc emits for genuine virtual dispatch.

**Why it's new to us:** neither `contained-reshape-catalog.md` nor
`recipe-gotchas.md` mentions vtables, virtual dispatch, or a C++-for-codegen
trick anywhere. We already have the mechanism, unused for this purpose: per
`CLAUDE.md`, "`Opt into C++ per-file by naming the file .cpp`", and
`tools/configure.py`'s `CC_FLAGS` already carries `-Cpp_exceptions off -RTTI
off` — meaning our `.cpp` path is live and already exercised by the build,
not a theoretical add. This is a cheap, high-leverage test.

**5-minute protocol** (`.cpp` file, `extern "C"` to keep the symbol
unmangled):

```cpp
//cpp
struct Base {
    virtual void dummy0();
    virtual void dummy1();
    virtual void target(int x);
};

extern "C" void test_virtual_call(Base *obj, int x) {
    obj->target(x);
}
```

vs. the plain-C emulation attempt:

```c
typedef void (*fn_t)(void *, int);
void test_c_emulation(void *obj, int x) {
    fn_t f = *(fn_t *)(*(int *)obj + 8);   /* target is vtable slot 2 */
    f(obj, x);
}
```

Compile both (the first as `.cpp` with `-lang=c++`, matching our per-file
convention) on decomp.me (`mwcc_30_131`). **Expected if the lever holds:**
`test_virtual_call` emits a pre-indexed or this-temp-first load
(`mov r?,r0` then `ldr r?,[r?]` immediately, vtable slot resolved via a
clean offset) while `test_c_emulation` hoists the `*(int*)obj` deref earlier
relative to argument setup — a visibly different instruction order.
**Expected if it doesn't reproduce:** identical shapes — mwcc 2.0 doesn't
generate a distinguishable virtual-call pattern, or our object layout/ABI
differs enough that the comparison doesn't transfer.

**Known-function follow-up:** we don't have a confirmed vtable-shaped
candidate on our side yet. Our own memory catalogs an "ov006 8-state machine"
with "per-state method-family layout" (`ov006-state-machine.md`) — plausible
OOP-shaped territory worth a look *after* the synthetic test confirms the
mechanism, not before (don't go hunting for a vtable in game code until we
know mwcc 2.0 even produces the tell). Same `//cpp` mechanism also unlocks
PMF (pointer-to-member-function) call shapes — see SM-10 below — worth
testing in the same session since it's the same file/flag setup.

---

### SM-5. `#pragma optimize_for_size on` cracks early-exit epilogue duplication — **NEW**

**Their claim** (`mwccarm-codegen.md` §6d/§6f): `-O4,p` duplicates a short
conditional epilogue at an early-exit point where the ROM has a plain `beq`
to a shared tail. Ten different C phrasings failed to suppress the
duplication on `func_0206ce20`; `#pragma optimize_for_size on` fixed it. This
is the OTHER of the two pragmas confirmed live in their 20-pragma sweep (see
SM-3's methodology caution — same "compiles clean but may be a no-op"
concern applies here).

**Why it's new to us:** we have no pragma-based levers anywhere in our
catalog. This is also a good general precedent: when 10 source rewrites all
fail identically, the next move is a pragma sweep, not an 11th rewrite —
worth adopting as a standing tactic (see campaign priors below).

**5-minute protocol:**

```c
extern int helper_a(void);
extern int helper_b(int);

/* baseline — predicts duplicated short epilogue at the early exit */
int test_baseline(int cond) {
    if (cond) {
        return helper_a();
    }
    return helper_b(cond);
}

/* pragma'd — predicts a single shared-tail branch if the lever holds */
#pragma optimize_for_size on
int test_pragma(int cond) {
    if (cond) {
        return helper_a();
    }
    return helper_b(cond);
}
#pragma optimize_for_size reset
```

This minimal shape may not be enough to trigger `-O4,p`'s duplication
heuristic on its own (their real case was a specific epilogue-restore
sequence) — if `test_baseline` doesn't show duplication, thicken the
function body (add 2-3 more locals with a callee-saved push) before
concluding the pragma has nothing to react to. **Expected if the lever
holds:** `test_baseline`'s early-return path repeats part of the epilogue
inline (e.g. a duplicated `pop`-equivalent sequence) while `test_pragma`'s
early-return is a plain branch to one shared epilogue. **Expected if it
doesn't reproduce:** identical shapes, or `-O4,p` never duplicates the
epilogue for this function size on 2.0 in the first place (in which case the
pragma is untested, not refuted — note that distinction).

**Known-function follow-up:** none named on our side; this is a search
pattern to keep in mind (a build that's a few bytes longer than orig at an
early-return point, where the extra bytes look like a second copy of the
tail) rather than a specific address.

---

## Tier 2 — solid candidates, concise protocols

### SM-6. Pool-loaded literal/address hoisted above first use under `-O4,p` — **NEW**

**Claim** (`mwccarm-codegen.md` §1): pool loads (constants, addresses) are
hoisted to appear *before* their first use in the instruction stream, even
when the use is deep inside a conditional branch — distinct from our own
observed *lazy* scheduling of a **stack-passed argument** load (Recipe 6 in
`contained-reshape-catalog.md`: "`d`'s `ldr` is scheduled lazily, right
before the store that consumes it"). These aren't contradictory — pool loads
(literal/address materialization) and stack-argument loads (register
population) may simply be scheduled by different mwcc heuristics.

**Protocol:** compile a function where a pool-loaded global's *only* use is
inside a rarely-taken `if` branch late in the function body. **Expected if
the lever holds:** the `ldr r?, [pc, #N]` pool load appears at the top of the
function (before the branch condition), not immediately before the branch
body. **Expected if it doesn't reproduce:** the pool load appears inline,
right before its use, same as our stack-arg finding.

```c
extern int g_rare;
int test_hoist(int cond, int a, int b) {
    int r = a + b;
    if (cond == 0x1234) {
        r += g_rare;
    }
    return r;
}
```

---

### SM-7. Adjacent-word struct copy batches as load-load-store-store — **NEW**

**Claim** (`mwccarm-codegen.md` §3): two adjacent words copied field-by-field
should be written as a single struct assignment (`*(P2*)dst = *(P2*)src;`),
**not** two scalar assignments (`dst->f0=src->f0; dst->f4=src->f4;`) — mwcc
lowers the struct form as load-load-then-store-store (batched), which is
distinct from our Recipe 6 (independent field stores follow *source
statement order*, no reordering). Recipe 6 is about *unrelated* fields in
statement order; this is about what happens when the two fields are an
adjacent, copyable pair.

**Protocol:**

```c
typedef struct { int a, b; } Pair;
void copy_scalar(Pair *dst, Pair *src) { dst->a = src->a; dst->b = src->b; }
void copy_struct(Pair *dst, Pair *src) { *dst = *src; }
```

**Expected if the lever holds:** `copy_scalar` emits `ldr;str;ldr;str`
(interleaved); `copy_struct` emits `ldr;ldr;str;str` (batched) or an `ldm/stm`
pair. **Expected if it doesn't reproduce:** identical output for both forms
(mwcc already recognizes the scalar pair as a struct copy and batches it
regardless).

---

### SM-8. `volatile`-qualified array survives scalar replacement — **NEW extension of gotcha 17**

**Claim** (`mwccarm-codegen.md` §6e, Fable-discovered): a plain local array
can be scalar-replaced (SROA'd into individual register/stack values,
losing its "array-ness" in the emitted code); `volatile` on the array
retains real indexed stack slots. This extends our known gotcha 17
(`volatile` prevents dead-store elision / load-after-store CSE) to a
**different optimization** — scalar replacement of aggregates — which
gotcha 17's writeup doesn't cover.

**Protocol:**

```c
void test_plain(int *out) {
    int tmp[4] = {1, 2, 3, 4};
    int i;
    for (i = 0; i < 4; i++) out[i] = tmp[i] * 2;
}
void test_volatile(int *out) {
    volatile int tmp[4] = {1, 2, 3, 4};
    int i;
    for (i = 0; i < 4; i++) out[i] = tmp[i] * 2;
}
```

**Expected if the lever holds:** `test_plain` never materializes `tmp` on
the stack (constants propagate directly into the multiply); `test_volatile`
allocates a real 4-word stack slot and issues genuine indexed loads.
**Expected if it doesn't reproduce:** both allocate the array (mwcc 2.0
doesn't SROA local arrays as aggressively as 1.2 in this case), making the
qualifier moot for this specific shape.

---

### SM-9. Bitfield-shift extraction needs an `unsigned` pointer type for `lsr` — **NEW (high confidence, low risk)**

**Claim** (`mwccarm-codegen.md` §3): `*(unsigned *)p >> sh & mask` emits
`lsr` (logical shift); the same expression through a **signed** pointer
type emits `asr` (arithmetic shift) and won't byte-match an `lsr` original.
This is standard C signed/unsigned right-shift semantics (implementation-
defined for signed, but ARM/mwcc's choice is consistently arithmetic) —
**likely portable across mwcc versions since it follows the language
standard rather than a 1.2-specific optimizer quirk**, but still flagged
per the blanket policy.

**Protocol:**

```c
int extract_signed(int *p, int sh, int mask) { return (*p >> sh) & mask; }
int extract_unsigned(unsigned *p, int sh, int mask) { return (*(unsigned*)p >> sh) & mask; }
```

**Expected:** `extract_signed` emits `asr`; `extract_unsigned` emits `lsr`.
Given the C-standard grounding, treat a mismatch here (both emitting the
same shift) as more surprising than a match — worth double-checking flags
if it fails.

---

### SM-10. PMF (pointer-to-member-function) ABI shape + argument-liveness coloring — **NEW**

**Claim** (`mwccarm-codegen.md` §5, §6e): `PMF* p = c->pp[+N/8]; (c->**p)();`
with `typedef void (C::*PMF)();` produces a fixed prologue: `ldr r3,[r0,#OFF];
ldr r1,[r3,#4]; add r0,r0,r1,asr#1; ands r1,r1,#1; ldrne...; blx`. A separate
lever: declaring the PMF **with its int parameter** and forwarding that
index keeps it live through the `blx`, pinning coloring (proven 7x by an
external contributor per their notes; zero-arg PMF variants remain an
unreached floor). Both require the `//cpp` mechanism from SM-4.

**Why it's worth testing:** our own memory documents an "ov006 state
machine" with "8-state machine's struct addresses + per-state method-family
layout" — exactly the shape a PMF-table dispatch (`(c->*TABLE[idx].pmf[k])()`)
would produce in original C++ source, if any of our game's state-machine
dispatch is actually PMF-shaped rather than plain function-pointer-shaped.
Worth a look *after* confirming the ABI shape synthetically.

**Protocol:** same file/flags as SM-4.

```cpp
//cpp
struct Actor {
    void StateA(int arg);
    void StateB(int arg);
    typedef void (Actor::*StateFn)(int);
};

extern "C" void dispatch(Actor *a, Actor::StateFn fn, int arg) {
    (a->*fn)(arg);
}
```

**Expected if the lever holds:** the described `ldr;ldr;add,asr#1;ands;
ldrne;blx` shape appears verbatim. **Expected if it doesn't reproduce:** a
simpler/different indirect-call sequence — note the actual shape mwcc 2.0
produces either way, since it's useful even if it diverges from 1.2's.

---

### SM-11. Deleting-destructor / `new T()` shape — **NEW (bundle with SM-4/SM-10, lower individual priority)**

**Claim** (`mwccarm-codegen.md` §5): compiler-generated deleting destructors
install the vtable with the pool-load **hoisted above** `mov r4, r0` (don't
pin position when trying to match this), call `D1(this)`, then a **2-arg**
`Deallocate(this, HEAP)`. `new T()` shape: `p = NEW(sz); if (p) { CTOR(p+off)
…; p[voff] = &VT…; } return p;`. Only relevant if our game allocates C++
objects via `new`/has real destructors — bundle this test with SM-4/SM-10
rather than running it standalone; lower priority until SM-4 confirms the
C++ path is worth investing in further.

---

### SM-12. Predicated-select "override" form vs ternary — **NEW third code shape**

**Claim** (`mwccarm-codegen.md` §6c): `int x = A; if (!cond) x = B;`
(assign-then-conditionally-override) produces a single predicated `mov`
(`mov r,#A` then `movne r,#B`-style), distinct from a full ternary's
if-true/if-false pair (our gotcha 3) and distinct from the bitmask form for
small-set membership (our gotcha 24). Nested if-else chains of consecutive
`==` comparisons range-merge into `movls`-style range checks — this part
extends gotcha 24 rather than being wholly new.

**Protocol:**

```c
int select_ternary(int cond) { return cond ? 2 : 0; }          /* gotcha 3 shape */
int select_override(int cond) { int x = 0; if (cond) x = 2; return x; }
```

**Expected if the lever holds:** `select_ternary` and `select_override`
produce *different* instruction sequences (not just operand-order-swapped —
genuinely different shapes, e.g. ternary's `cmp;movne;moveq` pair vs
override's `mov #0` then conditional `movne #2` with no `moveq`).
**Expected if it doesn't reproduce:** mwcc 2.0 canonicalizes both to the
same output — the override form isn't a distinct lever on our compiler.

---

### SM-13. Arg-builder temp declaration order sets CALL-argument registers — **NEW extension of gotcha 11**

**Claim** (`mwccarm-codegen.md` §6c): our gotcha 11 already establishes that
declaration order picks *callee-saved* (r4/r5/r6) register assignment for
long-lived locals. sm64ds's finding extends the same mechanism to
*caller-saved* argument-builder temps: when several named temps are built up
before a call (e.g. `pos.x/pos.y/pos.z` before `Actor_Spawn(x,y,z)`),
**declaration order** — not the call's parameter order — decides which temp
lands in r0 vs r1 vs r2. Their example: declaring position temps in
`z,y,x` order produced `x=r0,y=r1,z=r2` (i.e., mis-assigned relative to
natural intuition) because declaration order won, not call-site argument
order.

**Protocol:**

```c
extern void spawn(int x, int y, int z);

void test_decl_order(int a, int b, int c) {
    int z = c, y = b, x = a;   /* declared z,y,x */
    spawn(x, y, z);             /* called x,y,z */
}
```

**Expected if the lever holds:** the value-to-register assignment tracks
declaration order (z first → some fixed low register regardless of its
position in the `spawn()` call), producing extra `mov` shuffles to get
values into r0/r1/r2 in call order. **Expected if it doesn't reproduce:**
mwcc 2.0 assigns directly by call-site position, no declaration-order
effect, and the extra `mov`s don't appear.

---

### SM-14. `register`-qualified locals (including arrays) bias allocation — **NEW**

**Claim** (`pret-idioms.md` #5): `register u32 chunk_starts[3];` biases mwcc
toward keeping a value resident in a register across a region it would
otherwise spill. We've never used the `register` keyword anywhere in our
catalog.

**Protocol:** take any near-miss where a value spills to the stack mid-loop
that the orig keeps resident, add `register` to its declaration, recompile,
diff. No synthetic snippet will reliably demonstrate a *spill* in isolation
(spilling is a pressure phenomenon, not something a 3-line test reliably
triggers) — this one genuinely needs a real register-pressure near-miss as
the test subject rather than a clean synthetic. Flag as NEW but note the
protocol itself requires hunting a real candidate first (10 minutes, not 5).

---

### SM-15. `volatile` in a condition defeats CSE per branch arm — **NEW extension of gotcha 17**

**Claim** (`mwccarm-codegen.md` §6g): a `volatile` read used directly inside
a branch condition prevents mwcc from CSE-ing that read across the two arms
of the branch (each arm re-reads). Extends gotcha 17's "volatile preserves
re-read" mechanism from *field re-reads* to *branch-condition CSE*
specifically.

**Protocol:**

```c
extern volatile int g_status;
int test_cse(void) {
    if (g_status) {
        return g_status + 1;   /* does mwcc re-read g_status, or reuse the branch test's value? */
    }
    return 0;
}
```

**Expected if the lever holds:** two separate `ldr` of `g_status` (branch
test + the `+1` use). **Expected if it doesn't reproduce:** mwcc reuses a
single load's register value for both, even with `volatile` — meaning
`volatile` alone isn't sufficient for this specific case on 2.0.

---

## Tier 3 — narrower / deeper levers (compact protocols)

All still `UNVERIFIED-ON-2.0`. These are lower-priority (narrow applicability,
or SDK/game-content-derived rather than pure-compiler, or from the Fable
"floor mop-up" tier where the win rate was already low even on 1.2).

| # | Lever | Source | One-line test | Expected signal |
|---|---|---|---|---|
| SM-16 | Fix12 fixed-point multiply idiom: `(int)(((long long)a*b+0x800)>>12)` | `mwccarm-codegen.md` §6 | Compile the idiom, check for a `smull`/shift-right-12 sequence | SDK-derived, likely portable — low risk, medium value if our game uses Fix12 math (check `src/` for existing fixed-point helpers first) |
| SM-17 | Angle→sin/cos table index: `(unsigned short)(short)(angle+0x8000)>>4` indexing `tbl[i*2]`/`tbl[i*2+1]` | `mwccarm-codegen.md` §6 | Grep our own `src/`/`libs/` for an existing trig-table accessor before testing — may already be present under a different name | NitroSDK-standard; if we already have this idiom in matched code, this entry is moot (check first, verify second) |
| SM-18 | `__sinit_*` static initializers matchable via source-order integer constants (encodable immediates inline, non-encodable take pool word) | `mwccarm-codegen.md` §6 | Compile two static-init structs, one with all-encodable immediates and one with a mixed set, compare pool usage | Order of pool words should track source order if the lever holds |
| SM-19 | Boolean-materialization suffix sensitivity: `t!=false` vs `t==true` change which `cmp`/branch form emits (both should still beat the fully-materialized 6-instr form) | `mwccarm-codegen.md` §6c | Compile `if(t!=0)`, `if(t!=false)`, `if(t==true)` variants of the same guard | All three should fold to the same ~4-instr `cmp/bne`; if one doesn't, that's the new information |
| SM-20 | Fake data-dependency forces load/store batching order: `int a=p.a,b=p.b; dst_a=b?a:a; dst_b=b;` | `mwccarm-codegen.md` §6e (Fable) | Compare a plain two-field copy vs the same-value-ternary form | Ternary form should force both loads before both stores; plain form may interleave |
| SM-21 | Reassign-before-call blocks copy-propagation: `dh=(s16)(h-dh); f(&x,dh,...)` | `mwccarm-codegen.md` §6e (Fable) | Compare `f(&x, h-dh, ...)` (inline expr) vs the reassign form | Reassign form should force a materialized temp instead of folding the subtraction into the call-arg setup |
| SM-22 | Break out of **both** nested switches to reach a shared `else` epilogue | `mwccarm-codegen.md` §6e (Fable) | Nested `switch`/`switch` with a `break`-to-shared-tail vs early-return from the inner switch | Break form should produce one shared epilogue block; early-return duplicates it (extends our gotcha 23/24 switch family) |
| SM-23 | `enum` vs plain `u32`/`int` LOCAL type affects regalloc | `pret-idioms.md` #4 | Declare the same intermediate as `enum Foo` vs `unsigned int`, same logic otherwise | Low-confidence per source ("purposefully left as u32... causes fuckery" — no mechanism given); treat any observed difference as worth a closer look, not proof of a general rule |
| SM-24 | `void *` pointer arithmetic for materialization: `return (u32)((void *)f(x) + value);` | `pret-idioms.md` #10 | Test **after** SM-2 (u64 laundering) — this is adjacent to our already-*falsified* `(char*)self + K` cast idiom from the P-14 6-idiom matrix, so low expected yield | If it reproduces where the `char*` cast form didn't, the `void*` vs `char*` distinction itself becomes the interesting finding |
| SM-25 | mwcc inline `asm { }` function-body escape hatch, with syntax gotchas (`swi` not `svc`; `stmltia` not `stmlt`; bare label + trailing colon on own line; `strneh` not `strhne`; `ldr pc,[sp],#4` not `ldmia sp!,{pc}`) | `mwccarm-codegen.md` §8 | N/A — this is a syntax reference, not a behavior to falsify; relevant only if a candidate is a genuine hand-written-asm SDK primitive | Compare against our existing GLOBAL_ASM `.s`-file mechanism (see `permuter-lane-windows-blocked.md` memory) before using — we may already have an equivalent path; this is opportunistic, not urgent |
| SM-26 | Mutable-variable subtraction beats `rsb` const-fold: `int v=K; v-=x;` forces `mov+sub`, not `rsb rD,x,#K` | `mwccarm-codegen.md` §6g | Compile `return K - x;` vs `int v=K; v-=x; return v;` | `rsb` form vs `mov+sub` form should differ if the lever holds |
| SM-27 | Explicit constant call-arg colors a compare chain; volatile reads on different call args order relative to each other across a call boundary | `mwccarm-codegen.md` §6g | Narrow/deep — construct two `volatile` reads passed as args to the same call in different declared orders | Lowest priority in this table; only worth chasing if a real near-miss matches this exact shape |

---

## Known-to-us (convergent) — no re-verification needed

These sm64ds findings already match something in our own catalog. Listed for
completeness and as independent-discovery confidence signal (two unrelated
mwcc DS decomps converging on the same conclusion via different compiler
versions is stronger evidence than either alone).

| sm64ds finding | Source | Our equivalent |
|---|---|---|
| Declaration order picks callee-saved register | `pret-idioms.md` #1 | `recipe-gotchas.md` gotcha 11 (near-identical) |
| C89-style top-of-block declarations required to match | `pret-idioms.md` #2 | Implied by gotcha 17's C89 parenthetical + general practice; note our per-TU `-lang=c`/`c++` has no explicit c99/c89 flag (see compiler-caveat section above) so this may be a harder *requirement* for us, not just a matching nicety |
| Reuse a variable instead of introducing a new one | `pret-idioms.md` #3 | `mwcc-register-reuse-recipe` memory ("reuse a PARAM in place") + gotcha 7 family |
| Keep ternaries as ternaries, don't expand to if/else | `pret-idioms.md` #6 | Implicit throughout gotcha 3 |
| Loop form (`for` vs `while`/`do-while`) must match branch direction | `pret-idioms.md` #7 | `contained-reshape-catalog.md` Recipe 4 (more precise: "compare at the bottom" = `do-while`) |
| Keep computationally-dead lines the ROM still emits | `pret-idioms.md` #8 | Gotcha 17 (`volatile` mechanism — we have the *why*, they only had the *that*) |
| Switch-case order must match the ROM jump table (source order, not value order) | `pret-idioms.md` #9, `mwccarm-codegen.md` §6b | Gotcha 23 + `mwcc-register-reuse-recipe` memory ("switch BLOCK ORDER follows source case order") |
| Independent field stores emit in exact C statement order, never reordered | `mwccarm-codegen.md` §6b | `contained-reshape-catalog.md` Recipe 6 |
| "Write straightforward C, don't hand-schedule" | `mwccarm-codegen.md` §1 | Consistent with Recipe 6's closing lesson ("resist the instinct to clean up") |
| Repeated-global pool-word deduplication under `-O4` | `mwccarm-codegen.md` §3 | Directly visible in our own `codegen-walls.md` **P-11** worked example (`func_02024574`: "orig has 2 pool words (same value); built has 1 — mwcc 2.0 deduped the pool") |
| Function/symbol size determination should not be instruction-count-based | `mwccarm-codegen.md` §1 (scan for epilogue pattern, not negative index) | `mwcc-register-reuse-recipe` memory: "function SIZE for delinks comes from `symbols.txt`, not instruction-line count" — different mechanism, same underlying caution |
| Hardware/runtime-routed divmod for variable divisors (`cstd::div`/mod/fdiv) | `mwccarm-codegen.md` §6 | `mwcc-register-reuse-recipe` memory: `func_020b3870` renamed signed-divmod-runtime lever — same NitroSDK/ARM-runtime convention, independently named |
| Structure-first diagnosis: match codegen SHAPE, not just logic | `mwccarm-codegen.md` §6b (their dominant near-miss category) | The entire premise of `recipe-gotchas.md` and `contained-reshape-catalog.md` |
| Sibling-family/cluster draining beats random cohort picks; one representative teaches the whole family | `mwccarm-codegen.md` §6 (idiom-families closing note), `crack-loop-runbook.md` §"after every batch" | `recipe-gotchas.md`'s own opening section — near word-for-word the same lesson, independently discovered (94% vs 53-73% yield by homogeneity, brief 247) |
| The byte-oracle stays ground truth; understanding shrinks iteration count, never replaces the check | `crack-loop-runbook.md` throughout | How this whole campaign already works (`ninja sha1` / objdiff as the only gate that matters) |
| Register-pressure/reg-alloc choice is a genuine plateau resisting source-shape iteration once past addressing-expression-level tricks | `mwccarm-codegen.md` §2 (ip/r12 8.5% usage, pressure-driven not call-driven) | `codegen-walls.md` **P-11** (general reg-allocator plateau, "resists both permuter and source-shape iteration") + **P-15** (its legacy-tier sibling) — same wall, independently hit via a different compiler major version |
| Permuter's ceiling is regalloc-only; it cannot reliably resolve reorderings/structural gaps (confirmed by the tool's own upstream author) | `research-matching-levers.md` F4.1 | Our own `mwcc-register-reuse-recipe` memory's "what does NOT yield to reshaping" list (indirect dispatch, block-order, strength-reduction, cmov order — permuter-class) |

---

## Campaign priors (meta-findings, not individual levers)

Extracted mainly from `mwccarm-codegen.md` §2/§6b, `research-matching-levers.md`,
and `crack-loop-runbook.md`. These inform how we *work*, not what we *write*.

- **Structure-first diagnosis is the dominant near-miss category.** Their
  #1 finding: logic being correct is necessary but not sufficient — match
  control-flow shape (early-return vs predication, loop-entry-guard form,
  do/while vs for), call-arg spilling shape (spilled locals vs a struct —
  only use a struct if disasm shows an actual struct copy), and exact
  statement/store order. "On a FALSE, diff your candidate's shape against
  the disasm and fix the FIRST divergence... don't just reshuffle." This
  matches our own catalog's whole premise — good independent confirmation,
  not a new instruction.
- **ip/r12 usage is rare, pressure-driven, and not forceable from C.**
  Quantified: only ~8.5% of their matched functions use ip/r12, almost
  always short-lived scratch, essentially never live across a `bl`. Driver
  is register *pressure* (bigger function → low regs fill → spill to ip),
  not call count (ip-functions average ~0x66 bytes vs ~0x3c, similar call
  counts). The "right logic, wrong color" population is *small* — ~5
  regperm-only functions per module (arm9 ≤0x50) — coloring is the *last*
  thing to go wrong, not the main blocker. Matching an ip-using function is
  just natural, full C — a minimized stub under-expresses pressure and
  colors low instead. This is quantitative support for treating our own
  **P-11**/**P-15** plateau the same way: don't grind register-choice
  near-misses expecting a source-level lever: check whether the population
  is actually small before investing more tooling in it.
- **No external source — academic or tooling — documents a base-address-
  materialization recipe.** `research-matching-levers.md` F2.1: across the
  full decompilation literature survey (LLM4Decompile, Idioms, SK2Decompile,
  SC2Dec, DecLLM, MCGD), zero mentions of CodeWarrior, mwccarm, ARM register
  allocation, or base-address materialization. This means our own **P-14**
  work (6-idiom matrix, locked permanent) was not a case of missing a
  published answer — it's genuinely open territory. It also means sm64ds's
  own u64-laundering discovery (SM-2 above) was *empirical*, not mined from
  a paper — reinforcing that it's worth the 5-minute retest rather than
  dismissing it as "probably already considered."
  **Corollary — Wall #2 (register-pressure / callee-saved-set reproduction)
  is similarly unaddressed by any external source**, per the same survey's
  finding that no tool or paper documents a from-C lever for controlling
  the callee-saved set. This directly supports the same "stop grinding P-11/
  P-15, the population is genuinely small and this is unsolved everywhere"
  conclusion above — not a wall we're behind on relative to the field.
- **Don't calibrate expectations against functional-equivalence LLM
  benchmarks.** `research-matching-levers.md` F3.4: every academic
  decompilation-LLM number (LLM4Decompile 45.4%/18.0%, Idioms 54.4%, SC2Dec
  52.41%, MCGD 84-97%) measures *re-executability*, not byte-exact matching
  — not transferable to our standard. Worth remembering if anyone proposes
  a fine-tuned decompiler model or cites one of these rates as a target.
- **Model-allocation economics are directly relevant to us** (we have the
  same two models available). Their measured, dated findings: Sonnet 5 is
  parity with Opus 4.8 on matching at ~half cost. Fable 5 (`model:"fable"`,
  effort `high`) cracked 5/12 near-misses Sonnet had fully exhausted, at the
  *same* per-landed token cost as Sonnet on an easy fresh band — i.e. Fable
  isn't just "try harder," it reaches genuinely different levers (two new
  levers were *discovered* by Fable, not just executed by it). A **two-stage
  retry** pattern (bank Sonnet's hits first, *then* retry Sonnet's misses)
  recovered 4/9 at the same cost, because retry agents found freshly-banked
  sibling matches in `src/` and copied the idiom — retrying before banking
  would have re-proven "walls" that were actually just missing a template.
  Both of these are process levers, not codegen levers — worth considering
  for our own wave structure regardless of the sm64ds-specific numbers.
- **Refine (near-miss backlog) economics: only the head of the backlog
  pays.** Measured back-to-back, same model: the closest 16 near-misses
  converted at 31% (~107K tok/landed); the next 20, only slightly deeper,
  converted at 5% (~660K tok/landed) — the categorizer mislabels floor
  residuals as structural past the head. Run one refine batch on the
  closest drafts after fresh matches replenish the pool, then stop; don't
  grind depth. Conceptually the same lesson as our own containment-gated
  `safe-queue-v2`/`v3` ranking (prioritize the highest-signal head, don't
  re-grind cold candidates) — independent convergence again.
- **A byte-match can still be the wrong symbol ("WRONG-DEST salvage").**
  When two same-shaped globals both get zero-stored (or otherwise are
  interchangeable at the byte level), an agent can swap which symbol goes
  where and still pass the oracle — their link-verification gate catches
  this by reconstructing linked bytes, which the wildcarded-reloc byte
  oracle alone cannot see. Worth checking whether our own `ninja sha1`/
  objdiff pipeline has an equivalent link-level check, or whether this is a
  gap — the byte oracle alone provably cannot catch this class by design.
- **Tooling recommendations don't apply — we're already past them.**
  `research-matching-levers.md`'s top two recommendations are adopting
  `objdiff` and `dsd`. Per `CLAUDE.md`, both are already our toolchain
  (`dsd v0.11.0`, `objdiff-cli v2.7.1`) — noted for completeness, not
  actionable.

## Sources fetched (2026-07-03)

- `notes/mwccarm-codegen.md` (493 lines) —
  https://github.com/bmanus2-dotcom/sm64ds-decomp/blob/main/notes/mwccarm-codegen.md
- `notes/research-matching-levers.md` (125 lines) —
  https://github.com/bmanus2-dotcom/sm64ds-decomp/blob/main/notes/research-matching-levers.md
- `notes/pret-idioms.md` (66 lines) —
  https://github.com/bmanus2-dotcom/sm64ds-decomp/blob/main/notes/pret-idioms.md
- `notes/crack-loop-runbook.md` (249 lines) —
  https://github.com/bmanus2-dotcom/sm64ds-decomp/blob/main/notes/crack-loop-runbook.md

Fetched via `gh api repos/bmanus2-dotcom/sm64ds-decomp/contents/notes/<name>.md
--jq '.content' | base64 -d`. Project status at fetch time: 68.8% matched
(mwccarm-codegen.md header) / 66.9% per crack-loop-runbook.md's own
snapshot — the two files were evidently updated on slightly different days.
