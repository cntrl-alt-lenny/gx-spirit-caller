[//]: # (markdownlint-disable MD013 MD041)

# main E/F Re-triage

## Summary

- **Examined:** 80 funcs (size < 300B, non-float-CPSR tier; all 259 candidate .s files confirmed present)
- **Newly tractable:** 8 funcs (clean upgrade — KB directly names all required symbols)
- **Conditionally tractable:** 2 funcs (KB covers most fields; 1–2 undocumented gaps remain)
- **Pattern breakdown:** vtable-slot=2, SDK-math=3, struct-access=3 (GlobalAudioState×2 + GlobalData02104f1c×1)

Global scan covered: `data_021040ac`, `data_02104f58`, `data_02104e6c`, `data_02104bac`,
`data_02104f1c`, `data_02102c7c`, `func_020498f0`, `0x020c4204`, `0x020f8c60`,
`0x020be820`, `0x020b6ec4`, `0x02101fb4`, `0x02102588`.

---

## Newly Tractable Funcs

### 0x020a71e4 (28 bytes, class E)

**Original verdict:** low — "blx through global vtable slot"

**Upgrade reason:** `data_02102958` is now a matched C file (`src/main/data_02102958.c`): it is a
3-entry `void *[3]` array holding pointers to three other data objects. The function loads
`data_02102958`, then loads `[ptr + 0x8]` (index 2), then calls `[index2 + 0x0]`. The blx target
is now fully named — it is the first field of whichever object `data_02102958[2]` points to.

**Struct/data needed:** `data_02102958` (already matched; `void *data_02102958[3]`)

**Assembly:**

```asm
func_020a71e4:
    stmdb sp!, {r3, lr}
    ldr r3, .L_020a71fc       ; r3 = &data_02102958
    ldr r3, [r3, #0x8]        ; r3 = data_02102958[2]
    ldr r3, [r3, #0x0]        ; r3 = *data_02102958[2]   (first field = fn ptr)
    blx r3
    ldmia sp!, {r3, pc}
.L_020a71fc: .word data_02102958
```

**Recipe sketch:**

```c
void func_020a71e4(void) {
    void (*fn)(void) = *(void (**)(void))data_02102958[2];
    fn();
}
```

**Levers:** None expected — only 5 instructions of body; no reg-alloc pressure. Straight
C should match on first attempt with `mwcc 2.0/sp1p5`.

---

### 0x020a724c (28 bytes, class E)

**Original verdict:** low — "blx through global vtable slot"

**Upgrade reason:** Identical pattern to `020a71e4` but calls slot 1 (`[ptr + 0x4]`) instead
of slot 0. `data_02102958` now documented.

**Struct/data needed:** `data_02102958` (already matched)

**Assembly:**

```asm
func_020a724c:
    stmdb sp!, {r3, lr}
    ldr r2, .L_020a7264       ; r2 = &data_02102958
    ldr r2, [r2, #0x8]        ; r2 = data_02102958[2]
    ldr r2, [r2, #0x4]        ; r2 = data_02102958[2]->field1  (second fn ptr)
    blx r2
    ldmia sp!, {r3, pc}
.L_020a7264: .word data_02102958
```

**Recipe sketch:**

```c
void func_020a724c(void) {
    /* typeof(*data_02102958[2]) has at least two fn-ptr fields */
    void (*fn)(void) = ((void (**)(void))data_02102958[2])[1];
    fn();
}
```

**Levers:** Same as `020a71e4` — no pressure expected.

---

### 0x020b1e4c (60 bytes, class E)

**Original verdict:** low — "uint-to-float normalize, clz+shift chains"

**Upgrade reason:** This is the NitroSDK `FX_FX32FromU32` (or equivalent) function: unsigned
integer → FX32 (16.16 fixed-point stored as IEEE-754 single). The pattern is exactly the
MWCC-generated clz+shift+exponent-pack sequence for unsigned inputs; there is no sign bit
extraction because the input is unsigned. The pattern is deterministic — MWCC always
emits this exact instruction sequence for the standard SDK normalization inline.

**Struct/data needed:** None — pure arithmetic, no external references.

**Assembly:**

```asm
func_020b1e4c:
    cmp r0, #0x0
    mov r1, #0x0
    bxeq lr                   ; if (r0 == 0) return 0
    mov r3, #0x400
    add r3, r3, #0x1e         ; r3 = exponent bias = 0x41e (126+1 = bias-1+1)
    bmi .L_50c                ; if r0 was neg treated as huge positive (can't happen for u32)
    clz ip, r0                ; count leading zeros
    movs r0, r0, lsl ip       ; normalize mantissa
    sub r3, r3, ip            ; exponent -= shift count
.L_50c:
    mov r1, r0
    mov r0, r1, lsl #0x15     ; low 11 bits of mantissa → high half (round)
    add r1, r1, r1            ; shift mantissa left 1 (drop implicit 1 bit)
    mov r1, r1, lsr #0xc      ; mantissa >> 12 → 20 bits of significand
    orr r1, r1, r3, lsl #0x14 ; pack exponent into bits 23-30
    bx lr
    ; returns: r0 = low word (partial mantissa), r1 = high word (sign+exp+mantissa)
```

**Recipe sketch:**

```c
/* FX_FX32 float-pack: uint → two-word packed representation */
/* Standard SDK pattern; no coin-flip. Write the C and compiler produces this. */
FX32 func_020b1e4c(unsigned int x) {
    /* mwcc FX inline: clz normalize path */
    return FX32_FromU32(x);  /* or the inline expansion thereof */
}
```

**Levers:** SDK inline expansion — try the exact SDK header function first; if the compiler
doesn't inline identically, write the manual shift sequence in C using `__clz` or the
NitroSDK `OS_CountLeadingZeros`.

---

### 0x020b1e0c (64 bytes, class E)

**Original verdict:** low — "int-to-float normalize, clz+shift chains"

**Upgrade reason:** Signed variant of the same SDK normalization pattern as `020b1e4c`.
Adds a sign-bit extraction (`ands r2, r0, #-2147483648`) and `rsbmi r0, r0, #0` (abs)
before the clz+shift, then ORs the sign back into the result high word. Fully deterministic.

**Struct/data needed:** None.

**Assembly excerpt (sign-handling head):**

```asm
func_020b1e0c:
    ands r2, r0, #-2147483648 ; r2 = sign bit isolated
    rsbmi r0, r0, #0x0        ; r0 = abs(r0)
    cmp r0, #0x0
    mov r1, #0x0
    bxeq lr
    ; ... then identical clz+pack sequence as 020b1e4c ...
    orr r1, r2, r1, lsr #0xc  ; merge sign back
    orr r1, r1, r3, lsl #0x14
    bx lr
```

**Recipe sketch:**

```c
FX32 func_020b1e0c(int x) {
    return FX32_FromS32(x);   /* SDK signed normalization */
}
```

**Levers:** Same SDK inline path as `020b1e4c`. If compiler splits signed/unsigned into
separate paths, write the abs + clz + pack manually.

---

### 0x020b319c (72 bytes, class E)

**Original verdict:** low — "int-to-float normalize, clz+shift+round"

**Upgrade reason:** Same SDK FX signed normalization as `020b1e0c`, extended with
IEEE-754 round-to-nearest-even logic at the tail (checks guard bit `tst r1, #0x80`,
then checks sticky `ands r3, r1, #0x7f`, then conditionally increments). This is the
full `FX_FX32_to_f32` or `FX_FloatToFX32` round path — a fixed SDK function with
deterministic mwcc output.

**Struct/data needed:** None.

**Assembly tail (rounding):**

```asm
    orr r0, r0, r3, lsl #0x17  ; pack sign+exp+mantissa
    bxeq lr                     ; if mantissa was 0, return early
    tst r1, #0x80               ; guard bit set?
    bxeq lr                     ; no → truncate, done
    ands r3, r1, #0x7f          ; sticky bits?
    andeqs r3, r0, #0x1         ; if sticky=0, check LSB (round-half-to-even)
    addne r0, r0, #0x1          ; round up
    bx lr
```

**Recipe sketch:**

```c
float func_020b319c(int x) {
    return (float)x;    /* mwcc generates this exact round-to-nearest sequence */
}
/* Alternative: FX_FloatToFX32 SDK path or __float_fixsfsi intrinsic */
```

**Levers:** Try plain `(float)x` cast first — MWCC 2.0/sp1p5 generates the
clz+rounding path for signed-int-to-float. If the exponent bias constant differs,
check if this is `(double)x` → that uses a slightly different scale.

---

### 0x02009dec (176 bytes, class E)

**Original verdict:** low — "smull divmod chain inside loop, switch-select reg"

**Upgrade reason:** The function loads `data_021040ac` (GlobalAudioState) and accesses
field `+0x38` = `GlobalAudioState.f3c` (documented as `s32 f3c` in GlobalAudioState.md).
The outer structure is a loop over 26 entries of a flat array `data_02104f4c` with stride
`0x1c`, reading a `u8` mode byte at `[entry + 0x56c]` and a `u8` counter at
`[entry + 0x56d]`, writing a computed target to `[entry + 0x56e]`. The magic constant
`0x30c30c31` is a standard compiler-generated divide-by-21 reciprocal. The loop body is
straightforward once the array entry layout is understood.

**Struct/data needed:**
- `GlobalAudioState.f3c` (+0x038 from base `data_021040ac`) — documented
- `data_02104f4c`: 26-entry array, stride 0x1c, with byte fields at relative offsets
  +0x56c, +0x56d, +0x56e (these are accessed as `[base_entry + 0x1000 + relative]`,
  so absolute offsets within each entry are `+0x56c%0x1c` — actually the `+0x1000`
  is added to `data_02104f4c` base, meaning the array is accessed at
  `data_02104f4c + 0x1000 + entry_index * 0x1c`, with byte fields at +0x56c, +0x56d, +0x56e
  relative to that base. Treat as a flat BSS array of 26 structs.)

**Assembly key:**

```asm
    ldr r0, _LIT0              ; data_021040ac (GlobalAudioState)
    ldr r0, [r0, #0x38]       ; GlobalAudioState.f3c
    bl func_020a9950           ; call with f3c as arg
    ; ... then 26-iteration loop over data_02104f4c entries ...
    ldrb r0, [r0, #0x56c]     ; mode byte
    ; switch on mode: 0→skip, 2→movr1=0x14, 3|4→movr1=0xf, else→movr1=0x19
    ; compare counter [+0x56d] with threshold r1
    ; if < threshold: call func_020a991c (RNG?), apply magic-div by 21, store result
_LIT0: .word data_021040ac
```

**Recipe sketch:**

```c
void func_02009dec(void) {
    GlobalAudioState *gas = &data_021040ac;
    func_020a9950(gas->f3c);
    for (int i = 0; i < 26; i++) {
        u8 *entry = (u8 *)&data_02104f4c + 0x1000 + i * 0x1c;
        u8 mode = entry[0x56c];
        if (mode == 0) continue;
        int thresh = (mode == 2) ? 0x14 : (mode == 3 || mode == 4) ? 0xf : 0x19;
        if (entry[0x56d] >= thresh) continue;
        int rng = func_020a991c();
        int scaled = (rng * 0x15) / 21 + 0x14;  /* magic-reciprocal divide */
        entry[0x56e] = (u8)scaled;
    }
}
```

**Levers:** The `smull`-based divide by 21 (`* 0x30c30c31 >> 32 >> 2`) is a
standard compiler reciprocal; write `/ 21` in C and mwcc generates it. No coin-flip
on the smull. Primary risk is the threshold-select register ordering for the `movne`/`moveq`
pair — try `ternary` vs explicit if-else.

---

### 0x02009f50 (196 bytes, class E)

**Original verdict:** low — "binary-search loop, mla, blx callback rotation"

**Upgrade reason:** Same GlobalAudioState.f3c + `data_02104f4c` loop structure as
`02009dec`. This variant uses a 5-arm switch (`addls pc, pc, r0, lsl #2`) on the mode
byte, then applies different modular arithmetic (abs-of-random, `ror`-based) to derive
a signed delta, storing into `entry[0x56d]`. The `func_020a991c` call is the same RNG.

**Struct/data needed:** Same as `02009dec`.

**Assembly key:**

```asm
    ldr r0, [r0, #0x38]       ; GlobalAudioState.f3c
    bl func_020a9950
    ; loop 26 iterations, stride 0x1c
    addls pc, pc, r0, lsl #0x2  ; switch(mode) 0..4
    ; cases: 0→skip, 1→skip(carry), 2→|rng|%4, 3→|rng|%4+1, 4→|rng|%4+2
    ; store into entry[0x56d] clamped: if new < old, store 0; else sub
```

**Recipe sketch:**

```c
void func_02009f50(void) {
    func_020a9950(data_021040ac.f3c);
    for (int i = 0; i < 26; i++) {
        u8 *entry = (u8 *)&data_02104f4c + 0x1000 + i * 0x1c;
        u8 mode = entry[0x56c];
        if (mode == 0 || mode == 1) { /* skip */ continue; }
        int rng = func_020a991c();
        int delta = (rng < 0 ? -rng : rng) & 3;   /* |rng| % 4 */
        int newval = delta + (mode - 2);           /* +0 / +1 / +2 for modes 2,3,4 */
        u8 old = entry[0x56d];
        if (old < newval) { entry[0x56d] = 0; }
        else { entry[0x56d] = old - (u8)newval; }
    }
}
```

**Levers:** The `strltb r4, [r0, #0x56d]` / `subge + strgeb` pair for the clamp is the
main mismatch risk — use the `if (old < newval) ... else ...` form shown. The `ror`-based
abs uses `rsb / lsl / ror` idiom; write `x < 0 ? -x : x` and let the compiler choose.

---

### 0x02006a38 (216 bytes, class F)

**Original verdict:** low — "long init sequence, blx tail, many calls"

**Upgrade reason:** This function loads `data_02104f1c` and accesses six fields:
`f0` (+0x00), `f4` (+0x04), `f8` (+0x08), `f0c` (+0x0C), `f10` (+0x10). The KB
documents `f0`, `f4`, `f10`, `f14`, `f18`, `f1c` — the gap at `+0x08..+0x0F` is
two 4-byte words that this function treats as `s32 f8` and `s32 f0c`. Extending
`GlobalData02104f1c` with those two words is trivial and sufficient to write the C.
The body dispatches two optional "remove" calls (`func_02098734`), then conditionally
enables a DMA/IRQ bit (`[r4, #0x10]` bic/orr of bit 0), then calls three named functions
and builds an index-lookup from `data_020c3e84`.

**Struct/data needed:**
- `GlobalData02104f1c`: extend typedef with `int f8; int f0c;` in the `+0x08..0x0F` gap
- `data_020c3e84`: indexed at `[base + r5 * 8]` and `[base + r6 * 8]` — treat as
  pointer array (8-byte entries, `void *` or struct ptr)

**Assembly excerpt:**

```asm
    ldr r0, .L_02006b04        ; r0 = data_02104f1c
    ldr r4, .L_02006b08        ; r4 = same (literal copy for patcher)
    ldr r2, [r0, #0x10]        ; f10 (u32)
    ldr r1, [r0, #0x8]         ; f8 (s32, gap — now extends KB)
    mov r2, r2, lsl #0x1f
    movs r2, r2, lsr #0x1f     ; test bit 0 of f10
    ldr r7, [r0, #0xc]         ; f0c (s32, gap)
    ldmia r0, {r5, r6}         ; r5=f0, r6=f4 (both documented)
```

**Recipe sketch:**

```c
void func_02006a38(int a, int b, int c, ...) {
    GlobalData02104f1c *d = &data_02104f1c;
    int f7 = d->f0c;
    int f5 = d->f0;
    int f6 = d->f4;
    if (d->f10 & 1) {
        func_02098734(0);
        if (f7 != -1) func_02098734(f7);
        d->f10 &= ~1;
    }
    /* ... conditional enable path ... */
    int ok_a = func_020069f4(f5);
    int ok_b = (f6 != -1) ? func_020069f4(f6) : 0;
    func_0209286c();
    if (ok_a || ok_b) return;
    d->f10 |= 1;
    d->f8 = ((void **)data_020c3e84)[f5 * 2];      /* stride-2 ptr lookup */
    d->f0c = (f6 != -1) ? ((void **)data_020c3e84)[f6 * 2] : -1;
    func_020067f8();
}
```

**Levers:** The `bic/orr` on `[r4, #0x10]` (the literal alias for `data_02104f1c`)
— verify mwcc treats both loads (via symbol and via literal) identically. The
`ldr r2, r2, lsl #0x1f; movs r2, r2, lsr #0x1f` test-bit-0 idiom compiles from
`if (d->f10 & 1)`. Use exact bit-mask expression.

---

## Conditionally Tractable Funcs

These are unlocked by KB for the majority of their body but have 1–2 fields still in
documented gaps. They become fully tractable once those gap fields are confirmed.

### 0x0204ca70 (228 bytes, class F) — conditional

**Blocker fields:**
- `GameSingleton +0x348`: loaded as `s32`, then incremented; likely
  `gs->f348` (a counter in the `+0x300` sub-struct). The GameSingleton.md
  mentions a sub-object at `+0x300` (+0xCE words). `+0x348 - 0x300 = 0x48` into
  that sub-object. Once the sub-struct is named, this becomes `gs->sub.f48`.
- `GameSingleton +0x1a8`: `strb r1, [r0, #0x1a8]` — a flag byte in the gap
  `+0x1A8..+0x1A9`. One confirmed adjacent byte (`+0x1aa = f1aa`); `+0x1a8` is
  one word before.

**KB coverage:** `+0xd`, `+0x17`, `+0x20`, `+0x24`, `+0xa4`, `+0xf4`, `+0x4` — all
documented. The loop body and control flow are simple.

**Action to unblock:** Add `int f348;` to GameSingleton typedef (sub-struct field
at `+0x300 + 0x48`) and `u8 f1a8;` in the `+0x1A8` gap.

### 0x0204bf44 (264 bytes, class E) — conditional

**Blocker fields:**
- `GameSingleton +0x464` and `+0x468`: two consecutive 4-byte words used as
  a struct pointer (`ldr ip, [r5, #0x464]; blx ip`) and a parameter
  (`ldr r1, [r0, #0x468]`). These are in the gap `+0x464..+0x46B`.
  GameSingleton.md notes `+0x46c = f46c` (documented), so `+0x464` and `+0x468`
  are the two 4-byte words immediately before it.

**KB coverage:** `+0x15` (f15), `+0x20c` (f20c) — documented.

**Action to unblock:** Add `void *f464; int f468;` to GameSingleton typedef
in the `+0x464..+0x46B` gap (two words before the documented `+0x46C`).

---

## Confirmed Intractable (representative sample)

| Address | Size | Class | Note | Why still blocked |
|---------|------|-------|------|-------------------|
| 0x02084ac4 | 40 | E | blx through fnptr at [r0+0xc] | Unknown object type — no KB doc for r0's struct |
| 0x020a1bbc | 60 | E | `data_021a98fc[0] + 0x14e4` vtable | No KB doc for `data_021a98fc`; overlay-region ptr |
| 0x0207cd34 | 72 | E (never) | `data_021a0890[0x28]` fn-ptr dispatch | No KB doc for `data_021a0890` |
| 0x020b17ac | 148 | E (never) | 64-bit HAKMEM popcount | Pure constant-chain arithmetic; no C equivalent |
| 0x020059b0 | 176 | E | binary-search + blx r8 (stack arg) | `data_021040ac+0x28` undocumented; blx target unknown |
| 0x020056a4 | 292 | F | flag manipulation | `data_021040ac+0xb00+0x52` outside KB; multi-HW reg mix |
| 0x02001a34 | 228 | E | `data_02102c7c+0xb4` | KB documents only to +0x3B |
| 0x02003d98 | 256 | F | `data_02102c7c+0x88..+0xa8` | Beyond KB documented range |
| 0x020491ec | 132 | E | `data_0219dc80[0x34/0x38]` vtable | No KB doc for `data_0219dc80` (overlay data) |
| 0x020970a8 | 172 | E | vtable blx then spin-loop | `data_<r5>`-based vtable, struct not in KB |
| 0x0204c120 | 192 | E | `gs+0x464/0x468` vtable blx | Same gap as 0204bf44 — still conditional |
| 0x02050054 | 196 | E | `gs+0x464/0x468` vtable blx | Same gap — conditional |

---

## Pattern Summary

### vtable-slot (2 funcs)

`func_020a71e4` and `func_020a724c` dispatch through `data_02102958`, a 3-pointer
`void *[3]` array that is now a matched C file. Both are tiny (28B) and require only a
pointer-dereference through the known array.

### SDK math (3 funcs)

`func_020b1e0c`, `func_020b1e4c`, `func_020b319c` are NitroSDK FX integer-to-float
normalization functions. They use the deterministic MWCC-generated clz+shift+exponent-pack
sequence. The signed variant adds abs before clz; the rounded variant adds guard-bit
rounding. Write as `FX32_FromS32`, `FX32_FromU32`, or plain `(float)x` cast and confirm
with objdiff.

### struct-access unlocked by KB (3 funcs)

- `func_02009dec` and `func_02009f50`: loop over a 26-entry audio array at
  `data_02104f4c`, using `GlobalAudioState.f3c` (now documented) as an init argument.
  The loop body is deterministic once the array's byte-field layout is stated.
- `func_02006a38`: reads `GlobalData02104f1c` fields `f0`, `f4`, `f10` (all documented)
  plus two gap words `f8`/`f0c` that are trivially added to the typedef. The rest is
  named-function calls and a pointer-array lookup.

### Remaining main E/F wall

The bulk of the 707 "low" funcs remain blocked by: unknown overlay-region struct pointers
(`data_021a*`, `data_0219*`), `data_02102c7c` accesses far beyond the KB-documented range
(+0x088 to +0x0a8 vs KB's +0x000 to +0x03B), stack-passed function pointers (`blx r8`),
and plain reg-alloc coin-flip loops with no struct anchor at all. The 48 "never" funcs
are unchanged: float-CPSR, popcount bit-twiddle, decompressors, and scheduling-bound
spin loops.
