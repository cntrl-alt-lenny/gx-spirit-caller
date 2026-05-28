[//]: # (markdownlint-disable MD013 MD041)

# Brief 250 — classify brief 249's deferred escapes + revisit N3

**Status:** all three verdicts empirically grounded under direct mwcc
(2.0/sp1p5). Two NEW walls added (C-43 coercible, P-14 permanent);
Family 7 confirmed as the existing P-1. Scaffolder direct-mwcc only —
no ROM build, no SHA1 gate.

## Headline

| Subject | Verdict | Outcome |
|---|---|---|
| **Family 5** (4 picks, ov016/17/19) | **COERCIBLE** | NEW **C-43** + gotcha 13 + classifier + tests. Byte-identical recipe found. |
| **N3** (`func_02032724`) | **PERMANENT** | NEW **P-14**. 6 idioms + 2 probes; none force the in-range split. |
| **Family 7** (3 picks, main) | **= existing P-1** | Confirmed shape-collapse. 3 picks added to P-1 census. NOT a new wall. |

The brief's joint hypothesis — "Family 5 and N3 share one underlying
mwcc behavior (orig materializes a struct-base address that mwcc folds
into each access's offset)" — is **FALSIFIED**. The two have different
mechanisms and opposite verdicts (detail in section A).

Tooling: a direct-mwcc compile+disasm harness (compile a `.c` with the
exact build cflags, `arm-none-eabi-objdump --architecture=armv5te` the
`.o`). All disasm below is from that harness vs the `dsd`-delinked orig
gap objects. No worked-example `.c` was shipped to `src/` (scaffolder
scope); the recipe snippets here are research artifacts.

## (A) Family 5 + N3 — joint struct-base materialization

Orig ground truth (from `dsd` delink + objdump):

```text
FAMILY 5  func_ov016_021b3560 (ov016, 0x34)
push  {r3, r4, lr}
sub   sp, sp, #12
ldr   r4, [sp, #24]        ; stack arg A  (WORD load)
ldr   lr, [sp, #28]        ; stack arg B
ldr   ip, [sp, #32]        ; stack arg C
strh  r3, [sp]             ; local@0 = a3
add   r3, sp, #0           ; <<< materialize &local (reuse freed r3)
strh  r4, [sp, #2]         ; local@2 = A   (truncated to u16 on store)
strh  lr, [sp, #6]         ; local@6 = B   (GAP at offset 4)
strh  ip, [sp, #8]         ; local@8 = C
bl    func_ov016_021b3498  ; helper(r0, r1, r2, &local)  (GAP at 10)
add   sp, sp, #12
pop   {r3, r4, pc}

N3  func_02032724 (main, 0x24)
push  {r4, lr}
add   r4, r0, #0x1fc       ; <<< materialize &self->inner
ldr   r1, [r4, #0xc80]     ; inner.field   (combined would be [r0,#0xe7c])
cmp   r1, #0
popeq {r4, pc}
bl    func_02032e6c
mov   r0, #0
str   r0, [r4, #0xc80]     ; reuse r4 base across the call
pop   {r4, pc}
```

### Family 5 — COERCIBLE (the materialization reproduces naturally)

The natural packed-stack-local-struct recipe produces the orig's
`add r3, sp, #0` mid-write **on the first try**. Variant matrix (all
emit `add rD, sp, #0` at the right point):

| Variant | `add rD,sp,#0`? | Stack-arg loads | Match |
|---|:---:|---|:---:|
| v0 struct + gap fields, u16 args | yes | `ldrh` (u16 args) | near (3/13 off) |
| v1 `__attribute__((packed))` | yes | `ldrh` | near |
| v2 union with byte array | yes | `ldrh` | near |
| v3 raw `u16 local[6]`, sparse index | yes | `ldrh` | near |
| v4 explicit `struct P *p = &local` | yes | `ldrh` | near |
| **v5 stack value args typed `int`** | **yes** | **`ldr`** | **byte-identical** |
| v6 all value args `int` | yes | `ldr` | byte-identical |

The only divergence in v0–v4 is the **three stack-arg load widths**:
the orig loads the stack args with `ldr` (word) and truncates to u16
only on the `strh` store; declaring those args `u16` makes mwcc emit
`ldrh`. That 3-of-13-instruction delta is the entire 69% fuzzy that
brief 249 saw. The `add r3, sp, #0` was never the blocker — it appears
with both `u16` and `int` args.

v5 (stack value args `int`, struct fields `u16`) is **byte-identical**
to orig (the `bl` differs only by the unlinked reloc offset):

```text
e92d4018  push {r3, r4, lr}      e24dd00c  sub sp, sp, #12
e59d4018  ldr r4, [sp, #24]      e59de01c  ldr lr, [sp, #28]
e59dc020  ldr ip, [sp, #32]      e1cd30b0  strh r3, [sp]
e28d3000  add r3, sp, #0         e1cd40b2  strh r4, [sp, #2]
e1cde0b6  strh lr, [sp, #6]      e1cdc0b8  strh ip, [sp, #8]
eb000000  bl helper (=orig ebfffffe pre-link)
e28dd00c  add sp, sp, #12        e8bd8018  pop {r3, r4, pc}
```

The 4 family members are structurally byte-identical (same 13-insn body,
differing only by the helper symbol each calls), so one recipe drains
all 4:

| Pick | Module | Helper called |
|---|---|---|
| `func_ov016_021b3560` (pilot) | ov016 | `func_ov016_021b3498` |
| `func_ov016_021b5154` | ov016 | `func_ov016_021b509c` |
| `func_ov017_021b405c` | ov017 | `func_ov017_021b3fa4` |
| `func_ov019_021b3f00` | ov019 | `func_ov019_021b3e38` |

Filed as **C-43** + **gotcha 13** + a `predict_walls.py` classifier
(fires before the generic C-42 hint) + tests.

### N3 — PERMANENT (the fold is an addressing-mode decision)

Falsifiable prediction: *if any C idiom binds `&self->inner` to a value
mwcc keeps in a register across the call AND uses for the field
accesses (rather than folding the offset into `self`-relative
addressing), mwcc emits the orig's split `add r4,r0,#0x1fc` +
`[r4,#0xc80]`.*

Cheapest test — the 6-idiom variant matrix on the in-range pick
(combined offset `0x1fc + 0xc80 = 0xe7c`, which fits the 12-bit
LDR/STR immediate):

| Variant | mwcc emits |
|---|---|
| v0 nested/block `self->inner.field` | `mov r4,r0; ldr/str [r4,#0xe7c]` (folded) |
| v1 pointer alias `struct Inner *p = &self->inner` | folded `[r4,#0xe7c]` |
| v2 `(struct Inner *)((char*)self + 0x1fc)` | folded `[r4,#0xe7c]` |
| v3 helper takes `&inner` | `add r0,r4,#0x1fc` ONLY as a throwaway bl arg; accesses still `[r4,#0xe7c]` |
| v4 `volatile int *` field | DIFFERENT split `0x27c`/`0xc00` — non-matching |
| v5 `char *base = &self->inner` + cast | folded `[r4,#0xe7c]` |

Result: **none reproduce orig.** v1/v2/v5 prove mwcc's constant-offset
propagation + outer-base CSE is sticky (it proves `p == self + 0x1fc`
and re-folds each access to `self + 0xe7c`). `volatile` affects only the
load/store, not the address computation, and produces a *different*
non-matching split. The helper-takes-inner form materializes `&inner`
only as a call-arg throwaway, never as the access base.

Two diagnostic probes pin the mechanism:

```text
Probe A  two DISTINCT in-range fields (0xc80 load, 0xc84 store):
    ldr r0,[r4,#0xe7c] ; ... ; str r0,[r4,#0xe80]   -> STILL folded
Probe B  push combined offset OUT of range (0x1fc + 0xf00 = 0x10fc > 0xfff):
    add r4,r0,#0x1fc ; ldr/str [r4,#0xf00]          -> SPLITS (orig shape!)
```

So mwcc folds `&self->inner` + field offset into one base-relative
access **whenever the combined offset fits the addressing-mode's 12-bit
immediate**, and CSEs the outer `self` base. N3's `0xe7c` fits → mwcc
always folds → no C source idiom forces the in-range split. The orig's
split came from a compiler/source where `&inner` was not a provable
compile-time-constant offset from `self`. Permanent under direct mwcc.
Filed as **P-14**.

### Why the joint hypothesis is wrong

The two "materializations" are different operations:

- **Family 5** `add r3, sp, #0` is *address-of-a-stack-local passed as a
  pointer arg* — mwcc does this natively and identically to orig. There
  was no offset-folding problem at all; the stores already use
  `[sp, #offset]`. The escape was an unrelated arg-width typing trap.
- **N3** `add r4, r0, #0x1fc` is an *intermediate sub-struct base reused
  for repeated field access* — mwcc folds it away (in-range), and no C
  idiom prevents the fold.

They only *looked* alike at the "orig has an `add rN, base, #K`" surface
level. C-43 is coercible; P-14 is permanent.

## (B) Family 7 — confirmed P-1, not a new peephole

Per the C-15-vs-P-1 wall-family note (codegen-walls ~line 1247), P-1 is
**shape-collapse, not a peephole**: `(x << K) >> K` is semantically
`x & mask`, and mwcc folds to the mask whenever it fits an immediate, on
every SP. There is no "shift form that defeats it" — the brief-249
framing was exactly the misconception the note warns against.

Single lead tested (keep the value `unsigned char`-typed end-to-end so
no explicit cast is emitted): **falsified.** Variant matrix on the pilot
`func_0201b690` (the body up through `ldr r0,[r0,#8]` matches orig
byte-for-byte in every case; only the extract diverges):

| Variant | Tail emitted |
|---|---|
| v0 `(unsigned char)` cast on int field | `and r0, r0, #0xff` |
| v1 `unsigned char` return type, no cast | `and r0, r0, #0xff` |
| v2 route through `unsigned char` local | `and r0, r0, #0xff` |
| v3 explicit `& 0xff` | `and r0, r0, #0xff` |
| v4 explicit `((unsigned)x << 24) >> 24` | `and r0, r0, #0xff` |

Even writing the shift-pair literally in C (v4) collapses to `and`.
Orig has `lsl r0,#24; lsr r0,#24` (2 insns). This is textbook P-1.

The 3 Family-7 picks (the only main-module functions with the P-1
zero-extend getter tail `ldr …; lsl #K; lsr #K; pop`):

| Pick | Size | Extract | mwcc collapse |
|---|---|---|---|
| `func_0201b690` (pilot) | 0x34 | `lsl/lsr #24` (byte) | `and #0xff` |
| `func_02018dcc` | 0x34 | `lsl/lsr #31` (bit0) | `and #1` |
| `func_02019184` | 0x48 | `lsl/lsr #24` + `#28` (predicated) | `and #0xff` / `#0xf` |

Classified **P-1-blocked**; added to the P-1 census (codegen-walls
§ P-1). No new wall.

## (C) Taxonomy updates

- `codegen-walls.md` § C-42: waves 5–6 outcomes folded in; Family-5
  carved out to C-43; Family-7 → P-1; N3 → P-14.
- New § C-43 (coercible) + new § P-14 (permanent, header bumped to 14
  patterns).
- `recipe-gotchas.md`: gotcha 13 (int-typed stack args for the
  packed-stack-local builder) + a symptom→gotcha row.
- `predict_walls.py` + tests: C-43 detector.

## Empirical method note

The discriminating move on N3 was **probe B** — pushing the combined
offset out of the 12-bit immediate range to see whether mwcc *can* be
made to split. It can, which converts a vague "mwcc is sticky" claim
into a precise mechanism (immediate-range fold) and a sound permanence
verdict for the in-range pick. When a P-wall verdict rests on "no idiom
worked," add one probe that deliberately *crosses* the suspected
threshold; if the wall flips, you have named the mechanism instead of
merely cataloguing failures.

## Cross-references

- `docs/research/brief-248-c42-wave5-escapes-and-sub-shape-homogeneity.md`
  — N3 first falsified (heap ptr-alias).
- `docs/research/brief-249-c42-drain-wave6-sibling-hunt.md` — Family 5 +
  Family 7 deferred ("## 2 escapes").
- `docs/research/codegen-walls.md` § C-42 / § C-43 / § P-1 / § P-14.
- `docs/research/recipe-gotchas.md` — gotcha 13.
