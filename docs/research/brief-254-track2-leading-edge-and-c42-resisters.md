[//]: # (markdownlint-disable MD013 MD041)

# Brief 254 — Track-2 leading-edge pilot + classify the C-42 resisters

**Status:** both deliverables empirically settled. Direct-mwcc only (no
ROM build, no SHA1). Every ship / over-fire / permanence verdict below
is a real mwcc compile this session vs the `dsd`-delinked orig bytes.

## Headline

- **(A) The "631 solo-C-23/StyleA = Track-2 cheap leading edge" premise
  is WRONG, but a cheap leading edge does exist** — for a different
  reason. All 4 pilots ship byte-identical; **none is Track-2 cold-RE.**
  3 are predict_walls over-fires that drain as plain C-42-style natural
  recipes on the default tier; 1 is a genuine Style-A function that
  drains via `.legacy.c` routing. The real Track-2 hard bucket (the 933
  `>0x200` functions, brief 252) is a separate cohort untouched by these
  picks and still needs cold RE.
- **(B) 8 resisters classified.** 1 is actually **COERCIBLE** —
  `2b07f982` ships byte-identical via the **switch** form (falsifies
  brief 253's P-lean). 4 are **P-11** reg-alloc plateaus (below P-11's
  size floor). 1 is **cross-tier** (C-35/P-13-adjacent). 2 are triaged
  (1 likely-coercible array-index, 1 P-leaning predicated-ternary).

## (A) Track-2 leading-edge pilot

Brief 252 found the solo-C-23 (276) / solo-StyleA (355) counts the brain
swarm flagged as Track-2's cheap leading edge are predict_walls
over-fires. This resolves it by compiling representatives.

| Pick | size | predicted | ships? | tier | verdict |
|---|---|---|---|---|---|
| `func_ov006_021b8d30` | 0x3c | solo-C-23 | **byte-identical** | sp1p5 (default) | C-23 over-fire → C-42-style natural recipe |
| `func_ov002_021d1be4` | 0x38 | solo-C-23 | **byte-identical** | sp1p5 (default) | C-23 over-fire → natural recipe |
| `func_02082210` | 0x24 | solo-StyleA | **byte-identical** | sp1p5 (default) | StyleA over-fire (leaf `bx lr`) → natural recipe |
| `func_0208f284` | 0x24 | solo-StyleA | **byte-identical** | sp2p3 (`.legacy.c`) | **real Style-A** → routing drain |

**Why C-23 over-fires here:** both C-23 picks have **no MMIO** (C-23's
actual trigger is nearby `0x040xxxxx` register loads + base-folding).
They are plain two-global thunks. Both ship on the default tier as
natural C-42-style recipes — and mwcc 2.0 even reloaded the pool pointer
after the `bl` exactly like orig (no C-34 address-CSE divergence):

```text
func_ov006_021b8d30 (sp1p5)  vs orig — byte-identical:
push {r3,lr}; ldr r0,[pc]; ldr r0,[r0,#4]; cmp r0,#0; bne;
ldr r0,[pc]; mov r1,#4; mov r2,#0; bl func_02006c0c;
ldr r1,[pc]; str r0,[r1,#4];  mov r0,#1; pop {r3,pc}
recipe:  if (data.f4 == 0) data.f4 = helper(other, 4, 0); return 1;
```

**Why StyleA over-fires:** the detector fires on any function ending in
`bx lr` with no `pop {…pc}`. A **leaf with no stack frame** uses `bx lr`
on *both* tiers, so the prediction is meaningless — `func_02082210` is
byte-identical on the default tier (it is a leaf bitfield-pack; the C-42
detector misses it only because it has no `bl`). The detector is correct
**only** for genuine `stmfd {lr}; sub sp` + separate-`bx lr` functions —
and those *do* ship via `.legacy.c`:

```text
func_0208f284: sp1p5 → push{r3,lr}/pop{r3,pc} (WRONG); sp2p3 → byte-identical:
stmfd sp!,{lr}; sub sp,#4; bl func_0208ce48; ldr r1,[pc]; str r0,[r1];
add sp,#4; ldmfd sp!,{lr}; bx lr
recipe:  data_021a6338 = func_0208ce48();   /* file: *.legacy.c */
```

**Verdict.** The solo-C-23/StyleA cohort is **not** the Track-2 hard
bucket. It is a mix of (a) over-fires that drain as cheap C-42-style
natural recipes on the default tier, and (b) genuine Style-A funcs that
drain via mechanical `.legacy.c` routing. Both cheap. **Brief 256 should
drain this over-fire cohort as a recipe/routing continuation (like the
C-39 work), NOT frame it as "Track-2."** Track-2 proper — the 933
`>0x200` functions holding 49% of unmatched bytes — is a separate,
expensive cold-RE track that this cohort does not represent.

This means the brain-swarm/brief-252 clash resolves toward brief 252:
the counts over-fire, and the picks behind them are cheap-but-not-Track-2.

## (B) The 8 non-shipping C-42 families (brief 253)

Exact members from `tools/c42_family_hunter.py --version eur`.

### COERCIBLE — `2b07f982` ships via the switch form

`func_ov002_022abfc0` / `022abff4`. Orig keeps 3 explicit compares;
mwcc -O4 fuses `n==0x4b||n==0x4c||n==0x4d` into a range check. Brief 253
concluded "no in-range source idiom suppresses it." **Falsified** — the
decomper tried the `if`-chain; the **switch** form defeats the fusion:

```c
int f(struct S *self, int idx) {
    int n = -self->f4;
    switch (n) { case 0x4b: case 0x4c: case 0x4d: return 0; }
    return func_ov002_021afc6c(self->f68[idx]);
}
```

Byte-identical to orig (13/13; `cmp #0x4b; cmpne #0x4c; cmpne #0x4d`).
Variant matrix: `if`-chain (v0), reordered `if` (v2), `>= && <=` (v3),
`volatile n` (v4), no-negate (v5) **all fuse**; only the switch matches.
This is the same optimizer-fusion-defeat mechanism as brief 248's N2
(switch beats predication collapse) and brief 241's switch shapes. Not a
new wall — added to recipe-gotchas as a symptom row.

**Falsification (passed):** compile the switch form → predict the 3
explicit compares. Outcome: matched. Disproof would be the switch *also*
fusing to a range check; it did not.

### P-11 reg-alloc plateau (4 families)

These are reg-allocator plateaus of the **same mechanism as P-11** but on
**smaller** functions (~0x40, below P-11's documented 0x5c-0x74 floor).
Worked example `0ca11024`:

`func_02032efc` / `func_02032f38` (IRQ-guarded accessors). Brief 253
read them as "siblings diverge, one source can't match both." Sharper
finding: the siblings differ in **helper argument order** —
`func_02094688(arg2, base+arg1*12)` vs `func_02094688(base+arg1*12,
arg2)` — i.e. genuinely different source, each individually addressable.
But each member *also* hits a per-member operand-register plateau:

```text
orig:  ldr r1,[r4,#0xe7c]; mov r2,#12; mla r1,r6,r2,r1   (fe7c→r1, accumulate)
mwcc:  ldr r2,[r4,#0xe7c]; mov r1,#12; mla r1,r6,r1,r2   (12→r1, the constant)
```

**Falsification (ran, 5 variants):** `fe7c + arg1*12`, `arg1*12 + fe7c`,
`int base=fe7c; base+arg1*12`, `int m=arg1*12; fe7c+m`, `fe7c + 12*arg1`
— **all** emit `mla r1,r6,r1,r2` (constant in the multiplier reg); none
reproduces orig's `mla r1,r6,r2,r1`. So even with the correct per-member
arg order, each is reg-alloc-blocked.

| Family | Members | Module | Divergence (P-11) |
|---|---|---|---|
| `0ca11024` | `func_02032efc` / `f38` | main | mla operand-reg assignment (worked example above) |
| `e7e4cff1` | `func_02032e8c` / `ec4` | main | **adjacent to 0ca11024; same IRQ-accessor family**, add-offset index |
| `96d2a201` | `func_02054fd0` / `55000` | main | stack-arg setup, siblings swap r1↔r2 |
| `ef19bc9a` | `func_ov002_02238bc8` / `0226db7c` | ov002 | pool-load reg + callee-save order swap |

Deep-verified `0ca11024` this session (5-variant falsification);
`e7e4cff1` is the same source-family as `0ca11024` (high confidence);
`96d2a201` / `ef19bc9a` rest on brief 253's diffs + the shared mechanism.
**The permuter is the untested fall-through** — P-11's precedent (brief
198/200: permuter scored these 480-500, reg-alloc downstream of source
iteration) says it does not crack them, but that is precedent, not a run
this session. Added to the P-11 census.

### Cross-tier candidate — `0d484478`

`func_ov002_0226b0f0` / `0226b22c`. A halfword-pack-into-args:
`helper(a0, 14, (u16)arg1, (arg2&0xff)|((arg3&0xff)<<8))`. The byte-pack
sequence matches **only on the 1.2 tiers**, but the epilogue is
**2.0-only**:

```text
orig:   push {r3,lr};  and r2,r3,#0xff; orr r2,ip,r2,lsl#8;  …; pop {r3,pc}
sp1p5:  push {r3,lr} ✓ epilogue, but pack fuses to `lsl r2,r3,#8` ✗
sp2p3:  pack `and r2,r3,#0xff; orr …lsl#8` ✓, but Style-A `stmfd;sub sp / ldmfd;bx lr` epilogue ✗
```

**Falsification (ran):** 3 pack source-forms on sp1p5 (`&0xff<<8`,
`<<8 & 0xff00`, `unsigned char` temps) all fail to emit the 1.2-style
`and r2,r3,#0xff; orr …lsl#8`; sp2p3 reproduces the pack but the
epilogue diverges. No single tier + source-form tested bridges
pack→1.2 and epilogue→2.0. This is the C-35 routing-trilemma / P-13
cross-tier-irreducible family (sp2 / sp3 untested → "candidate"; a full
tier×variant matrix would lock it).

### Triaged (2 families)

- **`29f7d996`** (`func_ov002_021b3e5c` / `94`, ov002) — **likely
  coercible.** A 2-D table lookup `*(u16*)(base + (arg0&1)*stride +
  arg1*20)` with `base`/`stride` pool-loaded into the `mla`. The index
  arithmetic is deterministic; the risk is the `mla` operand grouping
  (which pool constant pairs with which). A decomper pilot with the 2-D
  index source should ship it. Not piloted (needs the table's pool
  constants reverse-engineered first).
- **`378a6647`** (`func_ov000_021adb9c` / `dbdc`, ov000) — **P-leaning.**
  Predicated ternary `r4 = (g.f29c != 0) ? h.f264 : 32`. The predication
  itself matches (`ldrne r4; moveq r4,#32`), but orig **hoists** the
  `&h` pool load out of the conditional while mwcc **defers** it into the
  `ne`-branch (`ldrne r0,[pc]; ldrne r4,[r0,#0x264]` — 2 predicated insns
  vs orig's 1). **Falsification (ran):** the natural ternary defers the
  pool load. One form tested → a hoist-focused variant matrix is needed
  to confirm coercible-vs-P; leaning P (pool-load scheduling).

## Taxonomy correction

State.md queued the 4 reg-alloc families "→ P-14." **They are P-11, not
P-14** — P-14 is specifically the sub-struct base-offset fold (brief
250); these are operand-register / save-order reg-alloc plateaus, P-11's
mechanism. The only nuance is size (~0x40, below P-11's 0x5c-0x74
detector floor), recorded in the P-11 census.

## What did NOT pan out

1. **The Track-2 "leading edge" framing.** The flagged cohort isn't
   Track-2 at all — 3 of 4 pilots are over-fires drainable on the default
   tier. The brain swarm self-flagged its StyleA match-rate; the pilots
   confirm the StyleA count is dominated by leaf over-fires.
2. **Brief 253's `2b07f982` P-lean.** The switch form ships it
   byte-identical; the `if`-chain conclusion missed the switch lever.
3. **Brief 253's "siblings can't share one source" framing for the
   reg-alloc families.** The siblings differ because they are *different
   source* (e.g. swapped helper arg order); the binding constraint is the
   *per-member* P-11 operand-reg plateau, not the cross-sibling mismatch.
4. **`0d484478` is not cleanly one tier.** It wants the 1.2 pack and the
   2.0 epilogue simultaneously — a cross-tier tension, not a single-tier
   routing fix.

## Falsification-test ledger (this session)

| Claim | Test | Result |
|---|---|---|
| solo-C-23/StyleA = cheap, not Track-2 | compile 4 reps on the indicated tier | 4/4 byte-identical |
| `2b07f982` coercible | switch form vs orig bytes | byte-identical (13/13) |
| `0ca11024` (+family) = P-11 | 5 source-form variants | all wrong mla operand reg |
| `0d484478` cross-tier | sp1p5 (+3 forms) vs sp2p3 | neither tier bridges pack+epilogue |
| `378a6647` pool-hoist | natural ternary vs orig | pool load deferred, not hoisted |

## Cross-references

- `docs/research/brief-253-c42-drain-wave8-final.md` — the 8 families.
- `docs/research/brief-252-post-c42-next-track-scout.md` — the over-fire
  finding this confirms + the Track-2 (933-func) sizing.
- `docs/research/codegen-walls.md` § P-11 (census updated), § C-35 /
  § P-13 (cross-tier family for `0d484478`), § C-20 (halfword-pack).
- `docs/research/recipe-gotchas.md` — switch-defeats-range-fusion row.
