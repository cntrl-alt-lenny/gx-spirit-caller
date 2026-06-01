[//]: # (markdownlint-disable MD013 MD041)

# Brief 304 — co-drain wave 1: matching ov006's reachable cohort

**Brief:** 304 (scaffolder). Role shift: the research/prep arc is complete;
the scaffolder is now a **second draining stream** that ships matched `.c`.
Collision-free by construction — it works **ov006** (its own
`src/overlay006/`, its own `config/eur/arm9/overlays/ov006/delinks.txt`, its
own header) while the decomper drains ov002. Per-pick gate = **EUR objdiff
100%** via direct-mwcc (the brain runs the 3-region SHA1 gate on merge).

## Headline

**12 shipped (all `.c`), all EUR objdiff 100%** (byte-identical vs the
delinked gap `.o`, bl/pool reloc modulo), all wired into `delinks.txt` and
compiled in-tree. The brief-300 premap holds: ov006's reachable cohort is
**simple-dominated and hand-matchable** — the 12 picks fall into **3 banked
families + 4 singletons**, and the dominant family (callback-dispatch) clones
across members by swapping only two global addresses. This is a healthy first
wave; the family recipes make wave 2 mechanical.

Three further picks (`021b2b08`/`021b2c9c` notify-on-truthy, `021b56d8`
4-step sequencer) verified objdiff 100% but were **already matched on the
branch** — reverted, not double-shipped. They confirm those families
generalize and flag that ov006's lowest fruit is already partly drained
(coordinate the matched-set before wave 2).

## The 12 picks

| # | func | size | family / shape | notes |
|---|---|---|---|---|
| 1 | `021b6bac` | 0x34 | singleton: 2-field index-select | `switch(sel)` (gotcha 5) |
| 2 | `021c8278` | 0x34 | singleton: MMIO reg config | `volatile u16` RMW @ `0x0400100a` |
| 3 | `021b6f18` | 0x38 | singleton: 2-D table select | `base + r*104 + c*2 + region-base` |
| 4 | `021be558` | 0x40 | singleton: delta-compare writeback | 2×`u16` field diff → 3 stores + bool |
| 5 | `021b5614` | 0x48 | **dispatch family** (seed) | A=`0224f38c` B=`021cbbb0` |
| 6 | `021b49b4` | 0x48 | dispatch family (clone) | A=`0224f2e8` B=`021cbb74` |
| 7 | `021b4f20` | 0x48 | dispatch family (clone) | A=`0224f330` B=`021cbb8c` |
| 8 | `021b3a1c` | 0x48 | dispatch family (clone) | A=`0224f248` B=`021cbb38` |
| 9 | `021b3f88` | 0x50 | dispatch family (variant) | A=`0224f290` B=`021cbb50`, `+A[4]=0` prologue |
| 10 | `021b7b48` | 0x30 | **5-iter-pass family** (seed) | init=`021b7cfc` step=`021b7bb0` |
| 11 | `021b7b78` | 0x38 | 5-iter-pass family (variant) | +extra=`021b7e80` |
| 12 | `021b8d6c` | 0x30 | guarded-call + clear | G=`0224f3e0` sink=`02006e1c` |

## Banked family recipes

### Family A — callback-dispatch (5 members, the headline)

A per-state machine: index a callback table by the current state, invoke it,
and on a truthy result clear the state's `+4` flag.

```c
extern int A[];                  /* [0]=state index, [1]=flag, ([4]=reset word) */
extern int (*B[])(void);         /* per-state callback table */
int f(void) {
    /* variant only: A[4] = 0; before the dispatch */
    int (*cb)(void) = B[A[0]];
    if (cb != 0) {
        if (cb() != 0)
            A[1] = 0;
        return 0;
    }
    return 1;                    /* MUST be the fall-through tail */
}
```

- **Clone-by-two-globals**: every member differs only in `(A, B)` (see the
  table). 4 clones verified by swapping the pair; 1 variant (`021b3f88`) adds
  a leading `A[4] = 0;` (the `mov r1,#0; str r1,[r0,#0x10]` prologue, base
  reused in `r0`).
- **gotcha 5 (predication-vs-branch)**: the naive `if (cb == 0) return 1;`
  *first* makes mwcc predicate the constant return (`moveq/popeq`). The orig
  uses a branch tree, so the `return 1` must be the **fall-through tail** with
  the work inside `if (cb != 0) { … return 0; }`. (The inner `if (cb())` is a
  real branch — a `bl` can't be predicated — so it is safe as written.)

### Family B — 5-iteration per-index pass (2 members)

Reset/setup a subobject, then run a fixed 5-step pass over it.

```c
extern void f_init(void *p);
extern void f_step(void *p, int i);
int f(void *p) {
    int i;
    f_init(p);
    /* variant only: f_extra(p); */
    for (i = 0; i < 5; i++)
        f_step(p, i);
    return 1;
}
```

`021b7b48` = (init `021b7cfc`, step `021b7bb0`); `021b7b78` adds
`f_extra = 021b7e80` between init and the loop. `i < 5` is a signed `blt`;
`p` stays in a callee-saved reg across the calls.

### Pattern C — guarded-call + clear (`021b8d6c`)

```c
extern int  G[];
extern void sink(int);
int f(void) {
    if (G[1] != 0) { sink(G[1]); G[1] = 0; }
    return 1;
}
```

The body's `bl` forces a real branch, so no predication trap (unlike a pure
store-only `if`).

### The 4 singletons

- **`021b6bac`** — `switch (sel) { case 0: return *(int*)(base+0x6234); case
  1: return *(int*)(base+0x6238); default: return 0; }`. The `switch` (not an
  `if`-chain) is what yields the branch tree vs predicated `addeq/ldreq`
  (gotcha 5).
- **`021c8278`** — `volatile unsigned short *reg = (void*)0x0400100a;
  *reg = (*reg & ~3) | 1; *reg = (*reg & 0x43) | 0x210 | 0x2000; return 1;`
  (a hardware register configure).
- **`021b6f18`** — region-selected 2-D table read:
  `(alt && r) ? *(short*)(base + r*104 + c*2 + 0xc87e)
              : *(short*)(base + r*104 + c*2 + 0xc676)`.
- **`021be558`** — `d = *(u16*)(G+0x6c) - *(u16*)(G+0x76);` then three int
  stores to the out-struct (`+0x88=6`, `+0x8c = d?19:18`, `+0x90=0`) and
  `return d == 0;` (`G = data_ov006_02257548`).

## Harness note — the verify parser (banked)

The direct-mwcc objdiff comparator (`verify.py`) had two real traps that the
ov006 gap objects expose (both now handled):

1. **dsd local-label symbols.** Delinked gap `.o` disassembly interleaves
   `<.L_021bXXXX>:` *label* lines between instructions. The function-range
   parser must break only on the next `<func_…>`, **not** on any `<symbol>`
   line, or it truncates mid-function (e.g. an 18-word func parsed as 14).
2. **pool-word rendering asymmetry.** A reloc'd literal-pool word renders
   `addr:\t00000000 …` + reloc in the delinked orig, but as `…` + reloc-only
   (no byte line) under a `$d` mapping symbol in mwcc's own object. So compare
   **byte-words with reloc'd words as wildcards** and tolerate trailing
   reloc'd / `00000000` pool entries on either side. (A `bl`/`blx` reloc and
   an ABS32 pool word are both "identical modulo reloc".)

