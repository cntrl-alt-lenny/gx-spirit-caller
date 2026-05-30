[//]: # (markdownlint-disable MD013 MD041)

# Brief 268 — sub-classify the heterogeneous StyleA over-fire tail

**Status:** the 4 named clusters settled. Direct-mwcc only (no ROM
build, no SHA1). Every verdict is a real mwcc compile this session on
the `.legacy.c` tier (mwcc 1.2/sp2p3) vs the `dsd`-delinked orig bytes.

## Headline

**Two of the four named clusters are clean batch-template families;
one is a new permanent (P-15); the leaf grab-bag is genuinely
per-pick.** The "heterogeneous tail decomposes into families"
multiplier holds for the *regular-shell* clusters (IRQ criticals,
memset wrappers) but NOT for the leaf grab-bag — that splits the same
way brief 266's frameless tail did.

| Cluster | Picks | Verdict | Lever |
|---|---:|---|---|
| **F — IRQ critical-section wrapper** | 21 | **COERCIBLE** template (15/15) | `old=OS_DisableIrq(); …; OS_RestoreIrq(old)` → `.legacy.c` |
| **G — `func_020945f4` memset wrapper** | 8 | **COERCIBLE** recipe (16/16, 14/14) | transcribe `memset(ptr,val,n)` + per-pick body; gotcha 17 where re-reads appear |
| **Copy32 VRAM-copy** | 3 | **P — new P-15** | reg-alloc + const-CSE plateau; 10 variants fail |
| **NO_BL leaf grab-bag** | ~59 (+13 `blx`) | **grab-bag, per-pick** | MMIO bitfield 16/16 via `volatile`; rest = gotchas 16/17/switch; a fraction hit P-15 |

The StyleA-real tier counts **800** functions this session (was ~614 at
brief 263). The four named clusters cover ~90 of them; the IRQ idiom
*as a whole* (calls `OS_RestoreIrq`) spans **140** functions — the 21 in
Family F are the regular `[Disable, ≤1 helper, Restore]` shells; the
other 119 are larger criticals with the same coercible shell but
bigger per-pick bodies.

## Family F — IRQ critical-section wrapper (COERCIBLE, ×21)

The NitroSDK critical-section idiom. `OS_DisableIrq()` returns the old
IRQ state in r0; it must survive the inner work to be passed to
`OS_RestoreIrq`, so mwcc parks it in callee-saved **r4** — which IS the
Style-A frame (`push {r4, …, lr}; sub sp,#4 … ; bx lr`). The inner
`<work>` is ordinary per-pick C.

```c
typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);
extern void func_02091a8c(void *);

void func_02091af4(struct Self *self) {          /* 15/15 byte-identical */
    OSIntrMode old = OS_DisableIrq();
    if (self->f64 != 2) func_02091a8c(&self->f9c);
    OS_RestoreIrq(old);
}
```

**Falsification:** `.legacy.c` (sp2p3) → byte-identical; the same
source on sp1p5 emits the wrong epilogue (`push {r3,r4,r5,lr}` /
`pop {…,pc}`) — the symptom that flags the family. The `old`-in-r4
reg-alloc falls out of keeping `old` live across the inner call; no
gotcha needed beyond gotcha 10 (`.legacy.c` routing).

**Worklist (21):** `0206dbbc 02070b4c 0207397c 02077b98 02091af4
0209268c 020930b0 02093a44 02093d44 020940ac 02096728 020970a8
020972d4 02097668 020987a4 0209a2b0 0209c034 0209d4ec 0209d69c
020a553c 020a55e0`. (The other 119 `OS_RestoreIrq` callers use the
same shell with larger bodies — same lever, more per-pick transcription.)

## Family G — `func_020945f4` memset wrapper (COERCIBLE, ×8)

`func_020945f4` is the game's **memset** (`void(void *ptr, int val,
unsigned count)` — byte/halfword/word fill). The "wrappers" call it and
return; the body around the call varies (conditional count, fill+init),
so this is a *recipe*, not a fixed-source template: transcribe the
`memset` call naturally + the per-pick body, route `.legacy.c`, apply
gotcha 17 where a re-read/dead-store tail appears.

```c
extern void func_020945f4(void *ptr, int val, unsigned count);

