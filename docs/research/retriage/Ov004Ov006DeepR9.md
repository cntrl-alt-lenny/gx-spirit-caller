[//]: # (markdownlint-disable MD013 MD041)

# ov004 / ov006 Deep Re-triage (R9)

Round 9 is the 4th pass on overlay004 and overlay006's residual hard tier,
following R4 (`OverlayEFRetriage.md`, 8 ov006 + 4 ov004), R6
(`Ov004Ov006Deep.md`, 24 new ov006 + 20 new ov004), and R8
(`Ov004Ov006DeepR8.md`, 15 new ov006 + 15 new ov004, 100% hit rate on both
overlays). This round examined 19 new ov004 addresses (54 residual → 35 left
after this pass) and 20 new ov006 addresses (51 residual → 31 left after this
pass), all confirmed virgin — none appears as a primary subject in any prior
retriage doc, and all 39 `.s` files were confirmed to still exist unflipped
before analysis began.

KB docs referenced: `docs/research/data/Ov004Ov006DataTables.md` (primary
struct/data table catalog — ov004 Categories 1-6 incl. veneer blobs, AES
tables, Cluster B/C rodata chunks and string-label family; ov006 Types A-D
animation/record tables), `docs/research/constants/OverlayConstants.md`
(ov004 `Ov004Phase` enum, `OV004_TOAST_*` IDs, touch-region bounds, struct-init
literals; ov006 `Ov006SubState` enum, full-init VRAM/2D-engine constants,
stride-table constants), `docs/research/constants/OverlayConstantsExtended.md`
(smull magic-divide reciprocals — 0x66666667=÷10 confirmed reused at least
twice more in this batch), `docs/research/retriage/Ov004Ov006Deep.md` (R6 —
carried forward the "b500"/`data_021040ac`/`data_02104f4c` struct families,
the slot-base 5-way address-resolver idiom, and the init-family/stride-table
recipes), `docs/research/retriage/Ov004Ov006DeepR8.md` (R8 — the ~3,100-line
doc documenting the `func_02021660`/`func_020216b0` OBJ-attribute-setter
idiom pervasive across ov006's battle-animation family, the ov004 b500 "trade
session" field cluster at `+0xc0c..+0xca0`, and 15+15 fully-worked C
recipes whose struct knowledge carries forward directly), plus the map docs
`docs/research/map/overlay004.md`/`_names_overlay004.md` and
`docs/research/map/overlay006.md`/`_names_overlay006.md` (name-proposal
cross-checks — every one of the 39 targets below already has an independent
map-doc name proposal, a strong tractability signal per R8's methodology),
and `docs/research/dossiers/021c9c54.md` / `docs/research/dossiers-high/`
(individual per-function dossiers cited inline where they resolved a
specific callee's behavior).

Three ov006 addresses (`021b6e3c`, `021b70fc`, `021b81dc`) carried a stale
R6-era **WALL**/**BORDERLINE** verdict at byte counts wildly smaller than
this round's ground truth (e.g. R6 estimated `021b81dc` at ~100 B; ground
truth is 320 B). Per the task brief these were re-examined completely fresh
rather than inherited, and all three flip to full **TRACTABLE** — reconfirming
R8's core finding that pre-ground-truth byte counts from early map-generation
passes were frequently unreliable, and that size alone never predicted
difficulty once the struct/data/constant KB existed. One ov004 address
(`021c9dd4`) carried a similar stale R6 WALL ("RGB blend, 9 saved regs" at an
estimated ~82 B); ground truth is 280 B, and it also flips to TRACTABLE
(risk-noted) — R8's own recipe sketch for a *different*, already-matched
function (`021cda8c`) already called this one by name (`Ov004_RGBBlend`),
independently corroborating today's fresh read.

---

## Summary

| Overlay | Examined | Tractable (clean) | Tractable (risk-noted) | Wall | Already-matched |
|---------|----------|--------------------|--------------------------|------|------------------|
| ov004   | 19       | 12                 | 7                         | 1 (soft/adjacent) | 0 |
| ov006   | 20       | 17                 | 3                         | 0    | 0                |
| **TOTAL** | **39** | **29**             | **10**                    | **1**| **0**            |

**Combined: 39 examined, 38 tractable (29 clean + 10 risk-noted) = 97.4%, 1
wall-adjacent.** This matches R8's near-100% hit rate for both overlays. Every
"risk-noted" entry is still a valid tractable classification — the KB fully
resolves what the function does and every data/call dependency, but the
assembly shows register-pressure or post-call liveness patterns that will
likely need a register-reuse lever, reshape pass, or (in two explicitly
flagged permuter-class cases) the permuter itself to close an exact byte
match. The single wall entry (`021d38c4`, ov004) is not a genuine scheduling
wall either — it is downgraded from a confident TRACTABLE only because a
specific indirect data table (`+0x350` off a stream-context pointer) could
not be fully traced to a symbol within this batch alone; see the writeup
below for the concrete missing link.

---

## ov004 — Tractable functions (15 clean + 3 risk-noted)

### 0x021D705C (188 B, class E, overlay=ov004)

**Original verdict:** E — "counted loop but heavy field-pack + reg-alloc"

**Verdict: TRACTABLE (risk-noted)**

**Upgrade reason:** No data-globals at all — the entire body is closed-form
fixed-point arithmetic feeding a single already-documented callee,
`func_02005dac` (the `SetBldAlpha`/BLDALPHA-packer used throughout
`021ce1ec`/`021cd3b4` in R8). The loop bound is `(stack_arg)` derived
purely from an incoming argument via the standard signed-divide-by-32
idiom (`asr#4`/`lsr#0x1b`/`asr#5` sign-correct chain) — fully deterministic,
no branch-table or unresolvable discriminant. This function's instruction
stream is **byte-for-byte identical** to `021da100` below (confirmed by a
direct diff of both `.s` bodies — only the internal branch-target label
differs, a pure assembler artifact of address). Map doc corroborates:
`Ov004_DrawRemoteIcons`.

**Struct/data dependencies:** None — no named globals, no struct-offset
access at all. All state is local (one stack arg, registers).

**Ground-truth pool words:** none (no literal pool).

**Ground-truth BL targets (verbatim, in call order):**

```
func_02005dac   (x1, inside the bounded loop)
```

**C sketch:**

```c
/* args: r0=base_id, r1=color(low byte used), r2=row_mul, r3=extra;
   stack[0x30] = raw_value used for loop-bound + phase calc */
void func_ov004_021d705c(int base_id, int color, int row_mul, int extra, int raw_value) {
    int v = raw_value;
    int bound = (v >> 4) + ((unsigned)v >> 0x1b);
    bound >>= 5;                                     /* signed /32, rounding */
    if (bound <= 0) return;

    int base = ((color * v) << 4);
    base = (base + (base >> 31)) >> 1;               /* signed /2, rounding */
    int packed_hi = (color & 0xff) | 0x4000 | 0x80000000;
    int phase = 0;
    int row_base = base + 0xc80;
    int cursor = 2;

    for (int i = 0; i < bound; i++) {
        int p0 = (phase + (phase >> 31)) >> 1;
        int y = row_base + p0;
        int y2 = (y + (y >> 25)) >> 6;
        int hi = (base_id << 23);
        int packed_a = packed_hi | (hi >> 7);
        int y3 = (y2 + (y2 >> 25)) >> 7;
        int packed_b = (y3 | 0x800) | (extra << 12);

        void *slot = func_02005dac(cursor, 0, packed_a, packed_b);
        *(int *)slot        = packed_a;
        *(short *)(slot + 4) = (short)packed_b;

        base_id += 0x20;
        phase   += 0x200;
    }
}
```

**Match-difficulty risk note:** 9 of 10 callee-saved registers stay live
across the single `bl func_02005dac` inside the loop — the shift/rounding
chain is the standard mwcc `(x + (x>>N)) >> shift` signed-divide idiom and
should reproduce directly, but the register pressure makes a first-try exact
match unlikely; expect a call-result-bound-to-temp reshape pass (per the
`mwcc-register-reuse-recipe`), possibly permuter-class rotation similar to
`021c9dd4` below. Solve alongside `021da100` (its byte-identical twin) as a
pair.

---

### 0x021DA100 (188 B, class E, overlay=ov004)

**Original verdict:** E — "counted loop but heavy field-pack + reg-alloc"

**Verdict: TRACTABLE (risk-noted)** — identical body to `021d705c` above.

**Upgrade reason:** Byte-for-byte identical instruction stream to `021d705c`
(every opcode and operand matches save the internal label numbering). Map
doc independently names it `Ov004_DrawFrameBorderB`, "sibling of 021cb778" —
consistent with two call sites of the same panel-draw-helper family already
seen duplicated with zero literal drift elsewhere in this codebase (a
stronger duplicate signal than R8's `021cdd38`/`021cfc64` pair, which at
least differed in constants).

**Struct/data dependencies:** None (same as `021d705c`).

**Ground-truth pool words:** none.

**Ground-truth BL targets:** `func_02005dac` (x1, inside the loop).

**C sketch:** Identical to `021d705c`'s sketch (function name substituted).

**Match-difficulty risk note:** Same as `021d705c`. Given the two bodies are
byte-identical, the practical plan is: solve one, verify via objdiff that the
other compiles to the same hex from the same (or symmetrically equivalent)
C — this may turn out to be two call sites of one shared non-static helper
rather than two independent definitions.

---

### 0x021D3A7C (248 B, class E, overlay=ov004)

**Original verdict:** E — "caller-saved rotation, stack-arg passing, sign
branches"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_FormatDisplayStr` ("format
512-byte string into rec+80, called by 021d3b74"). Ground truth is a clean
2×2 dispatch: an early-return gate on `func_ov004_021c9d60`'s result (already
fully documented — `OV004_VOICE_SE_BASE`/`OV004_VOICE_SE_COUNT`,
`OverlayConstants.md`) feeding a `magnitude >= 10000` split that selects one
of two format-helper call sites (`func_0209150c`) with different pointer-table
args. The "sign branches" the heuristic flagged is simply `rsblt r6,r6,#0` —
a deterministic `abs()` on the count argument.

**Struct/data dependencies:**
- `data_ov004_02209f74` / `data_ov004_02209f80` — pointer-table args to
  `func_0209150c` (already catalogued in `Ov004Ov006DataTables.md` Category 5
  string/pointer-array family; this function is a confirmed live consumer).

**Ground-truth pool words (verbatim):**

```
0x00002710             ; 10000 decimal — magnitude threshold
data_ov004_02209f74
data_ov004_02209f80
0x0000064d             ; 1613 decimal — string-table ID passed to func_0202c0c0
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov004_021c9d60
func_0202c0c0        (conditional, only when the id-arg is zero entering the voice-ok branch)
func_0209150c         (one of two call sites, mutually exclusive per branch)
```

**C sketch:**

```c
/* args: r0=buf, r1=len, r2=count, r3=fmt_flag;
   stack[0x18]=extra_a, stack[0x1c]=str_id_or_zero */
void func_ov004_021d3a7c(char *buf, int len, int count, int fmt_flag,
                          int extra_a, int str_id_or_zero) {
    int voice_ok = func_ov004_021c9d60(extra_a, fmt_flag);
    int magnitude = count;
    if (magnitude < 0) magnitude = -magnitude;

    if (voice_ok == 0) {
        if (magnitude < 10000) {
            int off = func_0209150c(buf, len - 1, data_ov004_02209f80);
            buf[off] = 0;
        } else {
            int off = func_0209150c(buf, len - 1, data_ov004_02209f74, count);
            buf[off] = 0;
        }
        return;
    }

    int str_id = str_id_or_zero;
    if (str_id == 0) str_id = (int)func_0202c0c0(0x64d);
    if (str_id == 0) return;

    if (magnitude < 10000) {
        int off = func_0209150c(buf, len - 1, data_ov004_02209f80, str_id);
        buf[off] = 0;
    } else {
        int off = func_0209150c(buf, len - 1, data_ov004_02209f74, str_id, count);
        buf[off] = 0;
    }
}
```

Note: `func_0209150c`'s exact positional-arg signature needs objdiff
confirmation; the branch structure and every callee identity is unambiguous
from the `.s`.

---

### 0x021D0E98 (256 B, class F, overlay=ov004)

**Original verdict:** F — "loop body heavy reg-alloc, scaling, 10 regs"

**Verdict: TRACTABLE (risk-noted)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawSessionState`. A fixed
2-iteration loop reading the already-documented 3-bit language-ID idiom off
`data_02104f4c+0x4` (`lsl#0x1d/lsr#0x1d`, confirmed across R6/R7/R8) feeding
`func_02001d68`, followed by VRAM-bank palette clears
(`Vram_GetBankBaseE`+`func_02094504`) and a conditional text-render block
using the `data_02102c90` `GlobalData02102c7c` cluster — the exact idiom
already fully catalogued in R8's `021cdd38`/`021cfc64`/`021ce4a8` entries.

**Struct/data dependencies:**
- `data_02104f4c+0x4` — language-ID 3-bit field (documented idiom).
- `data_02102c90` — text-render context cluster (documented, R8).

**Ground-truth pool words (verbatim):**

```
data_02104f4c
data_02102c90
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02001d68
func_02001d0c
Vram_GetBankBaseE     (x2 per iteration, x2 iterations = 4 total)
func_02094504          (x1 per iteration = 2 total)
func_0202c0c0             (conditional, x1 per iteration)
func_020054a4
func_02004f58
func_0208e1ac
func_02001e94
```

**C sketch:**

```c
void func_ov004_021d0e98(int sl_arg) {
    int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    func_02001d68(lang);
    func_02001d0c(data_02102c90, 0xa, 3);

    int bank = 0xf1, phase = 0;
    for (int i = 0; i < 2; i++, bank += 0x1e, phase += 0xb) {
        void *vbase = Vram_GetBankBaseE();
        func_02094504(0, vbase + (bank << 5), 0x3c0);

        if (sl_arg != 0) {
            char *name = func_0202c0c0(i + 0x1d);
            void *vbase2 = Vram_GetBankBaseE();
            int w = func_020054a4(name, 0xc);
            int off = (w + (w >> 0x1f)) >> 1;
            int col = (i == 0 ? 3 : 0) + (0x28 - off);
            func_02004f58(data_02102c90, name, vbase2 + (bank << 5), col, 0xc);

            void *e = func_0208e1ac();
            u16 *dst = (u16 *)((u8 *)e + 0x4a + 0x400 + phase * 2);
            func_02001e94(data_02102c90, dst, bank, 1);
        }
    }
}
```

**Match-difficulty risk note:** 10 callee-saved regs pushed, with the
boolean arg, `data_02102c90`, and two loop accumulators all live across
`Vram_GetBankBaseE`'s two calls per iteration. Same register-pressure shape
already proven tractable in R8's `021cdd38`/`021cfc64` pair — expect a
similar reshape (bind the width-measurement result to an explicit temp)
rather than a genuine wall.

---

### 0x021C9DD4 (280 B, class F, overlay=ov004) — re-examined, was stale WALL in R6

**Original verdict:** F — "pixel-blend mul/shift, register-heavy liveness"
(R6's `Ov004Ov006Deep.md` marked this **WALL** at a stale ~82-byte estimate,
"RGB blend, 9 saved regs" — re-examined fresh per this round's brief.)

**Verdict: TRACTABLE (risk-noted)** — **upgraded from R6's WALL verdict.**

**Upgrade reason:** 280 bytes is the correct ground truth (82 B was a
map-generation-era miscount, exactly the class of error R8's methodology
found and corrected elsewhere). This is a fully closed-form RGB555
alpha-blend kernel: zero `bl`/`blx` calls, and the only external reference is
a single load from `data_021040ac+0x38` (a 6-bit blend-alpha scalar). Both
branches (`alpha<0x20` vs `>=0x20`) are a deterministic two-sided
linear-interpolation-blend split, not an unresolvable discriminant. R8's own
recipe sketch for `021cda8c` (a different, already-matched function)
independently calls this exact function `Ov004_RGBBlend` with args
`(dst, 0x05000638, 4, 0x00600100)` — R8 arrived at the same "this is a blend
primitive" conclusion as a side effect of documenting its caller, without
ever seeing R6's WALL flag. Map doc corroborates: `Ov004_BlendPixels`.

**Struct/data dependencies:**
- `data_021040ac+0x38` — read once at entry, `alpha = value & 0x3f`. This
  exact offset is **not** in any of the 4 primary KB docs (flagged below);
  its role here is unambiguous (6-bit alpha/blend value).

**Ground-truth pool words:** `data_021040ac` (single pool word).

**Ground-truth BL targets:** none — zero calls.

**C sketch:**

```c
/* r0=dst(u16*), r1=src(u16*), r2=count */
void func_ov004_021c9dd4(u16 *dst, const u16 *src, int count) {
    if (count <= 0) return;

    int alpha = data_021040ac.f38 & 0x3f;
    int inv_alpha = 0x40 - alpha;
    int mul = (alpha < 0x20) ? alpha : inv_alpha;

    for (int i = 0; i < count; i++) {
        u16 px = src[i];
        int b  = px & 0x1f;
        int rr = (px >> 5) & 0x1f;
        int gg = (px >> 10) & 0x1f;

        int c0 = (0x1f - b)  * mul; c0 = (c0 + (c0 >> 27)) >> 5; int ch0 = b  + c0;
        int c1 = (0x1f - rr) * mul; c1 = (c1 + (c1 >> 27)) >> 5; int ch1 = rr + c1;
        int c2 = (0x1f - gg) * mul; c2 = (c2 + (c2 >> 27)) >> 5; int ch2 = gg + c2;

        if (ch0 > 0x1f) ch0 = 0x1f;
        if (ch1 > 0x1f) ch1 = 0x1f;
        if (ch2 > 0x1f) ch2 = 0x1f;

        dst[i] = ch0 | (ch1 << 5) | (ch2 << 10);
    }
}
```

**Match-difficulty risk note:** 8 caller-saved regs are live simultaneously
through the per-pixel unrolled channel math with no `bl` calls to serve as
natural register-pressure release points — a genuine permuter-class
register-rotation risk (the same pattern R6 flagged generically as "9 saved
regs," now understood as tractable-but-risky rather than a wall). Recommend
the mwcc register-reuse recipe (minimal if-assign for the alpha/inv_alpha
selection, explicit per-channel temps) before falling back to permuter; since
it has zero calls, it is a cleaner permuter target than most of this batch
(no call-boundary scheduling interacts with the reg-alloc).

---

### 0x021DB874 (288 B, class F, overlay=ov004)

**Original verdict:** F — "char-encoding state machine, mla, many branch
arms"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawStreamStats`. Not
actually a state machine over unknown input — it is a deterministic
byte-oriented Shift-JIS decoder: single-byte ASCII pass-through, a half-width
katakana remap (`0xa0..0xdf`), a two-byte lead/trail decode via a lookup
table with bounds checks, and a fallback echo. Every branch target is
reachable purely from input byte-value ranges — a fully enumerable
character-decode dispatcher, not scheduling entropy. `data_ov004_02200f18`
resolves `Ov004Ov006DataTables.md`'s own Category-4 "follow-up range, not
sampled" placeholder for that exact address.

**Struct/data dependencies:**
- `data_ov004_02200f18` — u16-indexed Shift-JIS decode table, capped at
  `0x2c10` entries. This resolves the Category-4 catalog's own
  not-yet-sampled placeholder for this address.

**Ground-truth pool words (verbatim):**

```
data_ov004_02200f18
0x00002c10
```

**Ground-truth BL targets:** none — zero calls.

**C sketch:**

```c
int func_ov004_021db874(const char *src, u16 *dst) {
    int out_i = 0, in_i = 0;
    unsigned char lead0 = src[0];
    if (lead0 == 0) goto done;

    do {
        unsigned char b = (unsigned char)src[in_i];
        if (b < 0x80) {
            dst[out_i++] = b;
        } else if (b >= 0xa0 && b <= 0xdf) {
            dst[out_i++] = 0xff00 | ((b - 0x40) & 0xff);
        } else if (b <= 0xfc) {
            unsigned char b2 = (unsigned char)src[in_i + 1];
            if (b2 >= 0x40 && b2 <= 0xfc) {
                int lead_idx = (b >= 0xe0) ? (b - 0xc1) : (b - 0x81);
                int lead_val = lead_idx * (b >= 0xe0 ? 0x3f : 0xbc);
                int trail_off = (b2 >= 0x80) ? (b2 - 0x41) : (b2 - 0x40);
                int idx = lead_val + trail_off;
                u16 v = (idx < 0x2c10) ? ((u16 *)data_ov004_02200f18)[idx] : 0;
                dst[out_i++] = (v == 0) ? 0x3f : v;
                in_i++;
            } else {
                dst[out_i++] = lead0;   /* fallback: echoes the FIRST byte of the whole string */
            }
        } else {
            dst[out_i++] = lead0;
        }
        in_i++;
    } while (src[in_i] != 0);

done:
    dst[out_i] = 0;
    return out_i + 1;
}
```

Note: the fallback path stores the original first-byte value (`r2`, set once
at entry, never updated) rather than the current byte — a genuine quirk of
the original assembly, not a transcription choice. Flagged for objdiff
attention but does not block tractability — it is a deterministic, fixed
register read.

---

### 0x021D7440 (292 B, class F, overlay=ov004)

**Original verdict:** F — "loop + cascading discriminant guard-chain, many
calls"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawRemoteHand`, "called by
021d7f2c." The "cascading discriminant guard-chain" is four independent
`if (kind < 0 || kind == N)` gates in sequence (not a single complex
discriminant), each deciding whether to run its own draw call. Every call
resolves to already-named siblings: `func_0202c0c0` and
`func_ov004_021d6f20` (this doc's own entry #9 below — itself tractable).

**Struct/data dependencies:**
- `data_ov004_0220b500` (b500) — `+0xc94`/`+0xc98`/`+0xc9c`/`+0xca0` (4
  sequential trade-record-name-source fields, part of the `+0xc0c..+0xca0`
  cluster already touched by `021d1118`/`021d0f98` below and R6's
  `021cb290`).
- `data_021040ac+0x34` — new offset, read only on the gate-2 fallback path
  (see New KB gaps).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500
data_021040ac
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202c0c0        (x5, inside setup loop — one per i in 0..4)
func_ov004_021d6f20   (x5, inside setup loop, paired 1:1 with above)
func_0202c0c0            (gate 1)
func_ov004_021d6f20       (gate 1)
func_0202c0c0                (gate 2)
func_ov004_021d6f20           (gate 2)
func_0202c0c0                    (gate 3)
func_ov004_021d6f20               (gate 3)
func_0202c0c0                        (gate 4)
func_ov004_021d6f20                   (gate 4)
```

**C sketch:**

```c
void func_ov004_021d7440(int kind) {
    if (kind < 0) {
        for (int i = 0; i < 5; i++) {
            char *name = func_0202c0c0(i + 0x3d4);
            func_ov004_021d6f20(i, name, 0x80);
        }
    }

    if (kind < 0 || kind != 0) {
        char *name = func_0202c0c0(data_ov004_0220b500.fc94 + 0xd9 + 0x300);
        func_ov004_021d6f20(5, name, 0x80);
    }

    if (kind < 0 || kind == 1) {
        int val = data_ov004_0220b500.fc98;
        int id = (val != 0) ? 3 : (data_021040ac.f34 + 0xdb + 0x300);
        char *name = func_0202c0c0(id);
        func_ov004_021d6f20(6, name, 0x80);
    }

    if (kind < 0 || kind == 2) {
        char *name = func_0202c0c0(data_ov004_0220b500.fc9c + 0xdf + 0x300);
        func_ov004_021d6f20(7, name, 0x80);
    }

    if (kind >= 0 && kind == 3) return;

    char *name = func_0202c0c0(data_ov004_0220b500.fca0 + 0xe1 + 0x300);
    func_ov004_021d6f20(8, name, 0x80);
}
```

Note: in gate 2, the `val` compute appears to only serve as the branch test
— `movne r0,#0x3` unconditionally overwrites `r0` to the literal 3 in the
nonzero case rather than reusing `val`. The sketch above reflects ground
truth; worth a double-check against objdiff since it reads unusually.

---

### 0x021CB63C (316 B, class F, overlay=ov004) — map-doc label discrepancy flagged

**Original verdict:** F — "task-spawn setup, many divides+calls, loop"

**Verdict: TRACTABLE (risk-noted)**

**Upgrade reason:** **The map doc's proposed name `Ov004_SendStatusMsg`
("status message sender") does not match the ground-truth `.s` body.** The
actual assembly is byte-for-byte structurally identical (same recipe, not
merely similar) to `021d6f20` and `021d9fc4` below — all three run
`Task_PostLocked`→`func_02094504`(clear)→`func_02001d0c`(text
config)→`func_020054a4`(measure)→`func_02004f58`(render)→`func_02092904`(DMA
setup)→bounded `func_0208fd30` loop→`Task_InvokeLocked`, i.e. R8's
`Ov004_DrawTradeControls`/`Ov004_DrawInfoText` idiom (`021cdd38`/`021cfc64`),
not a message-send primitive. The map doc's "status message" label appears
to be a stale artifact that then copy-propagated across all three siblings
(each cross-references the others as "sibling of X" under the same wrong
label). Despite the mislabel, the function is fully tractable — every callee
is a documented NitroSDK/text-render primitive.

**Struct/data dependencies:**
- `data_02102c90` — text-render context cluster (documented, R8).
- `data_ov004_0220f1a4` — NEW global: a pointer/int array indexed
  `slot_id*4`, written once per call with the return value of
  `func_020054a4` (measured text width) — a per-slot "cached label width"
  cache (see New KB gaps).

**Ground-truth pool words (verbatim):**

```
data_02102c90
data_ov004_0220f1a4
```

**Ground-truth BL targets (verbatim, in call order):**

```
Task_PostLocked
func_02094504
func_02001d0c
func_020054a4
func_02004f58
func_02092904
func_0208fd30    (x2 per loop iteration)
Task_InvokeLocked
```

**C sketch:**

```c
void func_ov004_021cb63c(int slot_id, char *text, int size_arg) {
    int half_scaled = (size_arg << 4);
    half_scaled = (half_scaled + (half_scaled >> 31)) >> 1;
    void *task = Task_PostLocked(half_scaled, 4, 0);
    func_02094504(0, task, half_scaled);

    int shifted = (size_arg + ((size_arg >> 2) >> 29)) >> 3;
    func_02001d0c(data_02102c90, shifted, 2);

    int w = func_020054a4(text, 0xc);
    data_ov004_0220f1a4[slot_id] = w;

    int off = (w + (w >> 31)) >> 1;
    int half_size = (size_arg + (size_arg >> 31)) >> 1;
    int centered = half_size - off;
    if (centered < 0) centered = 0;

    func_02004f58(data_02102c90, text, task, centered, 0xc);
    func_02092904(task, half_scaled);

    int iters = (size_arg + ((size_arg >> 4) >> 27)) >> 5;
    if (iters > 0) {
        int base = ((slot_id * size_arg) << 4);
        base = (base + (base >> 31)) >> 1;
        void *dst = task;
        int row = base + 0xc80;
        int rowmul = size_arg + (size_arg >> 31);
        int j = 0x80;
        for (int i = 0; i < iters; i++, j += 2) {
            func_0208fd30(dst, row, 0x80);
            func_0208fd30(dst + (rowmul >> 1), row + (j << 7), 0x80);
            dst += 0x100;
            row += 0x100;
        }
    }
    Task_InvokeLocked(task);
}
```

**Match-difficulty risk note:** Structurally identical to R8's
already-matched-recipe `021cdd38`/`021cfc64` pair, so the approach is
proven — but with 9 callee-saved regs live across 7 `bl` calls, expect the
same reshape already validated for that pair. Lower risk than
`021d0e98`/`021d705c` above given the sibling recipes already matched
cleanly in R8.

---

### 0x021D6F20 (316 B, class E, overlay=ov004)

**Original verdict:** E — "div-by-2 asr chains, many caller-saved across
calls"

**Verdict: TRACTABLE (risk-noted)** — second member of the `021cb63c` triplet.

**Upgrade reason:** Byte-for-byte identical instruction sequence to
`021cb63c` above (only local label numbers differ). Map doc corroborates
`Ov004_DrawRemotePanel`, consistent with the true "draw labeled panel"
semantics identified above (not the mislabeled "status message" reading).
Called from `021d7440` (this doc's entry #7) and two siblings outside this
batch.

**Struct/data dependencies:** Same as `021cb63c`: `data_02102c90`,
`data_ov004_0220f1a4`.

**Ground-truth pool words:** `data_02102c90`, `data_ov004_0220f1a4`.

**Ground-truth BL targets:** identical set to `021cb63c`.

**C sketch:** identical to `021cb63c`'s sketch (function name substituted).

**Match-difficulty risk note:** Same as `021cb63c`. Solve as a 3-way batch
with `021cb63c`/`021d9fc4`.

---

### 0x021D9FC4 (316 B, class E, overlay=ov004)

**Original verdict:** E — "asr divmod chains, caller-saved across many
calls"

**Verdict: TRACTABLE (risk-noted)** — third member of the `021cb63c` triplet.

**Upgrade reason:** Byte-for-byte identical body to `021cb63c`/`021d6f20`.
The map doc's own entry for this address, `Ov004_SendStatusMsgB — "sibling
of 021cb63c,"` is further evidence the mislabel propagated across the whole
triplet (all three share the same incorrect label because they are
structurally identical). True semantics (per ground truth) are the same
task-render/label-draw helper as its siblings.

**Struct/data dependencies:** Same as `021cb63c`/`021d6f20`.

**Ground-truth pool words:** `data_02102c90`, `data_ov004_0220f1a4`.

**Ground-truth BL targets:** identical set to `021cb63c`.

**C sketch:** identical to `021cb63c`'s sketch (function name substituted).

**Match-difficulty risk note:** Same as siblings above — solve as a 3-way
batch.

---

### 0x021D03EC (324 B, class F, overlay=ov004)

**Original verdict:** F — "324B, 36 stores register-block setup"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawDeckPanel`. Exactly what
the heuristic's own note describes and nothing more: a linear NitroSDK
VRAM-transfer-config hardware-register-block initializer (`func_0208ecd8` DMA
setup with 7 fixed args, then ~15 sequential `str`s of fixed literal values)
gated by a single early-return check. Zero branches after the initial gate —
the "OV006-pattern full-init idiom" already fully proven tractable across
R6/R7/R8 (most recently R8's `021cfe08`'s 55-call linear sequence), a
straight-line enumeration with no scheduling ambiguity.

**Struct/data dependencies:** None beyond the opaque hardware-register-block
base pointer returned by `func_0208e890` (a stable extern) and 5 pool
literals which are plain hex constants, not symbolic globals.

**Ground-truth pool words (verbatim):**

```
0x04000444
0x4210ffff
0x56402000
0x001f00c0
0xf800f800
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202d9f8
func_0208e890
func_0208ecd8
```

**C sketch:**

```c
void func_ov004_021d03ec(int card_idx) {
    if (func_0202d9f8() == 0) return;

    void *base = func_0208e890();
    func_0208ecd8(0, -0x400000, 0xc0000, 0x400000, 0x400000, 1, 0);

    volatile int *reg = (volatile int *)0x04000444;
    *reg = 0;
    reg[0xb] = 0x33000; reg[0xb] = 0x60000; reg[0xb] = 0x1000;

    volatile int *r = (volatile int *)base;
    r[0xa] = card_idx << 7; r[0xa] = 0x80000; r[0xa] = 0x1000;

    volatile int *lr_field = (volatile int *)((u8 *)base - 4);
    *lr_field = 3; r[4] = 0; *lr_field = 2;

    r[0x1f] = 0x4210ffff;
    r[0x20] = (u32)0x4210ffff >> 0x10;
    r[0x19] = 0x56402000;
    r[0x1a] = 0x100;
    r[0x18] = 0x001f00c0;
    r[0x2f] = 1;

    r[0x11] = 0; r[0x12] = 0xf800f800; r[0x12] = 0;
    r[0x11] = 0x800; r[0x12] = 0x800 - 0x8000000; r[0x12] = 0;
    r[0x11] = 0x800 + 0x8000000; r[0x12] = r[0x11]; r[0x12] = 0;
    r[0x11] = 0x8000000; r[0x12] = 0x8000000 + 0xf800; r[0x12] = 0;

    r[0x30] = 0;
    r[1] = 1;
}
```

Some individual store offsets in the sketch are extrapolated from the
pattern rather than pinned exactly; every stored value is a fixed literal
and the control flow requires zero further resolution, so this is
classification-clean regardless.

---

### 0x021D1118 (332 B, class F, overlay=ov004)

**Original verdict:** F — "82 insns, nested array-copy loops, mul addressing,
reg-heavy"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_HandlePanelClosed`, "called
from 021d13dc when b500.44==0" — `021d13dc` is already MATCHED HIGH
(`Ov004_SendCmd15Cancel`). The "nested array-copy loops" are a bounded outer
loop of exactly 2 iterations, each with an inner loop bounded by a stored
count field, calling the already-documented `func_ov004_021cfbec`
(`Ov004_DrawPanelD`). The "mul addressing" is standard array-stride indexing
into `data_ov004_0220b500`.

**Struct/data dependencies:**
- `data_ov004_0220b500` (b500) — `+0xc0c`/`+0xc10` (two counters), `+0xc64`/
  `+0xc68` (per-outer-slot cursor fields), `+0xc3c` (index used by
  `func_0202bae4`/`func_0202ba94` — flagged as a possible cross-struct
  offset collision with `data_021040ac+0xc3c`, documented separately in R6's
  `021cb290`; per this project's "same-addr-across-overlays/structs is
  usually coincidental" pattern, treat as unrelated unless a future pass
  proves otherwise), `+0xc14` (per-slot value), `+0x54` (`Ov004Phase`-family
  field — but the values written here, `0xe`/`0xc`-adjacent, do not match
  the 5-entry documented enum, suggesting a finer per-panel sub-state reusing
  the same field name pattern — see New KB gaps), `+0xc84` (mode flag).
- `func_0202bae4` = `Card_ClampATK`, `func_0202ba94` = `Card_GetDEFCurrent`
  (both already named), `func_ov004_021d0530` = `Ov004_PlayTradeEffect`,
  `func_ov004_021d05f4` = `Ov004_ResetSlot` (both already named, MED).

**Ground-truth pool words:** `data_ov004_0220b500`.

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202bae4                          (conditional)
func_0202ba94                             (conditional, same branch)
func_ov004_021d0530                          (conditional, arg=0xe8)
func_02008888                                   (conditional)
func_ov004_021d0530                                (conditional, arg=0)
func_ov004_021cfbec                                   (per inner-loop iteration, x2 outer)
func_ov004_021d0e98                                       (always, arg=0 — this doc's entry #4)
func_ov004_021d05f4                                           (always)
func_ov004_021d0530                                              (always, tail)
```

**C sketch:**

```c
void func_ov004_021d1118(int arg0) {
    if (arg0 != 0) {
        int slot_a = data_ov004_0220b500.fc68;
        int slot_b = data_ov004_0220b500.fc64;
        int val = data_ov004_0220b500.data[slot_a].fc3c;
        int def  = data_ov004_0220b500.data[slot_b].fc14;
        Card_ClampATK(def, 1);
        Card_GetDEFCurrent(val, 1);
        func_ov004_021d0530(0xe8);
        func_02008888();
        func_ov004_021d0530(0);
    }

    int c0 = data_ov004_0220b500.fc0c - 1;
    int c1 = data_ov004_0220b500.fc10 - 1;
    data_ov004_0220b500.fc0c = c0;
    data_ov004_0220b500.fc10 = c1;

    for (int slot = 0; slot < 2; slot++) {
        int cursor = data_ov004_0220b500.data[slot].fc64;
        int limit  = data_ov004_0220b500.fc0c;
        int base_off = slot * 0xa;
        while (cursor < limit) {
            int v = data_ov004_0220b500.secondary[cursor].f14_plus4;
            data_ov004_0220b500.data[slot].fc14 = v;
            func_ov004_021cfbec(cursor + base_off);
            limit = data_ov004_0220b500.data[slot].fbound;   /* re-read each iter */
            cursor++;
        }
    }

    func_ov004_021d0e98(0);

    int phase = data_ov004_0220b500.f54 - 1;
    data_ov004_0220b500.fc6c = data_ov004_0220b500.fc70 = 0;
    data_ov004_0220b500.fc74 = data_ov004_0220b500.fc78 = 0;
    data_ov004_0220b500.fc64 = data_ov004_0220b500.fc68 = 0;
    data_ov004_0220b500.f54 = phase;

    func_ov004_021d05f4(1);

    int mode = data_ov004_0220b500.fc84;
    func_ov004_021d0530((mode != 0 ? 9 : 0xc) + 0xb6 + 0x300);
}
```

The exact loop-limit re-read source needs objdiff to pin precisely; the
shape (bounded inner loop over a per-slot dynamic count, calling an
already-named draw helper) is unambiguous.

---

### 0x021D9D58 (332 B, class F, overlay=ov004)

**Original verdict:** F — "80 insns, switch + 12 calls, state increments;
big-body"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_TestTouchSelectC` (itself
flagged there as a "permuter target," but ground truth shows the "switch" is
simply two `cmp/beq` compares against `data_ov004_0220b500+0x54` (values 4
and 5 only, not a computed branch table), each leading to deterministic
field writes and already-named callees. `data_ov004_0220e500+0xbd8` write of
`-1` at entry extends the already-flagged-gap secondary BSS block from R6
(there at `+0xcd0`).

**Struct/data dependencies:**
- `data_ov004_0220e500+0xbd8` — write-only `int = -1` at entry (new offset,
  extends the already-flagged gap — see New KB gaps).
- `data_ov004_0220b500` (b500) — `+0x5c` (early gate), `+0x54` (state,
  tested against literals 4/5), `+0x220` (gate flag, already touched
  throughout R8), `+0x224`/`+0x228` (the exact "deadline-count field
  224/228 pair" already documented in R8's `021cf638`), `+0x22c` (0/1/2
  selector), `+0x234` (confirmed flag), `+0x78` (mode field).
- `data_ov004_022915e8` — lock-gate object (already documented).

**Ground-truth pool words:** `data_ov004_0220e500`, `data_ov004_0220b500`,
`data_ov004_022915e8`.

**Ground-truth BL targets (verbatim, in call order):**

```
func_020347b8
func_ov004_021c9d8c     (conditional)
func_0201d050                (case f54==4)
func_ov004_021d8cd0             (Ov004_ApplyBlendAlpha, conditional)
func_ov004_021c9ef0                (arg=0xe1)
func_ov004_021d997c                       (case f54==5, entry)
func_ov004_021d9948                          (conditional, deadline reached)
func_0201d050                                   (x2 possible sub-branches)
func_ov004_021c9ef0                                (arg=0xea, else branch)
func_02037208                                         (toast, else branch)
func_ov004_021d9b98                                       (always, tail)
```

**C sketch:**

```c
int func_ov004_021d9d58(void) {
    data_ov004_0220e500.fbd8 = -1;

    if (data_ov004_0220b500.f5c == 0) {
        if (!func_020347b8()) func_ov004_021c9d8c(1);

        int phase = data_ov004_0220b500.f54;
        if (phase == 4) {
            func_0201d050(0);
            if (data_ov004_0220b500.f220 != 0) {
                Ov004_ApplyBlendAlpha(data_ov004_022915e8);
                func_ov004_021c9ef0(0xe1);
                data_ov004_0220b500.f54 = phase + 1;
            }
        } else if (phase == 5) {
            func_ov004_021d997c();
            if (data_ov004_0220b500.f224 != 0) data_ov004_0220b500.f224++;
            if (data_ov004_0220b500.f228 != 0) data_ov004_0220b500.f228++;

            if (data_ov004_0220b500.f224 > 0x1e && data_ov004_0220b500.f228 > 0x1e) {
                if (func_ov004_021d9948()) {
                    data_ov004_0220b500.f234 = 1;
                    int sel = data_ov004_0220b500.f22c;
                    if (sel == 0)      func_0201d050(0);
                    else if (sel == 1) func_0201d050(2);
                    data_ov004_0220b500.f54 = phase + 1;
                    data_ov004_0220b500.f78 = 1;
                } else {
                    data_ov004_0220b500.f224 = 0;
                    data_ov004_0220b500.f228 = 0;
                    func_ov004_021c9ef0(0xea);
                    func_02037208(0x42 - 0x43, 0, 0, 1);
                }
            }
        }
    }

    func_ov004_021d9b98();
    return 0;
}
```

---

### 0x021D53C0 (364 B, class F, overlay=ov004)

**Original verdict:** F — "364B, dense global-store init + mla + indexed
stores"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawExchangePanel`. The
"dense global-store init" is a long but fully bounded, non-looping write
sequence to already-well-documented `data_021040ac` fields — several
(`+0xbb0`/`+0xbb4`/`+0xbbc`/`+0xbc0`/`+0xc48`) are the EXACT SAME cluster
already fully catalogued in `Ov004Ov006Deep.md`'s `021cb290` case-5
dispatch, a direct confirmation this is a sibling/adjacent-phase initializer
for the same "reconnect" record. `data_02104f4c+0xa3c` language-field
extract is the documented idiom; `data_02105a4c` is the already-documented
external seed block (R8's `021cf638`). The single `mla` the heuristic
flagged is one deterministic address computation, not a loop.

**Struct/data dependencies:**
- `data_021040ac` — `+0xc3c` (mode selector), `+0xba0` (zeroed), `+0xb88`
  (mirrors `data_ov004_0220e500+0xc94`), `+0xbb0` (set 1), `+0xbb4` (id or
  fallback literal), `+0xbc4`/`+0xbc8`/`+0xbbc`/`+0xbc0` (zeroed), `+0xc48`
  (set 2).
- `data_02104cec` — indexed store target (selector-index array; already
  independently flagged as a new global elsewhere per
  `SmallOverlaysRetriageR8.md`'s ov003 `021cc8b8` entry — this extends its
  known cross-overlay usage, see New KB gaps).
- `data_02104c78`/`data_02104c7a`/`data_02105989` — index-selector byte and
  string/data refs (already documented, R8's `021cc014`).
- `data_ov004_0220e500+0xc94` — read (mirrors into `data_021040ac+0xb88`).
- `data_ov004_0220b500+0x78` — read (gates the final `func_ov004_021d3a58`
  call, which is already documented in `OverlayConstants.md`:
  `OV004_STRUCT_FIELD12=35`/`OV004_STRUCT_FIELD14=1` — direct confirmation).

**Ground-truth pool words (verbatim):**

```
data_0219b2dc
data_021040ac
data_02104cec
data_ov004_0220e500
data_02104c7a
0x00023280
data_02104f4c
data_02104c78
data_02105989
data_02105a4c
data_ov004_0220b500
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02046ac4         (x2: init-gate test, then again after the init block)
func_020aadf8
func_02012454
func_02046ae0
func_ov004_021d3a58     (conditional, tail — only if b500.f78 != 0)
```

**C sketch:**

```c
void func_ov004_021d53c0(SomeSelf *self) {
    int gate = 0;
    if (self->f38 != 0) { self->f38 = 0; gate = 1; }

    if (gate) {
        data_0219b2dc = 1;

        int connected = func_02046ac4();
        int mode = (connected != 0) ? 1 : 0;
        data_021040ac.fc3c = mode;
        data_02104cec[mode] = 0;
        data_02104cec[1 - mode] = 2;
        data_021040ac.fba0 = 0;

        int mirror = data_ov004_0220e500.fc94;
        data_021040ac.fb88 = mirror;
        data_021040ac.fbb0 = 1;
        data_021040ac.fbb4 = (mirror == 0) ? -1 : 0x23280;

        data_021040ac.fbc4 = data_021040ac.fbc8 = 0;
        data_021040ac.fbbc = data_021040ac.fbc0 = 0;
        data_021040ac.fc48 = 2;

        int lang = (data_02104f4c.fa3c << 0x1d) >> 0x1d;
        data_02104c78[mode] = (signed char)lang;

        func_020aadf8(data_02104c7a, data_02105989);
        func_02012454(mode, data_02105a4c);

        if (func_02046ac4() != 0) func_ov004_021d62b8(0);
    }

    if (func_02046ae0() < 2) {
        self->f30 = 0x27;
        self->f38 = 1;
        self->f3c = 0;
        return;
    }

    if (data_ov004_0220b500.f78 == 0) return;

    func_ov004_021d3a58(self, 0x25, 0x78);
}
```

The exact `_LIT` vs literal `-1` selection at `bb4` needs objdiff, but the
instruction sequence unambiguously shows a `mov r0,#1;subeq r0,r0,#0x2` (i.e.
literal `-1`) for the `mirror==0` case and `ldrne r0,_LIT` (`0x23280`) for
the else case, exactly as sketched.

---

### 0x021D512C (372 B, class F, overlay=ov004)

**Original verdict:** F — "372B, memset+struct init+asr index math, heavy
reg-alloc"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawSlotRecordB`. A gated
init block (`func_020945f4` zero-fill, `func_02033c2c` struct setup)
followed by an unconditional update call, then a fully deterministic 3-way
gate chain (not a switch) checking, in order: (1)
`data_ov004_0220b500+0x88 >= 0` with a nested byte-record validity check —
this exact `rec[1]==6 && rec[3]<rec[2]` byte-compare-triple pattern is
**byte-identical** to the pattern in `021d38c4` (the wall-adjacent entry
below), confirming a shared idiom; (2) a `+0x3000+0xc90` mode-flag test in
the already-documented "sub-record" cluster; (3) a `+0x48==1` test. All three
lead to a shared tail. "Heavy reg-alloc" is real but creates no
classification ambiguity.

**Struct/data dependencies:**
- `data_ov004_0220b500` (b500) — `+0x38` (gate flag), `+0x358` (local buffer
  base), `+0x344` (record struct), `+0x48`/`+0x88`/`+0x350` (already
  referenced elsewhere in this batch), `+0x260`/`+0x261`/`+0x262` (a small
  local flag triple), `+0x30`/`+0x38`/`+0x3c` (a recurring "pending action"
  mini-struct — id/active-flag/sub-id — also seen in `021d53c0`'s tail; see
  New KB gaps), `+0x3000+0xc90` (mode flag, already-catalogued sub-record
  cluster).
- `data_ov004_0220b500+0x350` — 32-bit pointer field, offset by `idx*4` to
  index a byte-record table; each record's `+1`/`+2`/`+3` bytes form a
  type/range-check triple. **This is the same underlying table shared with
  `021d38c4`** (see New KB gaps) — the single most important unresolved
  item from this batch.

**Ground-truth pool words:** `data_ov004_0220b500`.

**Ground-truth BL targets (verbatim, in call order):**

```
func_020945f4
func_02033c2c
func_0203268c
func_02033c74
func_02033d28    (conditional tail, only when no branch already set the "handled" flag)
```

**C sketch:**

```c
void func_ov004_021d512c(RecordSelf *self) {
    int was_active = (self->f38 != 0);
    self->f38 = 0;

    if (was_active) {
        func_020945f4(self->f358, 0, 0xf0);
        func_02033c2c(self->f344, self->f48 + 0x400, 8, 0x1e, 0, self->f358);
        self->f260 = self->f261 = self->f262 = 0;
    }

    void *ctx = func_0203268c();
    func_02033c74(self->f344, ctx->fe7c, ctx->feac, 0x6e);

    int handled = 0;
    int idx = data_ov004_0220b500.f88;
    if (idx >= 0) {
        u8 *rec = (u8 *)(data_ov004_0220b500.f350 + (idx * 4));
        int type_ok = (rec[1] == 6) && (rec[3] < rec[2]);
        if (type_ok) {
            data_ov004_0220b500.f88 = -1;
        } else {
            signed char v = *(signed char *)rec;
            self->f260 = v;
            self->f30 = 0x1e; self->f38 = 1; self->f3c = 0;
            handled = 1;
        }
    } else if (data_ov004_0220b500.data3000.fc90 != 0) {
        self->f30 = 0x1c; self->f38 = 1; self->f3c = 0;
        handled = 1;
    } else if (data_ov004_0220b500.f48 == 1) {
        self->f30 = 0x18; self->f38 = 1; self->f3c = 0;
        handled = 1;
    }

    if (!handled) func_02033d28(self->f344);
}
```

---

### 0x021D6A10 (376 B, class F, overlay=ov004)

**Original verdict:** F — "90 insns, 20 calls, switch dispatch + many bl;
big-body"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawOpponentPanel`. A clean
top-level two-stage bounded dispatcher: a 4-way `cmp/beq` chain (0/1/2/other)
on `b500+0x4c` selecting one of 3 named sub-handlers (one of which,
`021d9d58`, is this doc's own entry #13, already tractable), always followed
by 5 fixed calls (including `021ce1ec` = `Ov004_DrawTimerBar`, already
matched-recipe in R8), then two more independent bounded dispatchers
(blend-register writes, then a repeat of the same 4-way switch for a "second
phase" plus a "third phase" 3-way switch). Every branch target is a
compile-time-enumerable case, not a computed/indirect call.

**Struct/data dependencies:**
- `data_ov004_0220b500` (b500) — `+0x48`/`+0x4c`/`+0x50`/`+0x5c` (mode/state
  4-field cluster), `+0x0` (an unconditional counter).
- `data_ov004_022915e8` — lock-gate object (already documented).
- `0x0400006c`/`0x0400106c` — MASTER_BRIGHT main/sub MMIO registers (hardware
  constants, same family as R8's `021ce4a8`).

**Ground-truth pool words:** `data_ov004_0220b500`, `data_ov004_022915e8`,
`0x0400006c`, `0x0400106c`.

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov004_021d83b0       (case f4c==1)
func_ov004_021db780          (case f4c==0)
func_ov004_021d9d58              (case f4c==2; = this doc's entry #13)
func_ov004_021d6734                  (always)
func_ov004_021d8d58                     (always)
func_ov004_021d9134                        (always)
func_ov004_021ca198                           (always)
func_ov004_021ce1ec                              (always; Ov004_DrawTimerBar, R8-matched)
func_02005e20                                        (x2)
func_02005ca0                                            (x2)
func_0208c884                                                (x2: main, sub)
func_ov004_021d8608          (2nd-phase, case f4c==1)
func_ov004_021db860              (2nd-phase, case f4c==0)
func_ov004_021d9ea4                  (2nd-phase, case f4c==2)
func_ov004_021d7910          (3rd dispatch, case new_f4c==1)
func_ov004_021da36c              (3rd dispatch, case new_f4c==0)
func_ov004_021d9418                  (3rd dispatch, case new_f4c==2)
```

**C sketch:**

```c
int func_ov004_021d6a10(void) {
    int gate = (data_ov004_0220b500.f48 != data_ov004_0220b500.f4c);
    int cnt = data_ov004_0220b500.f5c;
    if (gate) { if (cnt < 0x10) data_ov004_0220b500.f5c = cnt + 1; }
    else      { if (cnt != 0)  data_ov004_0220b500.f5c = cnt - 1; }

    int sel = data_ov004_0220b500.f4c;
    if (sel == 1)      func_ov004_021d83b0();
    else if (sel == 0) func_ov004_021db780();
    else if (sel == 2) func_ov004_021d9d58();

    func_ov004_021d6734();
    func_ov004_021d8d58(data_ov004_022915e8);
    func_ov004_021d9134(data_ov004_022915e8);
    func_ov004_021ca198();
    func_ov004_021ce1ec();

    data_ov004_0220b500.f0 += 1;
    func_02005e20(1); func_02005e20(2);
    func_02005ca0(1); func_02005ca0(2);

    int bright = -data_ov004_0220b500.f5c;
    func_0208c884(0x0400006c, bright);
    func_0208c884(0x0400106c, bright);

    if (data_ov004_0220b500.f5c == 0x10) {
        int sel2 = data_ov004_0220b500.f4c;
        if (sel2 == 1)      func_ov004_021d8608();
        else if (sel2 == 0) func_ov004_021db860();
        else if (sel2 == 2) func_ov004_021d9ea4();
    }

    int prev_sel = data_ov004_0220b500.f4c;
    int new_sel  = data_ov004_0220b500.f48;
    data_ov004_0220b500.f50 = prev_sel;
    data_ov004_0220b500.f4c = new_sel;

    if (new_sel == 0)      { func_ov004_021da36c(); return 0; }
    else if (new_sel == 1) { func_ov004_021d7910(); return 0; }
    else if (new_sel == 2) { func_ov004_021d9418(); return 0; }
    return 1;
}
```

---

### 0x021D0F98 (384 B, class F, overlay=ov004)

**Original verdict:** F — "91 insns, magic divide, nested teardown loops,
reg-alloc"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_HandlePanelOpen`, "called
from 021d13dc when b500.44!=0" — direct sibling of `021d1118` (this doc's
entry #12), sharing the entire `+0xc0c/+0xc10/+0xc3c/+0xc14/+0xc64/+0xc68/
+0xc6c/+0xc70/+0xc74/+0xc78` field cluster verbatim. The "magic divide" is
the already-fully-documented `0x66666667` ÷10 smull reciprocal, here on
`data_02104f4c+0xa60` (part of R7's documented achievement/mode cluster).
The "nested teardown loops" are the identical bounded 2-outer×dynamic-inner
structure already confirmed tractable in `021d1118`.

**Struct/data dependencies:**
- `data_ov004_0220b500` (b500) — entire cluster shared verbatim with
  `021d1118`.
- `data_02104f4c+0xa60` — achievement/mode cluster field (R7), extended here
  with a `-= (val*9)/10`-shaped adjustment via the ÷10 smull.
- `data_ov004_022915e8` — lock-gate object.

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500
0x66666667
data_02104f4c
data_ov004_022915e8
0x00000101
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202c028
func_0202ba94
func_0202bc24
func_0202c0c0           (arg=0xe8)
func_ov004_021d8798
func_02008888
func_ov004_021d0168      (arg=0; this doc's entry #18)
func_0202c0c0                (arg=0x101)
func_ov004_021d8798               (2nd call)
func_ov004_021cfbec                  (per inner-loop iteration, x2 outer)
```

**C sketch:**

```c
void func_ov004_021d0f98(int arg0) {
    if (arg0 != 0) {
        int slot = data_ov004_0220b500.fc68;
        int val = data_ov004_0220b500.data[slot].fc3c;

        int atk = CardDisplay_SetParam(val);
        int weighted = atk * 9;
        int q = (int)(((s64)weighted * 0x66666667) >> 32);
        q = (q >> 31) + (q >> 2);          /* /10 with rounding */
        data_02104f4c.fa60 -= q;

        Card_GetDEFCurrent(val, 1);
        func_0202bc24(val, 1);

        char *name1 = func_0202c0c0(0xe8);
        Ov004_QueueDisplayRequest(data_ov004_022915e8, name1, 1);
        func_02008888();

        func_ov004_021d0168(0);

        char *name2 = func_0202c0c0(0x101);
        Ov004_QueueDisplayRequest(data_ov004_022915e8, name2, 1);

        data_ov004_0220b500.fc0c -= 1;
        data_ov004_0220b500.fc10 -= 1;

        for (int slot2 = 0; slot2 < 2; slot2++) {
            int cursor = data_ov004_0220b500.data[slot2].fc64;
            int limit  = data_ov004_0220b500.fc0c;
            int base_off = slot2 * 0xa;
            while (cursor < limit) {
                int v = data_ov004_0220b500.secondary[cursor].f14_plus4;
                data_ov004_0220b500.data[slot2].fc14 = v;
                func_ov004_021cfbec(cursor + base_off);
                limit = data_ov004_0220b500.data[slot2].fbound;
                cursor++;
            }
        }
        data_ov004_0220b500.f54 = 0xe;
    } else {
        data_ov004_0220b500.f54 -= 1;
    }

    data_ov004_0220b500.fc6c = data_ov004_0220b500.fc70 = 0;
    data_ov004_0220b500.fc74 = data_ov004_0220b500.fc78 = 0;
    data_ov004_0220b500.fc64 = data_ov004_0220b500.fc68 = 0;
}
```

---

### 0x021D0168 (396 B, class F, overlay=ov004)

**Original verdict:** F — "396B, 20 calls, scaling+init sequence"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Confirmed by R8's own `021cfe08` recipe sketch, which
calls this exact function by address as its final tail call
(`func_ov004_021d0168(0)`), independently corroborating it as a real,
load-bearing function. Map doc names it `Ov004_DrawPhasePanel`. A
deterministic 2-gate structure — `func_0202c93c()` (`CardCtx2_GetPtr`)
comparison feeding `func_0202c9c0`, a language-gated VRAM/text-render block
using the same `data_02102c90` cluster confirmed throughout this batch, plus
a standard DISPCNT bitfield pack; finally an unconditional tail rebuilding an
animation-request record via already-named helpers.

**Struct/data dependencies:**
- `data_0219ad48` (via `func_0202c93c`) — `[0]`/`[1]` compared against
  `arg0` at two separate points.
- `data_02104f4c+0x4` — language-ID 3-bit field.
- `data_02102c90` — text-render context.
- `data_ov004_02209dfc` — string-table label (Category-5 string-array
  family, extends the known set).

**Ground-truth pool words (verbatim):**

```
data_02104f4c
data_02102c90
0x000003ca
data_ov004_02209dfc
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202c93c
func_0202c9c0
func_02001d68            (conditional)
func_02001d0c
func_0202c0c0
func_0208df0c
func_0208e1cc
func_02094504               (x2)
func_020054a4
func_02004f58
func_0208e1cc                    (2nd call)
func_02001e94
func_0202c93c                         (2nd call, tail)
func_02091554                            (conditional)
Fill32
func_020aadf8
func_02022b74
func_0202cca4                                (always, final)
```

**C sketch:**

```c
void func_ov004_021d0168(int arg0) {
    int flag = (arg0 != 0);

    int *ctx = CardCtx2_GetPtr();
    if (flag != ctx[0]) {
        CardCtx2_SetSomething(flag);

        if (flag == 0) {
            int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
            func_02001d68(lang);
            func_02001d0c(data_02102c90, 0x20, 2);

            char *name = func_0202c0c0(0x3ca);
            void *vbase = func_0208df0c();
            void *e1 = func_0208e1cc();
            func_02094504(0, e1, 0x600);
            func_02094504(0, vbase + 0x220, 0x800);

            int w = func_020054a4(name, 0xc);
            int off = (w + (w >> 31)) >> 1;
            func_02004f58(data_02102c90, name, vbase + 0x220, 0x80 - off, 0xc);

            void *e2 = func_0208e1cc();
            func_02001e94(data_02102c90, (u16 *)((u8 *)e2 + 0x4c0), 0x11, 0xf);
        }

        volatile int *dispcnt = (volatile int *)0x04000000;
        int v = *dispcnt;
        int hi5 = (v & 0x1f00) >> 8;
        *dispcnt = (v & ~0x1f00) | ((hi5 | 2) << 8);
    }

    int *ctx2 = CardCtx2_GetPtr();
    if (ctx2[0] == 0) return;

    int *ctx3 = CardCtx2_GetPtr();
    if (arg0 != ctx3[1]) {
        char label_buf[0x38];
        func_02091554(label_buf, data_ov004_02209dfc, arg0);

        char rec[0x3c];
        Fill32(rec, 0, 0x3c / 4);
        func_020aadf8(rec + 4, label_buf);
        *(int *)(rec + 0x2c) = 0x10000;
        *(int *)(rec + 0x30) = 0x1000;
        func_02022b74(rec);
    }

    CardCtx2_StepPhase(arg0);
}
```

---

### 0x021D2AAC (404 B, class F, overlay=ov004)

**Original verdict:** F — "branch-table state handler, stack buffer loop"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Map doc corroborates `Ov004_DrawCardInfo`. A genuine
`addls pc,pc,r0,lsl#2` computed branch table, but fully bounded (7 explicit
case targets over a range check, with the out-of-range fallthrough itself
one of the 7 enumerated table entries — the "default" case is enumerated,
not an unbounded fallback). Every case is a small number of deterministic
field writes to `data_ov004_0220b500`'s already-documented `+0xc0c..+0xc7c`
cluster (identical family to `021d1118`/`021d0f98`) or a call to already-named
siblings.

**Struct/data dependencies:**
- `data_ov004_0220b500` (b500) — `+0x48`/`+0x54` (phase-family fields; `0xf`
  matches the documented `OV004_PHASE_CMD_15=15` enum value, direct
  confirmation), `+0xc7c` (flag), `+0xc10` (count), `+0xc6c`/`+0xc70`
  (zeroed), `+0xc68` (cursor), `+0xc64` (per-iteration id), `+0xc3c`
  (per-iteration value, array-of-struct pattern shared with
  `021d1118`/`021d0f98`), `+0xc78` (flag).
- Stack buffer filled by `func_0201cbd8(6, sp)` (message-receive primitive).

**Ground-truth pool words:** `data_ov004_0220b500`.

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201cbd8
func_ov004_021cfbec    (per inner-loop iteration in the "count" case, bounded by the stack-buffer count)
func_02037208              (toast, id=0x3a-0x3b)
func_02037208                  (toast, same id, non-zero-arg sub-branch)
func_ov004_021d1118                (zero-arg sub-branch, conditional on f54==0xf)
func_02037208                        (toast, id=0x42-0x43)
func_0201cfe0                            (final case)
func_0201cd1c                                (conditional)
func_ov004_021d1118                              (always, arg=1)
```

**C sketch:**

```c
int func_ov004_021d2aac(void) {
    char buf[0x200];
    if (!func_0201cbd8(6, buf)) return 0;

    u16 msg_type = *(u16 *)buf;
    /* jump table order confirmed from the .s, index = msg_type - 0xa:
       0->msg 0xa, 1->msg 0xb, 2->msg 0xc, 3->msg 0xd (no-op),
       4->msg 0xe, 5->msg 0xf, 6->msg 0x10 */
    switch (msg_type) {
    case 0xa:
        data_ov004_0220b500.f48 = 1;
        data_ov004_0220b500.f54 = 4;
        break;

    case 0xb:
        data_ov004_0220b500.data3000.fc7c = 1;
        data_ov004_0220b500.data3000.fc10 = 0;
        data_ov004_0220b500.data3000.fc6c = 0;
        data_ov004_0220b500.data3000.fc70 = 0;
        break;

    case 0xc: {
        u16 count = *(u16 *)(buf + 2);
        data_ov004_0220b500.data3000.fc7c = 0;
        data_ov004_0220b500.data3000.fc10 = count;
        data_ov004_0220b500.data3000.fc68 = 0;
        for (int i = 0; i < count; i++) {
            u16 id = *(u16 *)(buf + 4 + i * 4);
            data_ov004_0220b500.data[i].fc3c = id;
            func_ov004_021cfbec(i + 0xa);
        }
        break;
    }

    case 0xd:
        break;   /* no-op, table's own explicit "default" slot */

    case 0xe:
        if (func_0201cfe0() == 0) func_0201cd1c(6, buf, 2);
        func_ov004_021d1118(1);
        break;

    case 0xf: {
        u16 val = *(u16 *)(buf + 2);
        data_ov004_0220b500.data3000.fc64 = val;
        data_ov004_0220b500.data3000.fc70 = 1;
        func_02037208(0x3a - 0x3b, 0, 0, 1);
        break;
    }

    case 0x10: {
        u16 val = *(u16 *)(buf + 2);
        if (val != 0) {
            data_ov004_0220b500.data3000.fc78 = 1;
            func_02037208(0x3a - 0x3b, 0, 0, 1);
        } else {
            if (data_ov004_0220b500.f54 == 0xf) func_ov004_021d1118(0);
            func_02037208(0x42 - 0x43, 0, 0, 1);
        }
        break;
    }
    }

    return 1;
}
```

Note on the switch decode: the raw table order from the `.s` is
`[.L_608, .L_4dc, .L_4f0, .L_510, .L_608, .L_564, .L_58c, .L_5e4]` for
`msg_type - 0xa` = 0..6; the sketch above maps directly onto that order.
This needs a careful line-by-line objdiff pass to pin exactly, but every
target is fully enumerated and deterministic — the WALL/TRACTABLE
classification is unaffected either way.

---

## ov004 — Confirmed-intractable / wall-adjacent (1)

### 0x021D38C4 (404 B, class F, overlay=ov004)

**Original verdict:** F — "404B branchy, byte-compares, fill+selects"

**Verdict: WALL-adjacent (soft) — not a genuine scheduling wall, but a
missing-symbol gap large enough to withhold a confident TRACTABLE call.**

The function itself is almost entirely resolvable: a validity-check +
record-copy helper gated on `data_ov004_0229159c` (already-documented
`Ov004_GetStreamCtxPtr` target) being non-null, reading a byte-record table
at `[data_0229159c_ptr + 0x350]` indexed by an `arg0`-derived offset,
checking `rec[1]==6 && rec[3]<rec[2]` (the SAME validity idiom confirmed in
`021d512c` above), then conditionally calling the already-known
`func_ov004_021d6468` and copying two output fields into the caller-supplied
struct. What keeps this from a clean TRACTABLE: the shared `+0x350` table is
a pointer *stored inside* the `data_0229159c`-pointed-to struct, not a
directly-addressable global — its contents/shape depend on setup code
outside this function's own `.s` and outside anything documented in the 4
primary KB docs. The record layout itself (type/range triple at
`+1/+2/+3`) is confirmed via the `021d512c` cross-reference, and control flow
has no unresolvable runtime discriminant — every branch is a deterministic
byte-value compare — but the second half of the function (a `.L_150` block
involving `+0xd6c`/`+0xd38` fields on a `data_021040ac+r3`-computed address
with a 0x54-multiply stride) compounds enough unnamed indirection that a
fully-confident C sketch cannot be produced without guessing. Recommend
revisiting together with `021d512c` in the same session — solving one very
likely unlocks the other, since they share the identical `+0x350`
record-validity idiom byte-for-byte.

---

## ov006 — Tractable functions (17 clean + 3 risk-noted)

### 0x021B6E3C (220 B, class E, overlay=ov006) — re-examined, was stale

BORDERLINE in R6

**Original verdict:** E — "switch plus counted scan with live ip across
body" (R6's `Ov004Ov006Deep.md` marked this BORDERLINE at a stale ~72-byte
estimate.)

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** The exact "5-way slot-base address resolver" idiom
already fully documented in `Ov004Ov006Deep.md`'s writeups for
`021b6d1c`/`021b6dac` (same `add ip,r0,#X / add ip,ip,#Y` chain keyed on a
0-4 slot arg), followed by the linear-scan-in-slot's-card-list body R6 itself
already partially sketched for this exact address (count field at `+0xc662`
or `+0xc66c` depending on a mode arg, 4-byte-stride compare loop). Every
offset matches the already-documented undo/live slot-region address family
from R6's `021b831c` entry. No new struct/global — inherited-family
classification at correct ground-truth size.

**Struct/data dependencies:**
- Slot base addresses: same 5-case offset family as `021b831c`/`021b843c`/
  `021b81dc` (below) — slot 0: `+0x198+0x9800`; slot 1:
  `+0x158+0xb400`/`+0x358+0xb000`; slot 2: `+0x358/+0x158+0xb800`; slot 3:
  `+0x158+0xc000`/`+0x358+0xbc00`; slot 4: `+0x158+0xc400`/`+0x58+0xc400`.
- Count field: `[base+slot*2+0xc662]` or `[+0xc66c]` (same accessor pattern
  documented for `021b6d00`, R4).

**Ground-truth pool words:** none (no literal pool — all addresses computed
via `add` chains).

**Ground-truth BL targets:** none (leaf function).

**C sketch:**

```c
int func_ov006_021b6e3c(char *base, int slot, int card_key, int mode) {
    char *ip;
    switch (slot) {
    case 0: ip = base + 0x198 + 0x9800; break;
    case 1: ip = mode ? (base + 0x158 + 0xb400) : (base + 0x358 + 0xb000); break;
    case 2: ip = (mode ? base + 0x358 : base + 0x158) + 0xb800; break;
    case 3: ip = mode ? (base + 0x158 + 0xc000) : (base + 0x358 + 0xbc00); break;
    default: ip = mode ? (base + 0x158 + 0xc400) : (base + 0x58 + 0xc400); break;
    }

    u16 count;
    char *count_base = base + slot * 2 + 0xc600;
    if (mode == 0 && slot == 0) count = *(u16 *)(count_base + 0x62);
    else                        count = *(u16 *)(count_base + 0x6c);

    if ((int)count <= 0) return 0;
    int i;
    for (i = 0; i < (int)count; i++, ip += 4) {
        if (*(u16 *)ip == card_key) return 0;
    }
    return (i >= count) ? 0 : i;
}
```

Note: the combined `cmp r3,#0 / cmpne r1,#0` predicate is approximated with
`&&` above; objdiff will confirm whether mwcc wants a single combined boolean
or the two-step conditional-execution form — a minor match-difficulty note,
not a classification blocker.

---

### 0x021C4BD4 (240 B, class E, overlay=ov006)

**Original verdict:** E — "loop with post-blx reg rotation, many calls;
permuter-class"

**Verdict: TRACTABLE (risk-noted)** — explicitly flagged permuter-class;
concretely distinguished below.

**Upgrade reason:** `data_ov006_0224f448` (card-slot object base) is the
base struct; `func_ov006_021b6ad8` (`Ov006_CardPool_IsPlayable`, HIGH) and
`func_ov006_021b6be0` (`Ov006_CardPool_GetZonePtr`, HIGH, MATCHED `.c`) are
both already-matched siblings with fully-known signatures. `func_0208dd9c`
is the already-catalogued VRAM-bank-base getter used throughout the
ov004/ov005/ov006 render family. No new globals or offsets beyond one new
stride-0x10 field (see New KB gaps).

**Struct/data dependencies:**
- `data_ov006_0224f448` — card-slot object base, field `+0x64` (loop-outer
  selector).
- `pool_base+0x9c + outer_sel*0x10` — a stride-0x10 array indexed by
  `+0x64`, field `+0x4` read each outer pass — a NEW offset within this
  already-partially-documented stride-0x10 array family (see New KB gaps).

**Ground-truth pool words:** `data_ov006_0224f448` (the only pool word).

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208dd9c                          (x1, before loop)
func_02094504                          (x1, before loop)
func_02001d0c                          (x1, before loop)
func_ov006_021b6ad8                    (x6, once per loop iteration)
func_ov006_021b6be0                    (x6, once per loop iteration, guard-true only)
func_02001d68                          (x up to 6, conditional)
func_02001d98                          (x up to 12, two per iteration on the true path)
func_02004f58                          (x up to 6, conditional)
```

**C sketch:**

```c
int func_ov006_021c4bd4(char *pool_base) {
    char *vram = func_0208dd9c();
    int outer_sel = *(int *)(pool_base + 0x64);
    char *stride_row = pool_base + 0x9c + (outer_sel << 4);

    func_02094504(0, vram + 0xc40, 0x4800);
    func_02001d0c(pool_base + 0x10, 0x20, 0x12);

    int is_playable_flag = (*(int *)(pool_base + 0x64) != 0);
    int code = 9;

    for (int i = 0; i < 6; i++, code += 0x13) {
        int sl_field = *(int *)(stride_row + 0x4);
        int idx = sl_field + i;

        if (func_ov006_021b6ad8(pool_base, is_playable_flag, idx, 0)) {
            char *zone = func_ov006_021b6be0(pool_base, is_playable_flag, idx);
            func_02001d68(*(u8 *)zone);
            func_02001d98(pool_base + 0x10, 5);
            func_02004f58(pool_base + 0x10, zone + 1, vram + 0xc40, 0x16, code);
            func_02001d98(pool_base + 0x10, -1);
        }
    }
    return 1;
}
```

**Match-difficulty risk note (concrete):** `sl` (r10) is rebound every loop
iteration to `[stride_row+0x4]`, then reused post-`bl func_ov006_021b6ad8`
and post-`bl func_ov006_021b6be0` as the base for a byte load, read again
after a 3rd call (`func_02001d68`), and finally consumed by a 4th
(`func_02004f58`) — a live value must survive 4 consecutive `bl` calls
without a reload. This matches the `mwcc-register-reuse-recipe` memory's
documented reshape-able-70-95%-of-the-time pattern ("bind call result to
temp, reuse param in place"). Classification is 100% clean; an exact match
will likely need one register-reuse lever pass, falling back to permuter or
`.s` if that fails.

---

### 0x021CAC38 (252 B, class F, overlay=ov006)

**Original verdict:** F — "guard chains + pack + multiple calls, branchy
state body"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_SubObj_F_Main` in `_names_overlay006.md`.
Every callee is an already-MATCHED main-binary function with a trivially
known body: `func_0200617c`/`func_02006194` (bit-0/bit-2 accessors),
`func_02006110` (struct-pair copy), `func_02022234` (u16 store),
`func_02037208` (documented toast dispatcher). Every branch is a fixed 2- or
3-way early-return gate on already-resolved boolean accessors.

**Struct/data dependencies:**
- `self` (arg0) — `+0x8` (mode/active flag), `+0xc` (secondary handle),
  `+0x10`/`+0x24`/`+0x28`/`+0x14` (four s32 fields feeding a packed layout
  compute).

**Ground-truth pool words (verbatim):**

```
0x000001ff   ; bit-pack mask
0x04001018   ; MMIO register (BG2PA-family, engine B)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0200617c        (guard: bit-2 test)
func_02037208         (conditional toast, id=0x84-0x85)
func_02006194           (guard: bit-0 test)
func_02006110             (conditional: struct-pair copy)
func_02022234                (x2: index 6, then index 7)
func_ov006_021caea8             (conditional: Ov006_SubObj_F_HandleInput)
```

**C sketch:**

```c
int func_ov006_021cac38(SubObjF *self) {
    if (self->f8 == 0) return 1;

    if (func_0200617c()) {
        func_02037208(0x84 - 0x85, 0, 1);
        self->f8 = 0;
        return 1;
    }

    if (func_02006194()) {
        int a, b;
        func_02006110(&a, &b);
        int packed_hi = (a - self->f24) + self->f10;
        int packed_lo = (b - self->f28) + self->f14;
        u32 packed = ((-packed_hi) & 0x1ff) | (((-packed_lo) & 0x1ff) << 16);
        *(vu32 *)0x04001018 = packed;
        func_02022234(6, -packed_hi);
        func_02022234(7, -packed_lo);
    }

    if (self->fc != 0) {
        func_ov006_021caea8(self);
        self->fc = 0;
    }

    return 1;
}
```

---

### 0x021CA570 (264 B, class F, overlay=ov006)

**Original verdict:** F — "nested loops, edge-tile discriminant ladder,
many live temps"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_SubObj_E_HandleInput` in
`_names_overlay006.md`. Both loop bounds are compile-time-constant reads
from struct fields (genuinely data-dependent, but simple counts), and the
*body* of both loops is a fully enumerable ladder of literal constant
assignments (values 0-8, all literal `mov`s) selected purely by comparing
loop indices against `0`/`bound-1` — a classic "first/last/middle"
edge-detection idiom, zero runtime-unknown branching.

**Struct/data dependencies:**
- `self` (arg0) — `+0x38`/`+0x3c` (base tile-attribute components), `+0x58`
  (inner loop bound), `+0x5c` (outer loop bound).

**Ground-truth pool words:** none.

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208e1ac    (x1, before loop)
func_02094504      (x1, before loop)
func_0208e1ac        (x N, re-fetched every INNER-loop iteration, not hoisted)
```

**C sketch:**

```c
int func_ov006_021ca570(SubObjE *self) {
    void *vram_tilemap_base = func_0208e1ac();
    func_02094504(0, vram_tilemap_base, 0x800);

    int outer_count = self->f5c;
    for (int g = 0; g < outer_count; g++) {
        int row_count = self->f58;
        for (int r = 0; r < row_count; r++) {
            int discriminant;
            if (g == 0) {
                discriminant = (r == 0) ? 0 : (r == row_count - 1) ? 2 : 1;
            } else if (g == outer_count - 1) {
                discriminant = (r == 0) ? 6 : (r == row_count - 1) ? 8 : 7;
            } else {
                discriminant = (r == 0) ? 3 : (r == row_count - 1) ? 5 : 4;
            }

            void *vram = func_0208e1ac();
            u16 *dst = (u16 *)((char *)vram + g * 64 + r * 2);
            *dst = (self->f38 + discriminant) | (self->f3c << 12);
        }
    }
    return 1;
}
```

The discriminant ladder (0,1,2 / 3,4,5 / 6,7,8) is a 3x3 "corner/edge/middle"
tile-attribute table for an edit-grid border, consistent with a card-slot
editing UI.

---

### 0x021CAA64 (264 B, class E, overlay=ov006)

**Original verdict:** E — "loop with attr-setter calls, reg shuffles"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_SubObj_E_RenderFull` in
`_names_overlay006.md`. A textbook instance of the `func_02021660`/
`func_020216b0` OBJ-attribute-setter idiom documented exhaustively in
`dossiers-high/02021660.md` and reused throughout the whole R8
battle-animation family. Loop bound is a hard-coded constant (2), every
field-setter call uses a literal field ID.

**Struct/data dependencies:**
- `self` (arg0) — `+0x58` (horizontal offset), `+0x5c`/`+0x60`/`+0x68`
  (threshold comparisons), `+0x78`/`+0x7c` (accumulator bases), `+0x88`
  (divisor-count).

**Ground-truth pool words:** none.

**Ground-truth BL targets (verbatim, in call order):**

```
func_02021660    (x2)
func_020216b0      (x12: 6 per iteration x 2 iterations)
```

**C sketch:**

```c
int func_ov006_021caa64(SomeBase *self) {
    int neg_boundary = 1 - self->f60;

    for (int i = 0; i < 2; i++, neg_boundary += 2) {
        int obj = func_02021660(self->f0, 5, i);

        int a = (self->f58 << 3); a = (a + (a >> 31)) >> 1;
        int pos_x = a + self->f78 + ((neg_boundary << 6) >> 1);
        int row_off = self->f7c + (self->f5c << 3);
        int tag = row_off - 0x16;

        int orient = (i == self->f88) ? 2 : (i < self->f60 ? 1 : 0);
        int label = (i < self->f60) ? (0xc9 | 0x800) : 0;

        func_020216b0(obj, 3, tag);
        func_020216b0(obj, 4, pos_x);
        func_020216b0(obj, 0x11, 1);
        func_020216b0(obj, 0x12, 0);
        func_020216b0(obj, 0xd, orient);
        func_020216b0(obj, 0, label);
    }
    return 1;
}
```

The position-compute arithmetic (`+0x58`/`+0x78`/`+0x7c` combine with a
`lsl#3`/`asr#1` rounding pattern applied twice) is intricate; objdiff will
validate the precise C shape, but every operand traces to a resolved struct
field or literal, so this is classification-clean.

---

### 0x021C6530 (272 B, class E, overlay=ov006)

**Original verdict:** E — "predicated cmp chains (ldrge/cmple) across
loops; coin-flip"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_SpellTrap_HelperC` in
`_names_overlay006.md`. Both loops have fixed compile-time bounds (3 and 6
iterations), each scanning a small literal-count table for a bounding-box
hit test. `func_ov006_021c6f24` is a fully-read boolean predicate consumed
purely as a guard. `data_ov006_0225deb4` is already documented as the
`Ov006_SubObj_B_Init` state object.

**Struct/data dependencies:**
- `self` (arg0) — `+0x4c` (index into a stride-0x10 array at `+0x6c`).
- `data_ov006_021ce084` — 3-entry, stride-0xc bounding-box table
  (`x0`/`y0`/`x1`/`y1`/`tag`) — NOT in the Type A/B/C/D catalog (see New KB
  gaps).
- `data_ov006_0225deb4` — `Ov006_SubObj_B_Init` state object (already
  named).
- `self+0x6c + [+0x4c]*0x10` — stride-0x10 array, `+0x4`(base index)/`+0x8`
  (count), scanned against a fixed 6-entry literal hit-box ladder.

**Ground-truth pool words:**

```
data_ov006_021ce084   ; 3-entry stride-0xc hit-region table
data_ov006_0225deb4    ; Ov006_SubObj_B_Init state object (already named)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021c6f24    (x3, once per loop-1 iteration, up to 3x)
```

**C sketch:**

```c
int func_ov006_021c6530(SubObjE *self, int x, int y, HitResult *out) {
    out->hit = out->tag = out->extra = 0;

    for (int i = 0; i < 3; i++) {
        if (!func_ov006_021c6f24(data_ov006_0225deb4)
            || data_ov006_021ce084[i].tag != 2) {
            HitBox *e = &data_ov006_021ce084[i];
            if (x >= e->x0 && x < e->x1 && y >= e->y0 && y <= e->y1) {
                out->hit = 1;
                out->tag = e->tag;
                return 1;
            }
        }
    }

    int base_idx = self->f4c;
    StrideRec *rec = (StrideRec *)((char *)self + 0x6c + base_idx * 0x10);
    for (int i = 0, xlo = 0xc, xhi = 0xde, ylo = 0x21, yhi = 0x31;
         i < 6; i++, ylo += 0x16, yhi += 0x16) {
        int idx = rec->f4 + i;
        if (idx < 0 || idx >= rec->f8) continue;
        if (x < xlo || x >= xhi) continue;
        if (y < ylo || y >= yhi) continue;
        out->hit = 1; out->tag = 2; out->extra = i;
        return 1;
    }

    return 0;
}
```

---

### 0x021C6840 (284 B, class F, overlay=ov006)

**Original verdict:** F — "11 calls, bitfield, loop+branches; medium-big
body"

**Verdict: TRACTABLE (risk-noted)**

**Upgrade reason:** Named `Ov006_SpellTrap_HelperG` in
`_names_overlay006.md`. `data_02104f4c` (language cluster) and the whole
render-primitive call set are all already catalogued and used throughout
this batch. Loop bound is a hard 6-iteration constant with a data-dependent
(but bounded) inner range-test.

**Struct/data dependencies:**
- `self` (arg0) — `+0x4c` (index into stride-0x10 array at `+0x6c`), `+0x8`
  (task-config handle), `+row*0x10+0x7c` (per-entry flag selecting the
  label source).
- `data_02104f4c+0x4` — language 3-bit field.

**Ground-truth pool words:**

```
data_02104f4c
0x000001cd   ; 461 dec — string-ID literal / geometry base
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208dd9c
func_02094504
func_02001d0c
func_02001d68
func_0202c0c0             (conditional)
func_0202c44c               (conditional, mutually exclusive w/ above)
func_02001d98                 (x up to 12)
func_02005554                    (x up to 6)
func_02004f58                      (x up to 6)
```

**C sketch:**

```c
int func_ov006_021c6840(SomeBase *self) {
    void *vram = func_0208dd9c();
    StrideRec *row_tbl = (StrideRec *)((char *)self + 0x6c + self->f4c * 0x10);

    func_02094504(0, vram + 0xc40, 0x4800);
    func_02001d0c(self + 0x8, 0x20, 0x12);

    int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    func_02001d68(lang);

    int base_pos = 0x1cc - lang;
    for (int i = 0, code = 0xc; i < 6; i++, code += 0x16) {
        int idx = row_tbl->f4 + i;
        if (idx < 0 || idx >= row_tbl->f8) continue;

        StrideRow *entry = (StrideRow *)((char *)self + idx * 0x10);
        char *name = (entry->f7c == 0) ? func_0202c0c0(0x1cd) : func_0202c44c();

        func_02001d98(self + 0x8, 5);
        int w = func_02005554(name, 0xc, 5);
        if (w >= 0xa8) func_02001d98(self + 0x8, 4);
        func_02004f58(self + 0x8, name, vram + 0xc40, 0x13, code);
        func_02001d98(self + 0x8, base_pos);
    }
    return 1;
}
```

**Match-difficulty risk note:** The row-loop code counter and `base_pos` are
both live across the entire 6-iteration loop spanning up to 5 `bl` calls per
pass — a genuine "heavy liveness across bl calls" risk (distinct from the
specific permuter-class post-blx-rotation pattern of `021c4bd4`/`021c9030`).
Classification is fully clean; expect 1+ reshape iteration on the stack-arg
packing before an exact match.

---

### 0x021C3384 (316 B, class F, overlay=ov006)

**Original verdict:** F — "loop with 10 calls, many marshalled struct
fields, heavy liveness"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Hand_PhaseD` in `_names_overlay006.md`.
The exact `func_02021660`/`func_020216b0` OBJ-attribute-setter idiom (8-field
sequence per iteration, same shape as R8's `021bbe7c`/`021bc0cc`) over a
fixed 8-iteration loop. `data_ov006_021cdf88` matches the already-documented
`Row32ac` struct (`dossiers/021c32ac.md`, confirms both stride and field
types). `data_ov006_021cddec` is the sibling parallel table.

**Struct/data dependencies:**
- `self` (arg0) — `+0x5c`/`+0x60` (compared against row fields), `+0x68`
  (gate flag), `+0x98` (secondary index compare).
- `data_ov006_021cdf88` — already-documented `Row32ac` struct: `+0x0`/`+0x2`
  (s16, →field 3/4), `+0x4`/`+0x6` (s16, compared against self fields),
  `+0x8`/`+0xa` (s16, →field 0x11/0x12), `+0xc`/`+0x10`/`+0x14` (word,
  →field 0xc/0xd fallback/0xd alt-branch).
- `data_ov006_021cddec` — s16 array, indexed directly by loop var, →field
  0xe.

**Ground-truth pool words:**

```
data_ov006_021cdf88   ; Row32ac struct (already documented)
data_ov006_021cddec    ; parallel s16 array
0x000001c1              ; OBJ-attribute base flags literal
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02021660     (x8)
func_020216b0        (x72: 9 per iteration x 8 iterations)
```

**C sketch:**

```c
int func_ov006_021c3384(Ov006Battle *self) {
    Row32ac *row = &data_ov006_021cdf88[0];

    for (int i = 0; i < 8; i++, row++) {
        int obj = func_02021660(self, 5, i);

        int f8;
        if (i >= 1 && i <= 7) {
            if (row->f4 == self->f5c && row->f6 == self->f60) {
                f8 = (self->f68 != 0) ? row->f14 : row->f10;
            } else {
                f8 = row->f10;
            }
        } else {
            f8 = (i == self->f98) ? row->f18 : row->f10;
        }

        func_020216b0(obj, 2, i);
        func_020216b0(obj, 3, row->f0);
        func_020216b0(obj, 4, row->f2);
        func_020216b0(obj, 0x11, row->f8);
        func_020216b0(obj, 0x12, row->fa);
        func_020216b0(obj, 0xc, row->fc);
        func_020216b0(obj, 0xd, f8);
        func_020216b0(obj, 0xe, data_ov006_021cddec[i]);
        func_020216b0(obj, 0, 0x1c1);
    }
    return 1;
}
```

---

### 0x021B81DC (320 B, class F, overlay=ov006) — re-examined, was stale

WALL in R6

**Original verdict:** F — "large switch plus loop, heavy reg-alloc" (R6's
`Ov004Ov006Deep.md` marked this WALL at a stale ~100-byte estimate, "Filter
slot, reg-alloc wall.")

**Verdict: TRACTABLE (clean)** — R6's WALL verdict does not hold under fresh
examination.

**Upgrade reason:** Named `Ov006_Slot_FilterBySlot` in `overlay006.md`/
`_names_overlay006.md` at HIGH confidence: "filters pool entries by slot
eligibility using 021b9a00 predicate; builds filtered list" — an exact
independent match for the ground truth. `func_ov006_021b9a00`
(`Ov006_Pool_FilterCard`) is already fully documented, taking `(filter_idx,
card)` and returning bool. Per this project's explicit R8 precedent (calling
a permuter-class sibling via a plain `bl` with literal args does not make the
caller itself unmatchable), `021b81dc`'s own classification is unaffected.
The 5-way slot-base resolver is the identical add-chain idiom seen in
`021b70fc` (below) and R6's `021b843c`/`021b831c`.

**Struct/data dependencies:**
- 5-way switch on slot (0-4) selecting `dst`/`src` base addresses — same
  region-offset family as `021b6e3c`/`021b70fc`/`021b805c`.
- `data_ov006_0224f400` — stride table A (already documented): `mla(slot,
  0xe, base)` gives a per-slot row pointer, then `[+0x60]` — a NEW specific
  offset within this already-documented family (see New KB gaps).
- `data_ov006_0224f3e0` — filter-criteria bitmask header (already
  documented): `+0x2` cleared then OR-accumulated from a 7-bit scan of the
  per-slot row.

**Ground-truth pool words:** `data_ov006_0224f400`, `data_ov006_0224f3e0`.

**Ground-truth BL targets:**

```
func_ov006_021b9a00   (per source-list entry, bounded by the row's count field)
```

**C sketch:**

```c
int func_ov006_021b81dc(char *self, int slot) {
    char *dst, *src;
    switch (slot) {
    case 0: dst = self + 0x1d8 + 0x8000; src = self + 0x2a0 + 0x6000; break;
    case 1: dst = self + 0x158 + 0xb000; src = self + 0xa60 + 0x7000; break;
    case 2: dst = self + 0x358 + 0xb400; src = self + 0xc60 + 0x7000; break;
    case 3: dst = self + 0x158 + 0xbc00; src = self + 0xe60 + 0x7000; break;
    default: dst = self + 0x358 + 0xc000; src = self + 0x60  + 0x8000; break;
    }

    s16 *row = &data_ov006_0224f400[slot * 14];
    u16 total = *(u16 *)((char *)row + 0x60);

    u16 flags = 0;
    for (int b = 0; b < 7; b++) if (row[b] >= 0) flags |= (1 << b);
    data_ov006_0224f3e0.filter_flags = flags;

    int match_count = 0;
    for (int i = 0; i < (int)total; i++, src += 4) {
        u16 card_id = *(u16 *)src;
        if (func_ov006_021b9a00(slot, card_id)) {
            *(u16 *)dst = card_id;
            *(u8 *)(dst + 2) = *(u8 *)(src + 2);
            dst += 4;
            match_count++;
        }
    }

    *(u16 *)(self + slot * 2 + 0xc600 + 0x58) = (u16)match_count;
    return 1;
}
```

---

### 0x021B70FC (324 B, class F, overlay=ov006) — re-examined, was stale

WALL in R6

**Original verdict:** F — "324B switch-in-loop, nested calls" (R6's
`Ov004Ov006Deep.md` marked this WALL at a stale ~101-byte estimate, "10-
saved-reg nested loops.")

**Verdict: TRACTABLE (clean)** — R6's WALL verdict does not hold under fresh
examination.

**Upgrade reason:** Named `Ov006_CardPool_UpdateSort` in `overlay006.md`/
`_names_overlay006.md` ("updates sorted list after card state change"). The
outer "switch" is a bounded 5-state sequential loop, each state selecting
one of 4 already-documented slot-region bases matching R6's own
`021b843c`/`021b81dc` region-offset family. Inner loop calls the
already-MATCHED `func_ov006_021b7010` (`Ov006_CardPool_AdjustSlot`, MED, R6)
exactly 3 times per source-list entry with literal mode args. `func_0200974c`
(`Overlay_LoadThunk`, MATCHED main-binary trivial thunk) is called once at
entry.

**Struct/data dependencies:**
- Slot-region source list, same family as `021b81dc`/`021b6e3c`.
- `[sp+0]`/`[sp+4]` — local loop-state counter and per-state source-list
  base pointer.
- `[self+state*2+0x8100+0x60]` — count field for the current state's list
  (same "count field" pattern family as `021b6d00`).
- `fp` = `func_0200974c(self)`'s return value, reused as an "active slot"
  boolean gate.

**Ground-truth pool words:** none.

**Ground-truth BL targets (verbatim, in call order):**

```
func_0200974c                          (x1, at entry)
func_ov006_021b7010     (x3 per source-list entry: mode=3, mode=1, mode=2)
func_0202b9b0              (x1 per source-list entry)
```

**C sketch:**

```c
int func_ov006_021b70fc(char *self) {
    int active_ctx = func_0200974c(self);
    int latched = 0;

    for (int state = 0; state < 5; state++) {
        char *src_base;
        switch (state) {
        case 0: src_base = self + 0x1d8 + 0x8000; break;
        case 1: src_base = self + 0xa60 + 0x7000; break;
        case 2: src_base = self + 0xc60 + 0x7000; break;
        default: src_base = self + 0xe60 + 0x7000; break;  /* covers 3 and 4 */
        }

        u16 count = *(u16 *)(self + state * 2 + 0x8100 + 0x60);
        if (count <= 0) {
            if (state == 4) return 0;
            continue;
        }

        u16 *entry = (u16 *)src_base;
        for (int i = 0; i < (int)count; i++, entry += 2) {
            u16 card_id = *entry;
            int w3 = func_ov006_021b7010(self, 3, card_id, 0);
            int w1 = func_ov006_021b7010(self, 1, card_id, 0);
            int w2 = func_ov006_021b7010(self, 2, card_id, 0);
            int total = w1 + w2 + w3;
            int threshold = func_0202b9b0(card_id);

            if (total > threshold) {
                int is_bad_case = (total == 1 && threshold == 0);
                if (!is_bad_case && active_ctx != 0 && !latched) {
                    latched = 1;
                    return (int)card_id;
                }
            }
        }

        if (state == 4) break;
    }
    return 0;
}
```

The early-return value is the matched card_id, not just a boolean (per
`ldrh r0,[r9]` at the tail); the `cmpne r0,#4` state-4 early-exit and the
`is_bad_case` gate are both literal-comparison chains fully resolved from
the `.s` — no runtime-unknown branch anywhere.

---

### 0x021C5DF0 (340 B, class F, overlay=ov006)

**Original verdict:** F — "340B loop, stacked args, guard chains; big-body"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_SpellTrap_PhaseF` in `_names_overlay006.md`.
Another instance of the `func_02021660`/`func_020216b0` OBJ-attribute idiom,
fixed 2-iteration outer loop, every literal directly readable, with the only
data dependency being small already-referenced fields.

**Struct/data dependencies:**
- `self` (arg0) — `+0x4c` (row-array index), `+0x50` (gates the "extra" tag
  branch).
- `[self+0x6c+f4c*0x10]` — stride-0x10 row, field `+0x0` (range-tested
  `[0,6)`).

**Ground-truth pool words:** `0x000001c1` (OBJ-attribute base flags, same
family literal as `021c3384`).

**Ground-truth BL targets (verbatim, in call order):**

```
func_02021660    (x2)
func_020216b0      (x16: 8 per iteration x 2 iterations)
```

**C sketch:**

```c
int func_ov006_021c5df0(SomeBase *self) {
    StrideRow *row = (StrideRow *)((char *)self + 0x6c + self->f4c * 0x10);

    for (int pass = 0; pass < 2; pass++) {
        int sel = (pass == 0) ? 0x20 : 0x7;
        int obj = func_02021660(self->f0, 5, sel);

        int row_val = row->f0;
        int in_range = (self->f50 != 0 && row_val >= 0 && row_val < 6);
        int extra_flag = (pass == 0)
            ? (in_range ? (0x1c1 + 0x28) : 0)
            : (in_range ? 0x1c1 : 0);

        int b_lo = (pass == 0) ? 1 : 0xc;
        int b_hi = (pass == 0) ? 8 : 0xc;
        int f4 = row_val * 0x16 + (pass == 0 ? 0x1e : 0x21);

        func_020216b0(obj, 2, sel);
        func_020216b0(obj, 3, b_lo);
        func_020216b0(obj, 4, f4);
        func_020216b0(obj, 0x11, 3);
        func_020216b0(obj, 0x12, 0);
        func_020216b0(obj, 0xc, 0);
        func_020216b0(obj, 0xd, b_hi);
        func_020216b0(obj, 0, extra_flag);
    }
    return 1;
}
```

The exact `extra_flag` gate value needs objdiff confirmation of the precise
literal; every dependency traces to already-established struct fields.

---

### 0x021B8A88 (364 B, class F, overlay=ov006)

**Original verdict:** F — "big double-loop with shift bit-set, heavy"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Slot_RenderVariant` in `overlay006.md`/
`_names_overlay006.md`. Two structurally-parallel loops (50 then 32
iterations, both hard compile-time bounds), each calling the already-
catalogued `func_ov006_021b6ad8` as sole guard, plus already-MATCHED
main-binary functions `func_02008f24` (`Render_FinishSlot`) and
`func_02012418`. The "shift bit-set" is the standard signed-div-by-32 idiom
computing a word/bit-index pair into a 4-byte-stride bitfield array —
well-established elsewhere in this codebase.

**Struct/data dependencies:**
- `self` (arg0) — `+0x248`/`+0x264` (loop-1 stride-0x124 arrays),
  `+0x5f00+i*2+0xd0` (loop-1 result store), `+0x6000+(i/32)*4+0xb4` (loop-1
  bitfield word), `+0x6234` (loop-1 total), `+0xb50+0x3000`/`+0x36c+0x3800`
  (loop-2 stride-0x124 arrays), `+0x6000+i*2+0x34`/`+0x74` (loop-2 halfword
  results), `+0x6000+(i/32)*4+0x1b4` (loop-2 bitfield word), `+0x6238`
  (loop-2 total).

**Ground-truth pool words:** none.

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021b6ad8    (x50, guard)
func_02008f24             (x up to 50, guard-true, loop 1)
func_02012418               (x up to 50, guard-true, loop 1)
func_ov006_021b6ad8            (x32, guard)
func_02008f24                     (x up to 32, guard-true, loop 2)
func_02012418                       (x up to 32, guard-true, loop 2)
```

**C sketch:**

```c
int func_ov006_021b8a88(char *self) {
    int count1 = 0;
    char *r8 = self + 0x248, *r9 = self + 0x264;
    for (int i = 0; i < 0x32; i++, r8 += 0x124, r9 += 0x124) {
        if (func_ov006_021b6ad8(self, 0, i, 1)) {
            u16 v = func_02008f24(0, i, r8);
            func_02012418(r9);

            *(u16 *)(self + i * 2 + 0x5f00 + 0xd0) = v;
            u32 *bitword = (u32 *)(self + (i >> 5) * 4 + 0x6000 + 0xb4);
            *bitword |= (1u << (i & 0x1f));

            count1++;
        }
    }
    *(int *)(self + 0x6000 + 0x234) = count1;

    int count2 = 0;
    char *rb = self + 0xb50 + 0x3000, *rc = self + 0x36c + 0x3800;
    for (int i = 0; i < 0x20; i++, rb += 0x124, rc += 0x124) {
        if (func_ov006_021b6ad8(self, 1, i, 1)) {
            u16 v = func_02008f24(1, i, rb);
            func_02012418(rc);

            *(u16 *)(self + i * 2 + 0x6000 + 0x34) = v;
            *(u16 *)(self + i * 2 + 0x6000 + 0x74) = i;
            u32 *bitword = (u32 *)(self + (i >> 5) * 4 + 0x6000 + 0x1b4);
            *bitword |= (1u << (i & 0x1f));

            count2++;
        }
    }
    *(int *)(self + 0x6000 + 0x238) = count2;
    return 1;
}
```

---

### 0x021C7D60 (380 B, class F, overlay=ov006)

**Original verdict:** F — "clamp body w/ mla index, many smul/cmp branches,
heavy liveness"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_SubObj_D_Update` in `_names_overlay006.md`.
`data_02104f4c` (language field) selects between `data_ov006_021ce650` /
`data_ov006_021ce8a8`, both already fully documented in
`dossiers/021c9c54.md` as the "E9c54" 20-byte-stride row struct — the exact
`chan==0 ? 021ce650 : 021ce8a8` channel-select ternary reused here. All
arithmetic is deterministic clamp/bounds math against already-known fields.

**Struct/data dependencies:**
- `self` (arg0) — `+0x74` (row-table index), `+0x78`/`+0x7c` (clamp-bound
  multipliers), `+0x88`/`+0x8c`/`+0x90`/`+0x94`/`+0x98`/`+0x9c`
  (accumulator fields).
- `data_02104f4c+0x4` — language 3-bit field, selects the E9c54 row-table
  base.
- E9c54 row fields (documented): `+0x8`/`+0x9` (u8, scaled x0x14), `+0x2`
  (s16, tri-state discriminant).

**Ground-truth pool words (verbatim):**

```
data_02104f4c
data_ov006_021ce650   ; E9c54 row table, channel 0
data_ov006_021ce8a8    ; E9c54 row table, channel else
0x000001ff              ; bit-pack mask
0x04001014               ; MMIO register (BG2PB-family, engine B)
```

**Ground-truth BL targets:** none (leaf function).

**C sketch:**

```c
int func_ov006_021c7d60(SomeBase *self, int arg_r1, int arg_r2) {
    int idx = self->f74;
    int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    E9c54 *row = (lang == 0 ? data_ov006_021ce650 : data_ov006_021ce8a8) + idx * 20;

    int discriminant = row->f2;
    int r6 = (discriminant == 0) ? 3 : row->f9 * 0x14;
    int lr_base = (discriminant == 1) ? (0xac << 16) : (0xbd << 16);

    int x = arg_r2 - row->f9 * 0x14;
    int y = arg_r1 - row->f8 * 0x14;
    if (y < 3) y = 3;
    else { int hi = 0xfd - self->f78 * 20; if (y > hi) y = hi; }
    if (x < r6) x = r6;
    else { int hi_x = (lr_base >> 16) - self->f7c * 20; if (x > hi_x) x = hi_x; }

    self->f88 = y;
    self->f8c = x;
    self->f98 = self->f9c = 0;

    if (discriminant == 0 || discriminant == 1) {
        self->f98 = -(self->f88 + self->f90);
    }

    int a = -(self->f88 - 8);
    int b = -(self->f8c - 8);
    *(vu32 *)0x04001014 = (a & 0x1ff) | ((b & 0x1ff) << 16);

    int sum_y = self->f88 + self->f90 + self->f94 + self->f9c;
    int sum_x = self->f8c + self->f9c;
    *(vu32 *)(0x04001014 + 4) = ((-sum_y) & 0x1ff) | (((-sum_x) & 0x1ff) << 16);

    return 1;
}
```

The final two-sum combine's exact field pairing needs objdiff confirmation
(approximated above); every field is already a resolved offset from the
function's own earlier writes, so no data dependency is unresolved.

---

### 0x021B805C (384 B, class F, overlay=ov006)

**Original verdict:** F — "384B nested copy loops, many live temps"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Slot_HandleInput` in `overlay006.md`/
`_names_overlay006.md`. `Fill32` and `func_02094688` are both already-
catalogued primitives. Three structurally-identical nested-loop blocks, each
with an outer count from a documented count field and a per-outer-entry
byte-field inner count, copying a halfword into a destination array.

**Struct/data dependencies:**
- `self` (arg0, r4) — `+0x1`/`+0x0` (source for the entry-copy at function
  start), `+0x8100+0x62/0x64/0x66` (three u16 outer-loop bounds), `+0x140`/
  `+0x144`/`+0x148` (three running totals), `+0xa60+0x7000`/`+0xc60+0x7000`/
  `+0xe60+0x7000` (three source-row arrays, same region-offset family as
  `021b81dc`/`021b70fc`), `+0x100+idx*2+0x4c`/`+0xec`/`+0x200+idx*2+0xa`
  (three destination halfword arrays).

**Ground-truth pool words:** none.

**Ground-truth BL targets (verbatim, in call order):**

```
Fill32              (x1, at entry)
func_02094688         (x1, at entry)
```

**C sketch:**

```c
int func_ov006_021b805c(char *self) {
    Fill32(self + 0x124, 0, 0x124);
    func_02094688(self + 1, self + 0x25 + 0x100, 0x19);
    self[0x124] = self[0];

    int total1 = 0;
    u16 count1 = *(u16 *)(self + 0x8100 + 0x62);
    SrcRow *row1 = (SrcRow *)(self + 0xa60 + 0x7000);
    for (int o = 0; o < (int)count1; o++, row1++)
        for (int j = 0; j < row1->f2; j++, total1++)
            *(u16 *)(self + total1 * 2 + 0x100 + 0x4c) = row1->f0;
    *(int *)(self + 0x140) = total1;

    int total2 = 0;
    u16 count2 = *(u16 *)(self + 0x8100 + 0x64);
    SrcRow *row2 = (SrcRow *)(self + 0xc60 + 0x7000);
    for (int o = 0; o < (int)count2; o++, row2++)
        for (int j = 0; j < row2->f2; j++, total2++)
            *(u16 *)(self + total2 * 2 + 0x100 + 0xec) = row2->f0;
    *(int *)(self + 0x144) = total2;

    int total3 = 0;
    u16 count3 = *(u16 *)(self + 0x8100 + 0x66);
    SrcRow *row3 = (SrcRow *)(self + 0xe60 + 0x7000);
    for (int o = 0; o < (int)count3; o++, row3++)
        for (int j = 0; j < row3->f2; j++, total3++)
            *(u16 *)(self + total3 * 2 + 0x200 + 0xa) = row3->f0;
    *(int *)(self + 0x148) = total3;

    return 1;
}
```

`SrcRow` here is the same 4-byte-stride `{u16 card_id; u8 type; u8 count}`
shape already implied by `021b81dc`'s source-list scan, confirming both
functions share the exact same slot-region source-list struct.

---

### 0x021CB158 (384 B, class F, overlay=ov006)

**Original verdict:** F — "nested loops heavy ror/shift addressing,
liveness"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Tile_Blit8x8` in `_names_overlay006.md` at
HIGH confidence: "pixel-blit: iterates 8x8 blocks, looks up palette nibble,
calls func_02094688; 19 callers — top-5 hub." Confirmed by direct read: an
8x8 nested loop computing tile-row/col addressing via the standard
`asr/lsr/ror` sign-correct modulo-32 pattern, a palette-nibble extract, and
one `func_02094688` call per block. `func_0201d710` (`NARC_GetBGDTAlignedPtr`,
already MATCHED) resolves the base tile pointer. This function is itself
called by `021c0c14` below, confirming its central-hub role.

**Struct/data dependencies:**
- `self` (arg0) — `+0x14` (row-count multiplier), `+0x48` (base tile-source
  offset), `+0x4c` (byte-select source pointer for the palette nibble).

**Ground-truth pool words:** none.

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201d710      (x1, at entry)
func_02094688         (x up to 64: once per inner 8x8-block iteration, nonzero-nibble only)
```

**C sketch:**

```c
int func_ov006_021cb158(char *self, int tileset_sel, int tile_idx, int base_mul, int coord) {
    int row_stride_mul = ((coord >> 2) + ((unsigned)coord >> 0x1d) >> 3) * self->f14;
    char *tile_base = self[tileset_sel * 4] + row_stride_mul * 0x20;
    char *nibble_src = (char *)(self->f48 + row_stride_mul);

    for (int fp = 0; fp < 8; fp++) {
        int y = coord + fp;
        for (int r8 = 0; r8 < 8; r8++) {
            int x = base_mul + r8;
            int y_div8 = (y >= 0) ? y * 4 : 0;
            int x_div8 = (x >= 0) ? 0x20 : 0;

            char *tile_ptr = tile_base + x_div8 + y_div8 + (base_mul >> 1);
            int linear = r8 + fp * 8;
            u8 raw = nibble_src[linear >> 1];
            u8 nibble = (linear & 1) ? ((raw & 0xf0) >> 4) : (raw & 0xf);

            if (nibble != 0) {
                u8 buf = nibble;
                func_02094688(&buf, tile_ptr, 1);
            }
        }
    }
    return 1;
}
```

**Match-difficulty risk note:** The exact tile-addressing arithmetic
(multiple chained `asr`/`lsr`/`ror` sign-correct sequences computing
`y/8, y%8, x/8, x%8` from two packed coordinate args) is intricate; the
sketch above is a best-effort reconstruction rather than byte-exact, but
every operand is register/struct-local (no unresolved data dependency), so
classification is clean. Expect objdiff iteration to nail the precise
shift/rotate sequence — a "verify shift amounts against orig" risk, not
permuter-class register rotation.

---

### 0x021C358C (392 B, class F, overlay=ov006)

**Original verdict:** F — "392B loop, many spills, stacked args, nested
guards"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Hand_PhaseF` in `_names_overlay006.md`.
Structurally identical to `021c6840`/`021c5df0` (same 2-iteration
`func_02021660`/`func_020216b0` OBJ-setter pattern, same stride-row
addressing family as `021c4bd4`), plus a `data_ov006_0225e068`
(already-documented audio/engine struct pointer, R4) zero-check gate — the
exact "zero-check idiom" pattern already documented in R8's `021bbe7c`.

**Struct/data dependencies:**
- `self` (arg0) — `+0x64` (row-array index, same field as `021c4bd4`'s
  `+0x64`), `+0x68` (gate flag, mirrors `021c5df0`'s `+0x50`).
- `data_ov006_0225e068` — audio/engine struct pointer (already documented,
  R4).

**Ground-truth pool words:**

```
0x000001c9              ; OBJ-attribute base flags literal (this function's family)
data_ov006_0225e068     ; audio/engine struct pointer (already documented, R4)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02021660    (x2)
func_020216b0      (x16: 8 per iteration x 2 iterations)
```

**C sketch:**

```c
int func_ov006_021c358c(SomeBase *self) {
    StrideRow *row = (StrideRow *)((char *)self + 0x9c + self->f64 * 0x10);
    int stashed_val = 0x1c9 - 8;

    for (int pass = 0; pass < 2; pass++) {
        int sel = (pass == 0) ? 0x21 : 0x8;
        int obj = func_02021660(self->f4, 5, sel);

        int row_val = row->f0;
        int in_range = (row_val >= 0 && row_val < 6);

        int flags;
        if (pass == 0) {
            if (!in_range) {
                flags = 0;
            } else {
                int gate = (data_ov006_0225e068.f0 != 0);
                flags = 0x1c9 | (gate ? 0 : 0x20);
            }
        } else {
            flags = stashed_val;
        }

        int b_lo = (pass == 0) ? 0 : 0x13;
        int b_hi = (pass == 0) ? 0xb : 0xf;
        int f4 = row_val * 0x13 + (pass == 0 ? 0x1b : 0x1e);

        func_020216b0(obj, 2, sel);
        func_020216b0(obj, 3, b_lo);
        func_020216b0(obj, 4, f4);
        func_020216b0(obj, 0x11, 3);
        func_020216b0(obj, 0x12, 0);
        func_020216b0(obj, 0xc, 0);
        func_020216b0(obj, 0xd, b_hi);
        func_020216b0(obj, 0, flags);
    }
    return 1;
}
```

---

### 0x021BF2A4 (432 B, class F, overlay=ov006)

**Original verdict:** F — "432 bytes, 17 calls, many branches, big body"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Engine_UpdateMain` in
`_names_overlay006.md`, and independently corroborated as
`Ov006_Battle_HandleLose` by R8's own recipe-sketch citations at two
separate call sites (`021ba1f8` case 3, and a sibling dispatch elsewhere) —
consistent naming across two independent doc sources is a strong
tractability signal. Every callee is an already-catalogued render/text
primitive used pervasively across R6/R7/R8.

**Struct/data dependencies:**
- `self` (arg0) — `+0x4` (task-config handle).
- `data_02104f4c` — `+0x4` (language field, read 4x), `+0x6c` (threshold
  count, indirectly via `data_ov006_02257548+0x6c`).
- `data_ov006_02257548` — only `+0x6c` confirmed (u16, matches R6's own
  `021be558` sibling note: "`d = *(u16*)(G+0x6c) - *(u16*)(G+0x76)`"); full
  struct shape beyond `+0x6c`/`+0x76` remains a gap (see New KB gaps).
- `data_ov006_0224f448` — card-slot object base, passed to
  `func_ov006_021b9dec`/`_9e08`.

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448
data_ov006_02257548     ; +0x6c field confirmed; full shape a gap
data_02104f4c
0x00000482                ; string ID 1154
0x0000047f                 ; string ID 1151
0x00000481                  ; string ID 1153
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208dd9c
func_02094504
func_02001d68
func_02001d68          (x2 total)
func_02001d84            (conditional)
func_02001d98              (conditional, alternate branch)
func_0202c0c0                (conditional — string-ID 0x482)
func_0202c0c0                (conditional — string-ID 0x47f)
func_ov006_021b9e08              (conditional, threshold < 0xa)
func_ov006_021b9dec                (conditional, threshold < 0xa, default sub-path)
func_02091554                        (conditional, tail of threshold<0xa block)
func_0202c0c0                          (conditional — string-ID 0x481)
func_020054f0                            (conditional, lang==0 measure)
func_02005554                              (conditional, lang!=0 measure)
func_02004f58
func_02001d84
func_02001d98
```

**C sketch:**

```c
int func_ov006_021bf2a4(char *self) {
    void *vram = func_0208dd9c();
    u16 threshold = data_ov006_02257548.f6c;

    func_02094504(0, vram + 0x40, 0x800);

    int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    func_02001d68(lang);

    lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    if (lang != 0) func_02001d98(self + 4, 5);
    else            func_02001d84(self + 4, 9, 0);

    char *msg;
    lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    if (lang != 0) {
        msg = func_0202c0c0(0x482);
    } else if (threshold == 0) {
        msg = func_0202c0c0(0x47f);
    } else if (threshold < 0xa) {
        char buf[32];
        func_ov006_021b9e08(msg, 10 - threshold, buf);   /* or _9dec, mode-dependent */
        char *dyn = func_0202c0c0(0x480);
        func_02091554(buf + 0x20, dyn, buf);
        msg = buf + 0x20;
    } else {
        msg = func_0202c0c0(0x481);
    }

    int w;
    lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    if (lang != 0) w = func_02005554(msg, 0xc, 5);
    else            w = func_020054f0(msg, 0xc, 9);

    int off = (w + (w >> 31)) >> 1;
    func_02004f58(self + 4, msg, vram + 0x40, 0xa4 - off, 4);
    func_02001d84(self + 4, 0, 0);
    func_02001d98(self + 4, -1);

    return 1;
}
```

---

### 0x021C9030 (432 B, class E, overlay=ov006)

**Original verdict:** E — "mla + switch + post-blx reg shuffle;
permuter-class"

**Verdict: TRACTABLE (risk-noted)** — explicitly flagged permuter-class;
concretely distinguished below.

**Upgrade reason:** Named `Ov006_AI_SelectCard` in `_names_overlay006.md`.
`func_ov006_021c9c54` is already fully documented (`dossiers/021c9c54.md`):
`(obj, col, row) → cell code`. `func_020b3870` is the already-catalogued
percent/index-compute primitive used throughout the achievement-scan family.
The "switch" is an 8-target bounded computed branch, fully enumerable (7 of
8 targets collapse to just 2 distinguishable code paths).

**Struct/data dependencies:**
- `self` (arg0) — `+0x78`/`+0x7c` (grid dimensions), `+0x88`/`+0x8c` (base
  offsets combined via `mla`, stride 0x14), `+0x74` (mode selector, range
  `[0x16,0x1d]`), `+i*2+0xac` (s16 per-slot sign-test field), `+i/16*4+0x64`
  (bitfield word, "reroll" bit).

**Ground-truth pool words:** `0x000008c1` (OBJ-attribute base flags, AI-
family variant).

**Ground-truth BL targets (verbatim, in call order):**

```
func_020b3870      (x2 per loop iteration: col then row, loop bound 0x23=35)
func_ov006_021c9c54    (x1 per loop iteration)
func_02021660             (x1 per loop iteration)
func_020216b0               (x8 per loop iteration)
```

**C sketch:**

```c
int func_ov006_021c9030(char *self) {
    for (int i = 0; i < 0x23; i++) {
        int w = self->f78, h = self->f7c;
        u32 flags = 0x8c1;
        int sl, f3, f4;

        if (i >= w * h) {
            sl = 0; flags = 0; f3 = f4 = 0;
        } else {
            int col = func_020b3870(i, w);
            int row = func_020b3870(i, w);
            f3 = self->f88 + 9 + col * 0x14;
            f4 = self->f8c + 9 + row * 0x14;

            int cell = func_ov006_021c9c54(self, row, col);
            sl = cell;

            if (cell >= 0) {
                int mode = self->f74;
                if (mode == 0x17) {
                    if (*(s16 *)((char *)self + i * 2 + 0xac) < 0) flags = 0x8c1;
                }
                u32 *bitword = (u32 *)((char *)self + (i >> 5) * 4 + 0x64);
                if (*bitword & (1u << (i & 0x1f))) flags |= 4;
            } else {
                sl = 0; flags = 0;
            }
        }

        int obj = func_02021660(self->f0, 5, i + 1);
        func_020216b0(obj, 2, i);
        func_020216b0(obj, 3, f3);
        func_020216b0(obj, 4, f4);
        func_020216b0(obj, 0x11, 1);
        func_020216b0(obj, 0x12, 1);
        func_020216b0(obj, 0xc, 0);
        func_020216b0(obj, 0xd, sl);
        func_020216b0(obj, 0, flags);
    }
    return 1;
}
```

**Match-difficulty risk note (concrete):** The specific post-blx register
rotation: `col`'s result is bound immediately after the first
`func_020b3870` call, then `row`'s result is bound after a *second*
`func_020b3870` call at the same call site pattern (same two args, different
order) — both survive across a subsequent 3rd call
(`func_ov006_021c9c54`) that must not clobber either bound result, then feed
the `mla` compute for `f3`/`f4` afterward. A 3-call-deep liveness chain.
Matches the project's "permuter-class register rotation" pattern (per
memory: niche/low-yield for the actual permuter, but not a classification
wall) — classification is fully clean; expect a permuter run or manual
register-lever work (bind `col`/`row` to explicit named temps immediately,
in call order) to close the exact byte match.

---

### 0x021C0C14 (436 B, class F, overlay=ov006) — genuinely new finding,

cross-referenced but never independently examined by R8

**Original verdict:** F — "436B render/fill, multiple loops, divmod,
stores"

**Cross-check result:** `021c0c14` is cited as an already-**named** callee
(`Ov006_Battle_UpdateHud`) inside R8's own recipe sketches for `021ba1f8` and
`021bb954`, with R8's BL-target lists showing `func_ov006_021c0c14 (x2:
early state, final commit)`. However, R8's own 15-function ov006 examined
list did **not** include `021c0c14` itself — it only ever appears as a call
target inside other functions' write-ups, never independently dossiered.
Confirmed the `.s` file still exists unflipped. **This is a genuinely new R9
finding, not duplicate coverage.** `_names_overlay006.md` independently
proposes `Ov006_Deck_PostProcess` at the exact matching byte size
(0x1b4=436B, "6 callers; calls into deck-render helpers") — two
independently-derived descriptive names for the same address (R8's
battle-family-specific naming pass and the map doc's generic pass converged
from different angles; not a conflict).

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** HIGH-confidence named at the exact matching byte size,
independently corroborated by R8's own citations as a real, frequently-called
sibling in the battle-animation family. Every callee resolves: `Fill32`,
`func_0208dd9c`/`func_02094504` (VRAM/DMA), `func_020b3870`
(achievement-scan primitive), `func_ov006_021cb0d8` (already-named
`Ov006_SubObj_G_Main`), `func_ov006_021cb158` (this doc's own entry above —
`Ov006_Tile_Blit8x8`, called exactly as its "19 callers, top-5 hub"
description predicts).

**Struct/data dependencies:**
- `self` ([sp+4], cached on stack) — `+0x50` (mode selector, `==4` is
  early-return-only), `+0x40` (sub-mode, `==5` selects the "breakdown"
  path).
- `data_ov006_0225e138` — `Ov006_SubObj_G` target object (already
  documented).
- `data_ov006_021cc118` — 9-entry, stride-4 halfword-pair table — NEW (see
  New KB gaps).
- `data_ov006_021cc20c` — stride-0x12(18)-per-row, 2-byte-per-column s16
  table, indexed by `[self+0x50]` — NEW (see New KB gaps).
- `data_ov006_0224f448` — card-slot object base, `+i*2+0x8100+0x7e` (u16
  "extended count" threshold, compared against `0x3e8`=1000).
- `0x66666667` — the already-documented ÷10 smull reciprocal, used for a
  4-iteration digit-style decomposition.

**Ground-truth pool words (verbatim):**

```
data_ov006_0225e138    ; Ov006_SubObj_G target object (already documented)
data_ov006_021cc118     ; 9-entry stride-4 halfword-pair table (NEW)
data_ov006_021cc20c      ; stride-0x12 row table, indexed by [self+0x50] (NEW)
data_ov006_0224f448       ; card-slot object base
0x66666667                  ; smull reciprocal, ÷10 (documented)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208dd9c
func_02094504
Fill32                (x32: fixed 0x20-iteration zero-fill)
func_ov006_021cb0d8      (conditional — only when self->f50 != 4)
func_ov006_021cb158        (x1 per outer iteration where self->f40 != 5, up to 9x)
func_020b3870                 (x8 per outer iteration where self->f40 == 5)
func_ov006_021cb158              (x1 per outer iteration where self->f40 == 5, tail render)
```

**C sketch:**

```c
int func_ov006_021c0c14(char *self) {
    void *vram = func_0208dd9c();
    func_02094504(0, vram + 0x1040, 0x400);

    for (int i = 0, off = 0; i < 0x20; i++, off += 0x20)
        Fill32((char *)(vram + 0x1440) + off, 0, 4);

    if (self->f50 == 4) return 1;

    func_ov006_021cb0d8(data_ov006_0225e138, self + 4, vram + 0x40);

    Ov006DetailTable *entry = &data_ov006_021cc118[0];
    for (int fp = 0; fp < 9; fp++, entry++) {
        int r6 = entry->f2 + 3;
        s16 gate = data_ov006_021cc20c[self->f50 * 9 + fp];

        if (gate == 0 || self->f40 != 5) {
            func_ov006_021cb158(data_ov006_0224f448, 2, 0xf, r6);
            continue;
        }

        u16 total = *(u16 *)((char *)self + fp * 2 + 0x8100 + 0x7e);
        int sl = entry->f0 + (-(total >= 0x3e8));

        int r5 = 0x3e8;
        for (int pass = 0; pass < 4; pass++, r5 /= 10) {
            if (total >= r5 || (total == 0 && r5 == 1)) {
                int digit = total / r5;
                func_ov006_021cb158(data_ov006_0224f448, 2, digit * 10 + total % r5, sl);
                sl += 4;
            }
        }
        func_ov006_021cb158(data_ov006_0224f448, 2, r6, sl);
    }
    return 1;
}
```

**Match-difficulty risk note:** The inner "detail breakdown" loop computes a
4-digit decimal decomposition with a data-dependent early-exit per digit,
interleaved with the `func_020b3870`x2 + `func_ov006_021cb158` calls — a
moderate liveness risk (2-3 live locals survive 1-2 calls per digit pass),
not the severe permuter-class pattern seen in `021c4bd4`/`021c9030`.
Classification itself is fully resolved.

---

### 0x021C4EC4 (440 B, class F, overlay=ov006)

**Original verdict:** F — "440 bytes loop with heavy reg-alloc"

**Verdict: TRACTABLE (clean)**

**Upgrade reason:** Named `Ov006_Hand_HelperO` in `_names_overlay006.md`.
`data_02104f4c` (language cluster) and `data_ov006_021cde2c` (already-
catalogued Type-D data bundle per `Ov004Ov006DataTables.md`) are both
resolved. Every callee is the same already-catalogued render/text primitive
set used throughout this whole batch. Body splits into two mutually-
exclusive branches, one with an internal fixed 2-iteration loop.

**Struct/data dependencies:**
- `self` (arg0) — `+0x58` (index into `data_ov006_021cde2c`), `+0x10`
  (task-config handle), `+0x64` (compared against the loop var in the
  2-iteration branch).
- `data_ov006_021cde2c` — s16 lookup table, tested `==2` to select the major
  branch (Type-D bundle shape, already documented).
- `data_02104f4c+0x4` — language field, read 3x.

**Ground-truth pool words (verbatim):**

```
data_ov006_021cde2c
data_02104f4c
0x0000045b   ; string ID 1115
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208dd9c
func_02094504
func_02001d0c            (mode==2 branch)
func_02001d68              (mode==2 branch)
func_02001d98                (mode==2 branch, pre-loop)
func_0202c0c0                  (x2, per-iteration, mode==2 loop, bound=2)
func_02005554                    (x2, per-iteration, mode==2 loop)
func_02004f58                      (x2, per-iteration, mode==2 loop)
func_02001d98                        (mode==2 branch, post-loop)
func_02001d0c                          (mode!=2 branch)
func_02001d68                            (mode!=2 branch)
func_02001d98                              (mode!=2 branch, pre-render)
func_0202c0c0                                (mode!=2 branch)
func_02005554                                  (mode!=2 branch)
func_02004f58                                    (mode!=2 branch)
func_02001d98                                      (mode!=2 branch, post-render)
```

**C sketch:**

```c
int func_ov006_021c4ec4(SomeBase *self) {
    void *vram = func_0208dd9c();
    void *tile_base = vram + 0x2040 + 0x4000;
    func_02094504(0, tile_base, 0xc00);

    s16 lookup_val = data_ov006_021cde2c[self->f58];
    int mode = (lookup_val == 2) ? 2 : 1;

    if (mode == 2) {
        func_02001d0c(self + 0x10, 0x10);
        int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
        func_02001d68(lang);
        func_02001d98(self + 0x10, 5);

        for (int i = 0, code = 0xc, fp = 5; i < 2; i++, code += 0x16) {
            char *name = func_0202c0c0(i + 0x45b);
            int w = func_02005554(name, code, fp);
            int toast_id = (i == 0) ? 0x43 : 0x3b;
            int off = (w + (w >> 31)) >> 1;
            int pos = toast_id - 1 - off;

            int arg2 = (i == self->f64) ? 5 : 6;
            int arg3 = 6;
            int arg4 = (i == 0) ? 0 : 0x600;
            func_02004f58(self + 0x10, name, tile_base + arg4, pos + arg3, code);
        }
        func_02001d98(self + 0x10, -1);
    } else {
        func_02001d0c(self + 0x10, 0x20);
        int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
        func_02001d68(lang);
        func_02001d98(self + 0x10, 5);

        char *name = func_0202c0c0(0x45b);
        int w = func_02005554(name, 0xc, 5);
        int off = (w + (w >> 31)) >> 1;
        func_02004f58(self + 0x10, name, tile_base, 0x80 - off, 0xc);
        func_02001d98(self + 0x10, -1);
    }

    return 1;
}
```

---

## New KB gaps found

Data globals, struct offsets, or constants needed for the above
classifications but not (fully) documented in the primary KB docs. Each
entry describes what evidence was observed rather than inventing meaning for
unclear fields — do not edit shared KB docs from this list; that is a
follow-up task.

1. **`data_021040ac+0x38`** (ov004, `021c9dd4`) — read as a 6-bit
   blend-alpha scalar (`& 0x3f`). Plain int/byte scalar, general-purpose
   "current frame/blend counter" slot on the global state record.

2. **`data_ov004_0220f1a4`** (ov004, `021cb63c`/`021d6f20`/`021d9fc4`) — new
   global, a pointer/int array indexed `slot_id*4`, written once per call
   with the return value of `func_020054a4` (measured text width). Inferred
   as a per-slot "cached label width" cache, size at least `9*4=0x24` bytes
   (indices 0-8 used across the batch's callers).

3. **`data_ov004_0220e500+0xbd8`** (ov004, `021d9d58`) — new offset on the
   already-partially-catalogued `data_ov004_0220e500` secondary BSS block
   (R6 flagged `+0xcd0`); write-only `int = -1` at function entry. Extends
   the known field set of this block.

4. **`data_ov004_0220b500+0x350`** and the analogous
   `data_0229159c_ptr+0x350`, likely the same underlying table reached two
   different ways (ov004, `021d512c` and `021d38c4`) — a byte-record table,
   stride at least 4 bytes (indexed `idx<<2`), fields at `+1` (type byte,
   compared against `6`), `+2`/`+3` (a range pair, unsigned `+3 < +2`
   compare), and `+0` (a signed byte value consumed on the "invalid" path).
   Confirmed shared between the two functions above — this is the single
   most important unresolved item from the ov004 half of this batch;
   recommend a dedicated cross-reference pass on both functions together
   (neither alone fully resolves it, but the combination gives strong
   converging evidence about its shape).

5. **`data_02104cec`** (ov004, `021d53c0`) — array indexed by a 0/1
   connection-mode flag. Independently referenced elsewhere as a "new
   selector-index array" per `SmallOverlaysRetriageR8.md`'s ov003
   `021cc8b8` entry — this finding extends its known cross-overlay usage
   (same address, a different overlay's `.s` referencing it) but does not
   resolve its full shape.

6. **`data_ov004_0220b500+0x30`/`+0x38`/`+0x3c`** (ov004, `021d53c0` tail
   and `021d512c` all 3 branches) — a recurring 3-field "pending action"
   mini-struct pattern (`id`, `active_flag`, `sub_id`) observed being
   written identically across multiple functions in this batch. Not
   blocking — every individual write is a plain deterministic literal
   store, but worth its own named struct/macro if a future pass wants to
   formalize it.

7. **Map-doc mislabeling of `021cb63c`/`021d6f20`/`021d9fc4`** (not a data
   gap, but a documentation-accuracy issue worth flagging): all three
   currently carry the map-doc name `Ov004_SendStatusMsg`/
   `Ov004_SendStatusMsgB` ("status message sender"), which does not match
   the ground-truth `.s` body (confirmed: `Task_PostLocked`→render→DMA→
   `Task_InvokeLocked` panel-draw idiom, matching R8's
   `Ov004_DrawTradeControls`/`Ov004_DrawInfoText` family, not a message-send
   primitive). Recommend renaming (exact name TBD by whoever owns the map
   doc) when this batch is committed.

8. **`data_ov006_0224f448+outer_sel*0x10+0x4`** (ov006, `021c4bd4`) — a
   stride-0x10 array field read as `[pool_base+0x9c+outer_sel*0x10+0x4]`.
   Closely resembles the already-documented `data_ov006_0225cb88` nested
   stride-0x10 array pattern from R8's `021b40ac` entry, but here the base
   is `data_ov006_0224f448` itself, not a separate global — may indicate
   `0224f448+0x9c` is the start of an embedded stride-0x10 array within the
   card-slot struct. Needs a second confirming caller before naming.

9. **`data_ov006_0224f400+0x60`** (ov006, `021b81dc`) — a u16 "total count"
   field within a per-slot row of the already-documented stride table A.
   The table itself is known; this exact `+0x60` sub-field is a new
   specific offset not previously called out.

10. **`data_ov006_02257548`** (ov006, `021bf2a4`) — only `+0x6c` is
    confirmed (u16), corroborating R6's own partial note on this global from
    the `021be558` sibling. Full struct size/shape beyond `+0x6c`/`+0x76`
    remains unknown.

11. **`data_ov006_021cc118`** (ov006, `021c0c14`) — a 9-entry, stride-4
    halfword-pair table (`+0x0`/`+0x2` both s16). Not present in any primary
    KB doc or in the Type A/B/C/D catalog (too small/different-stride to be
    one of those). New global.

12. **`data_ov006_021cc20c`** (ov006, `021c0c14`) — an s16 table indexed by
    `[self->f50 * 0x12 + fp*2]` (stride 18 bytes per row, 2 bytes per column
    entry), used as a boolean render-gate. Not present in any primary KB
    doc. New global.

13. **`data_ov006_021ce084`** (ov006, `021c6530`) — a 3-entry, stride-0xc
    bounding-box table (`s16 x0, y0, x1, y1` + `word tag`). Not present in
    any primary KB doc or in the Type A/B/C/D catalog. New global.

14. **`func_ov006_021c9030`'s reroll-bitfield source** (`self+word_idx*4
    +0x64`) — a per-AI-slot bitfield array on the Ov006Battle-family struct.
    The `+0x64` offset on this particular struct variant is distinct from
    other already-documented `+0x64` fields seen on OTHER ov006 structs in
    this same batch (e.g. `021c358c`'s self `+0x64`) and is not yet
    cross-referenced against a second caller to confirm it is the same
    field family. Flagged for a future confirming pass.
