[//]: # (markdownlint-disable MD013 MD041)

# Brief 240 — C-42 second drain wave (partial; reg-alloc divergence surfaced)

**Brief:** 240 (decomper). Target 40-60 ships at 85%+ C-yield via
brief 239's sub-shape histogram (A3 single-bl-plain, 189 picks first).

## Headline

**8 .c ships → hard-tier 8.52% → 8.62%** (681/8351, +8). Far below
brief target. C-yield 8/15 = 53% (below 85% target).

**Halted per brief guidance** ("stop and surface to brief 242 if a
sub-shape produces repeat escapes within a single brain session").

The repeat escape pattern across the C-42 cohort surfaced as a
**register-allocation divergence**: mwcc 2.0/sp1p5 picks r1 for
free-scratch where the orig used r2 (or vice versa). This isn't
controllable from natural C source — declaring extra args, changing
struct layouts, and using different return types don't shift mwcc's
allocation order.

## 8 shipped picks

All `src/main/`:

| Addr | Size | Shape | Notes |
|------|---:|-------|-------|
| `02038958` | 0x2c | sign-clamp + helper + u16-shift | `if (n <= 1) return 0; return (n * (u16)h()) >> 16;` |
| `0204fc9c` | 0x24 | helper-returns-ptr + byte-check + helper | `if (h()[424] == 2) return 2; return h2(self);` |
| `02057d2c` | 0x30 | 3-arg pass-through + helper-result append | `int r = h(c); helper2(a, b, c, r);` |
| `02058070` | 0x30 | sibling of 02057d2c (different helper2) | |
| `020643ac` | 0x2c | null-check helper + helper with literals | `if (!h()) return 0; return h2(self, 1, 4);` |
| `02068b94` | 0x24 | deref + helper(field) + zero + helper(p) | `func1(p->f24); p->f24 = 0; func2(p);` |
| `0207f8a0` | 0x28 | memset-style + 2 field writes | `helper(0, &self->f4, 24); self->f4 = self->f8 = 4096;` |
| `02088518` | 0x28 | null-check + helper(field) + 2 zero-writes | `if (!self->f44) return; h(self->f44); self->f44 = self->f48 = 0;` |

## The escape pattern — register-allocation divergence

### Symptom

The shipped .c emits the SAME instruction sequence (same opcodes,
same operands, same flow) but uses **different scratch registers**
than orig. SHA1 catches the byte diff even though the function is
semantically and structurally identical.

### Sample: pick `func_ov002_021f9954` (tag6 shape, deferred)

**Orig disasm**:

```asm
push  {r3, lr}
ldrh  r2, [r0, #2]       ; r2 = self->f2 raw
lsl   r2, r2, #20
lsr   r2, r2, #26        ; r2 = tag6
cmp   r2, #2
movne r0, #1
popne {r3, pc}
bl    func_ov002_021f9434
pop   {r3, pc}
```

**My compile** (same source, mwcc 2.0/sp1p5):

```asm
push  {r3, lr}
ldrh  r1, [r0, #2]       ; r1 not r2!
lsl   r1, r1, #20
lsr   r1, r1, #26
cmp   r1, #2
movne r0, #1
popne {r3, pc}
bl    func_ov002_021f9434
pop   {r3, pc}
```

Identical instructions, identical control flow. Only the
**register choice for the bitfield temp** differs (r1 vs r2). Both
are valid (r1 and r2 are scratch in AAPCS), but the orig
deterministically picked r2.

### Patterns that hit this escape

1. **tag6-check + helper** (5+ picks deferred): orig uses r2 for
   tag6 extract; my compile uses r1.
2. **Pool-data + global write** (021aea58 etc.): orig uses different
   reg for the data pointer.
3. **Helper-returns-ptr + field write** (022301a8): orig uses r2 as
   intermediate; my compile uses r1.
4. **`stmfd; sub sp, #4` prologue** (02087d2c cluster, 6+ picks):
   orig has `push {lr}; sub sp, #4` (8-byte align); mwcc emits
   `push {r3, lr}` (8-byte align via r3 scratch save).

All four are recurring across the 510 unshipped C-42 picks. Filing
this collectively as a **brief 242 scaffolder candidate**: investigate
whether a source-side knob (function attribute, arg-count, return
type) shifts mwcc's register choice deterministically.

### What I tried (didn't work)

- Adding `int unused` second arg to force r1 use → mwcc still
  alloc-orders r1 first for the bitfield temp
- Using `unsigned int *p` + `*(p + N)` instead of struct → same alloc
- Using `extern char data[]` form (gotcha 2) → reduced one
  divergence but the OTHER reg in the same function still differs

The picks that DID ship were ones where:
- Function has 2+ explicit args (forcing r1, r2 in use)
- No bitfield extract (no free scratch reg picked deterministically)
- Pool slot consumed in a way that hints at register order

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **8.52% → 8.62%** (681/8351, +8) |

## Recommendation for brief 242

The C-42 cohort needs **register-allocation hint research**. Possible
directions:

1. Investigate `-inline auto` / `-inline noauto` impact on alloc
2. Try `restrict`-qualified pointers or `volatile` placement
3. Survey existing matched C-42 picks for source patterns that
   produce the orig's deterministic alloc choice
4. Build a per-function-shape recipe library that documents
   "use signature SIG to force orig's reg choice"

Without this, the ~500 remaining unshipped C-42 picks will continue
to escape at the 50% rate observed in this wave.

## Cross-references

- `docs/research/brief-237-hard-tier-landscape-survey.md` — C-42 classification
- `docs/research/brief-238-c42-drain-wave1.md` — first drain (30 ships, 81% C-yield)
- `docs/research/brief-239-c39e-sub-c42-audit-gotchas.md` — sub-shape histogram + recipe gotchas
- `docs/research/recipe-gotchas.md` — 6 documented gotchas
- `docs/research/codegen-walls.md` § C-42 — taxonomy entry