/* 0206fc2c — conditional fill-and-advance: 16/16 byte-identical */
int f(int a0, unsigned a1, int a2, unsigned a3) {
    if (a3 < a1) { unsigned n = a1 - a3; func_020945f4((void*)a2, a0, n); a2 += n; }
    return a2;
}

/* 02097810 — fill + gotcha-17 re-read tail: 14/14 byte-identical */
void g(struct S *self) {                 /* f16,f24 must be volatile */
    func_020945f4(self, 0, 0x5c);
    self->f16 = 0; self->f12 = self->f16;     /* dead store + re-read kept */
    self->f24 = 0; self->f20 = self->f24;
}
```

**Falsification:** drop the `volatile` on the re-read fields → mwcc
CSEs `self->f12 = self->f16` to the already-live `0` and elides the
dead store (the miss). **Worklist (pure single-call, 8):** `0206fc2c
02077f8c 020785cc 02078f50 0207b408 02097810 0209c364 020a5d08` (48
total `func_020945f4` callers in the StyleA tier).

## Copy32 VRAM-copy — P (new **P-15**, ×3)

`0208fd30 / 0208fd90 / 0208fe58`. The shape (confirmed byte-for-byte
against orig):

```c
void f(void *dst, int src, unsigned size) {
    int v = data_0210249c;
    if (v != -1 && size > 0x30) func_02094030(v, dst, CONST + src);
    else                        Copy32(dst, CONST + src, size);
}
```

The natural C is **structurally identical** to orig — same
instructions, same branch layout, same per-branch `CONST+src` add — but
diverges on register allocation, which no source shape steers:

1. **Reg-alloc (all 3):** orig parks `dst` in callee-saved **r4**
   (`push {r4, lr}`) and evacuates `size` to r3; the natural C packs
   all live values into caller-saved regs (`push {lr}`, `dst`→lr,
   `size` kept in r2). `dst` is provably **not** live across either
   call — r4 is a pure allocator preference.
2. **Const-CSE (fd30/fd90):** orig hoists the VRAM `CONST`
   (`0x6600000` / `0x6400000`) into a register once (`add r2, ip, lr`);
   the natural C always folds it into the add immediate
   (`add r2, ip, #CONST`). fe58's `CONST` (`0x7000000`) is folded by
   *both* — only the reg-alloc axis diverges there.

**10 source variants** (condition reorder, signed/unsigned `size`,
hoisted `srcAddr` temp, pointer-typed global, 4-arg signature,
`volatile` global, …) — **none** flips `dst` into r4 or forces the
const hoist. Same compiler (mwcc 1.2/sp2p3) for orig and these
compiles, so the divergence is allocator-internal, downstream of source
shape. This is the **legacy-tier (1.2/sp2p3) sibling of P-11** (the
mwcc-2.0 reg-allocator plateau); filed as **P-15**.

**Falsification:** any compile of the natural C yields `push {lr}` (1
saved reg) where orig has `push {r4, lr}` (2). A coercion would have to
produce orig's r4 allocation; if a future permuter run finds it,
demote P-15 — but it resists direct source iteration.

## NO_BL leaf grab-bag — per-pick, not a template (~59 + 13 `blx`)

My StyleA-no-`bl` set is **72**: 13 are actually `blx` function-pointer
dispatchers (the classifier keys on `bl`), leaving ~59 true leaves.
They are **shape-diverse** — the same population as brief 266's
frameless-leaf tail, just with a callee-saved frame. No single
template; coercible **per-pick** via the existing toolkit:

- **MMIO bitfield** (`func_0208c98c`, **16/16 byte-identical**):
  `volatile` hardware register + the natural `(v & MASK) >> k` /
  `v & ~MASK` — read-modify-write of `0x4000000`.
