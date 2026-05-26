# Brief 218 — Wall 1 broader + brief 214 Shape B verdict

**Brief:** 218 (scaffolder, two investigations). Resolve two
empirical questions surfaced by brief 217's drain.

## Headline

**Investigation A (Wall 1 broader)**: extends P-4
("r2-vs-r3 scratch register selection on swap-shape thunks"
→ now "Tiny-thunk reg-allocator divergence"). Brief 217's
finding (`func_ov002_021b4254` — non-swap pool-load tail-call)
fits the SAME P-4 family. 12-variant matrix run across all 5
mwccarm tiers — none reach orig while preserving the
function's 5-insn shape. Confirmed **permanent** under current
toolchain.

**Investigation B (Shape B verdict)**: ⚠️ **brief 214's
Shape B claim WAS wrong, but a NEW recipe DOES work** —
a **bitfield struct read** of the low byte under the default
`mwcc 2.0/sp1p5` tier reaches orig bytes byte-for-byte. Both
canary picks (`func_ov000_021ab6cc`, `_021af5c0`) shipped as
plain `.c` files.

## Investigation A — Wall 1 broader

### Canaries (4 picks)

- `func_0207842c` (brief 215, swap shape)
- `func_02078444` (brief 215, swap shape)
- `func_ov002_0229cd70` (brief 215, swap shape)
- `func_ov002_021b4254` (brief 217, non-swap pool-load)

All 4 ship as `.s` in current main.

### Mechanism (recap)

**Swap shape:** orig emits

```
ldr   ip, .pool
mov   r3, r0          ; r3 as swap temp
mov   r0, r1
mov   r1, r3
bx    ip
```

mwcc 2.0 (and all other tiers) emit

```
ldr   ip, .pool
mov   r2, r0          ; r2 as swap temp instead
mov   r0, r1
mov   r1, r2
bx    ip
```

Same shape (5 insns, 20 bytes), only the spill register byte
differs (r2 vs r3).

**Pool-load shape (brief 217 finding):** orig emits

```
ldr   r2, .pool       ; r2 as data pointer
lsl   r0, r0, #2
ldr   ip, .pool
ldrh  r0, [r2, r0]
bx    ip
```

mwcc 2.0 (and all other tiers) emit

```
ldr   r1, .pool       ; r1 as data pointer instead
lsl   r0, r0, #2
ldr   ip, .pool
ldrh  r0, [r1, r0]
bx    ip
```

Same shape (5 insns, 24 bytes), only the data-ptr register byte
differs (r1 vs r2). Same family as swap-shape: mwcc picks the
lowest-numbered free register, orig picks one higher.

### Variant matrix (brief 218)

12 source-form variants × 5 mwccarm tiers. See P-4 entry in
`codegen-walls.md` for the full list. Summary: zero variants
reach the orig register choice while keeping the 5-insn shape.

The closest near-misses:

- **Function-pointer indirection** (`extern fn_t fp; fp(b, a)`):
  mwcc DOES use r3 for the swap temp, but adds 6 extra
  instructions for the indirect load + non-leaf frame. Function
  size grows from 20 B to ~36 B. Different overall shape.
- **2nd arg used in expression** (`return target(...) + extra`):
  mwcc keeps r1 live for `extra`, picks r2 for the data ptr
  (matching orig's register choice on the broader pool-load
  shape!), but the function body grows by 4+ insns for a stack
  frame + add. Different overall shape.

Neither near-miss byte-matches orig — they're informative for
the mechanism (mwcc picks the lowest free register, so making
the lower register busy DOES shift allocation upward) but they
don't constitute a recipe.

### Verdict: Permanent (P-4 extended)

Brief 218 extends the existing P-4 entry in `codegen-walls.md`
with:

- The brief 217 broader sub-shape (`func_ov002_021b4254`).
- Six additional variant rows in the falsification matrix
  (register storage-class, asm bindings, clobber lists, dead-
  code locals, fnptr indirection, 2nd-arg-live).
- Provenance trail for the 12-variant exercise.

**Affected drops** unchanged: 7 of 80+ (~9%) across swap-thunk,
fnptr-cache, and pool-load tail-call sub-shapes.

No worked example shipped (P-N walls keep their `.s` ships).

## Investigation B — Shape B verdict (BIG REVERSAL)

### Setup