With both fixed, all 12 picks read clean OBJDIFF 100% and the artifact-driven
"16v18 / [15] pop" false diffs disappear.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **12/12 byte-identical** (bl/pool reloc modulo) |
| in-tree build (`ninja`, 12 `.o`) | compiled + wired; dsd re-delinked ov006 with no error |
| ov006 `delinks.txt` | 12 `complete .text` blocks appended (no collision, no overlap) |
| 3-region `ninja sha1` | **deferred to the brain on merge** (per brief — region-mismatch reproduced there) |
| `ruff check` / `tests/` | clean / pass |

`src/overlay006/` gains 12 `.c` + the promoted `ov006_core.h`; EUR ov006
`delinks.txt` gains 12 `complete` blocks. No tool change, no USA/JPN config
change. (The pre-existing macOS `m2ctx.py` `-fworking-directory` clang failure
on `.ctx.c` scratch-context targets is unrelated and does not touch the build
path — it blocks only decomp.me context generation, on Linux/CI it is moot.)

## Recommendation for the brain

1. **ov006 co-drain is live and the premap holds.** 12 byte-identical `.c`
   in wave 1 across 3 families; the cohort behaves exactly as brief 300
   predicted (simple-dominated, all-matched-callee reachable). The scaffolder
   can sustain this stream in parallel with the ov002 decomper, collision-free.
2. **The dispatch family is the lever.** 5 members from one recipe (swap two
   globals); ov006's state machines almost certainly hold more — a mechanical
   wave-2 target. Same for the 5-iter-pass family.
3. **Coordinate the ov006 matched-set.** 3 of this session's clean verifies
   (`021b2b08`/`021b2c9c`/`021b56d8`) were already matched on the branch — the
   scaffolder should pull the latest `delinks.txt` and subtract the
   already-matched set before wave 2 to avoid rework.
4. **Run the 3-region SHA1 on merge.** The per-pick gate here is EUR objdiff
   only; confirm USA/JPN reproduce (these are EUR-baseline `.c`, no region
   port) before counting them toward `complete_units`.

## Cross-references

- `docs/research/brief-300-ov006-premap.md` — the ov006 census + family
  clustering this wave executes against.
- `docs/research/brief-302-global-asm-mode.md` — the completed toolkit (C /
  canonicalisation-`.s` / whole-`.s`); this wave is pure C.
- `src/overlay006/ov006_core.h` — the ov006 vocabulary header (promoted from
  `docs/research/` this brief; owned by the scaffolder).