- **MMIO save/RMW/restore** (`func_020905dc`): the dead `volatile`
  read and re-read reproduce (gotcha-17-via-`volatile`-MMIO), **but the
  frame does not** — orig uses `lr` as a 6th scratch (→ framed) where
  the natural C packs into 5 caller-saved regs (→ frameless). Same
  reg-alloc plateau as P-15, opposite direction. Per-pick / P-15-class.
- **`blx` fn-ptr dispatch** (`func_0207cd34`): `if (obj->cb)
  obj->cb(&obj->a, &obj->b, &obj->c)` — coercible but needs the struct
  layout; per-pick.

**Verdict:** the leaf grab-bag does NOT decompose into a batch family.
Drain the cleanly-coercible members (MMIO bitfield, field-arith,
fn-ptr-dispatch with a known struct) and **skip** the reg-alloc /
frame-vs-frameless ones (P-15-class) — they are not a quick match.

## Falsification-test ledger (this session)

| Pick | Cluster | Lever | Result |
|---|---|---|---|
| `func_02091af4` | F (IRQ) | `OS_DisableIrq/RestoreIrq` shell, `.legacy.c` | byte-identical 15/15 |
| `func_0206fc2c` | G (memset) | natural `memset` call | byte-identical 16/16 |
| `func_02097810` | G (memset) | memset + gotcha-17 `volatile` tail | byte-identical 14/14 |
| `func_0208c98c` | NO_BL leaf | `volatile` MMIO bitfield | byte-identical 16/16 |
| `func_020905dc` | NO_BL leaf | `volatile` MMIO RMW | logic+dead-read match; **frame diverges** (P-15-class) |
| `func_0208fd30` | Copy32 | natural ternary-copy | structural match; reg-alloc + const-CSE diverge → P-15 |
| `func_0208fe58` | Copy32 | natural ternary-copy | structural match; reg-alloc diverges → P-15 |

## What did NOT pan out

1. **Copy32 as a template.** 10 source variants tried; none reproduces
   orig's `dst`→r4 allocation or the const hoist. It is P-15, not a
   recipe.
2. **The leaf grab-bag as "another c94".** The brief's
   heterogeneous→families multiplier held for the regular *shell*
   clusters (F, G) but NOT the leaves — they are per-pick (same finding
   as brief 266's frameless tail), and a non-trivial fraction hit the
   P-15 reg-alloc plateau (`func_020905dc`).
3. **Forcing a frame for `func_020905dc`.** The natural C is *tighter*
   than orig (5 caller-saved regs, frameless); nothing short of orig's
   exact register pressure reproduces the `lr`-as-scratch frame.

## Scope / what this brief did NOT touch

Docs-only. No `.c` ships (pilots are research artifacts in `/tmp`). No
`predict_walls.py` change — these are recipe levers / a reg-alloc
plateau, not a new detectable cue (predict_walls already correctly
flags the whole tier StyleA). The frameless / C-23 / C23-noMMIO
cohorts the decomper drains in brief 269 are untouched.

## Verification

| Gate | Status |
|---|:---:|
| direct-mwcc compiles (sp2p3) | F/G/leaf 4 picks byte-identical; Copy32 5 picks structural-match-only |
| `ruff check .` | clean |
| `tests/` (full suite) | 2276 passed (docs-only; index regenerated) |

## Cross-references

- `docs/research/recipe-gotchas.md` § StyleA over-fire families —
  Family F + G templates added; gotcha 10 (`.legacy.c`), gotcha 17
  (`volatile`).
- `docs/research/codegen-walls.md` § P-15 — the Copy32 reg-alloc
  plateau (sibling of P-11).
- `docs/research/brief-267-overfire-drain-wave3.md` — flagged the four
  clusters + the Copy32 P-candidate this brief settles.
- `docs/research/brief-266-overfire-frameless-leaf-tail-classify.md` —
  the frameless tail the NO_BL leaf grab-bag mirrors.
- `docs/research/brief-264-overfire-stylea-family-recipes.md` —
  Families A–E this extends with F + G.