Brief 214 documented the byte-low-zero idiom (Shape B) as
reachable in principle but never shipped a worked example.
Brief 217 retested on the two known Shape B picks
(`func_ov000_021ab6cc`, `_021af5c0`) and reported the recipe
failed: all mwcc tiers collapse to `ands r0, r0, #0xff`
(20-byte shape) instead of orig's 28-byte `lsl #24 / lsrs #24`
shape.

### Brief 218 retest with actual struct context

Brief 217's testing used a stripped snippet
(`extern int *gptr; gptr[0x16];`). Brief 218 retested with
the actual symbol bindings (`extern data_ov000_021c7530[]`
and `data_ov000_021c758c[]`) and the actual struct
declarations.

Most variants still collapse to `ands #0xff` (brief 217
confirmed). But ONE variant reaches orig:

```c
struct LowByteStruct {
    unsigned int low8 : 8;
    unsigned int upper : 24;
};

extern struct LowByteStruct data_ov000_021c7530[];

int func_ov000_021ab6cc(void) {
    return data_ov000_021c7530[0x58 / 4].low8 == 0;
}
```

mwccarm 2.0/sp1p5 emits:

```
e59f0014  ldr   r0, [pc, #20]
e5900058  ldr   r0, [r0, #0x58]
e1a00c00  mov   r0, r0, lsl #24
e1b00c20  movs  r0, r0, lsr #24
03a00001  moveq r0, #1
13a00000  movne r0, #0
e12fff1e  bx    lr
```

**Byte-identical to orig.** Same recipe applied verbatim to
`func_ov000_021af5c0` (offset 0x34 instead of 0x58) — also
byte-identical to orig.

### Why bitfield works

mwcc 2.0/sp1p5's `(unsigned)x << 24 >> 24` peephole recognises
the shift pair as a byte mask and folds to `ands r0, r0, #0xff`.
The bitfield read goes through a different code path: the
compiler emits the canonical bitfield-extract sequence
(`lsl #24; lsrs #24` for an `unsigned : 8` field at the low
end), and that sequence doesn't go through the mask peephole.

Brief 214's `if (t != 0u) return 0; return 1;` didn't help
because the peephole fires earlier in the lowering pipeline
(during shift-pair recognition), before the comparison
structure is established. Brief 214's "32-byte shape" claim
appears to have been a mis-measurement (possibly counting
function size INCLUDING an internal pool word, when the orig
function size excludes the pool word).

### Tier-specific behaviour

Only **mwcc 2.0** emits `lsl #24; lsrs #24` for the bitfield
read. mwcc 1.2/sp* family emits `ldrb` (mwcc 1.2 has a
bitfield-byte-low-load peephole). So this recipe ships as
plain `.c` (default 2.0/sp1p5 tier), not `.legacy.c`.

### Shipped (brief 218)

- `src/overlay000/func_ov000_021ab6cc.c` — NEW (replaces
  the `.s` brief 217 shipped).
- `src/overlay000/func_ov000_021af5c0.c` — NEW (replaces
  the `.s` brief 217 shipped).

### Notes for the C-37 detector

The existing C-37 detector in `tools/predict_walls.py` flags
the `lsl/lsrs #24` byte-zero shape correctly — both picks
fire C-37 from disasm. The brief 218 bitfield recipe is the
remediation, not a new detector trigger. No predict_walls
changes needed.

## Verification

- 3-region SHA1 PASS preserved (EUR with new `.c` files; USA
  + JPN unaffected — these picks only exist in EUR ov000).
- `python -m unittest discover tests` clean.
- `python -m ruff check tools/ tests/` clean.
- `docs/research/codegen-walls.md` P-4 entry extended.
- `docs/research/bit-test-0-or-1-idiom.md` § Shape B updated.

## What didn't make it (sibling pickups)

The brief mentioned brief 216's 3 deferred canaries
(`func_0207d304`, `func_02078ed8`, `func_02078eec`) as a
drive-by if time permitted. Brief 218 spent the available
budget on the primary + secondary investigations; deferred
canaries punted to brief 219+ scaffolder lane.

## Cross-references

- `docs/research/bit-test-0-or-1-idiom.md` — Shape A + Shape B
  recipes (Shape B updated by brief 218).
- `docs/research/codegen-walls.md` § P-4 — Tiny-thunk reg-
  allocator divergence (extended by brief 218).
- `docs/research/wall-2-leaf-no-pool-reg-alloc.md` — brief 216
  precedent for the variant-matrix methodology.
- Brief 215 (PR #671) — surfaced Wall 1 swap shape.
- Brief 217 (PR #675) — surfaced Wall 1 broader sub-shape +
  falsified brief 214's Shape B claim.
