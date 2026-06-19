/* func_ov002_021f5fac: multi-bitfield extract + tag-check + helper.
 *
 * Orig shape (64 bytes, 16 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #2]                  ; r1 = halfword at offset 2
 *     lsl   r2, r1, #20                   ; bitfield tag6 extract (bits 6-11)
 *     lsr   r2, r2, #26
 *     cmp   r2, #0x23                     ; tag6 == 0x23 ?
 *     beq   .L_end                         ; if yes, skip body
 *     ldrh  r2, [r0, #4]                  ; r2 = halfword at offset 4
 *     lsl   r3, r1, #31                    ; bit 0 of offset-2 halfword
 *     ldrh  r1, [r0]                       ; r1 = halfword at offset 0
 *     lsl   r2, r2, #17                    ; field9 extract (bits 6-14, 9 bits)
 *     lsr   r0, r3, #31
 *     lsr   r3, r2, #23
 *     mov   r2, #1                         ; constant arg
 *     bl    func_ov002_021e267c           ; helper(bit0, halfword_0, 1, field9)
 *   .L_end:
 *     mov   r0, #1                         ; return 1
 *     pop   {r3, pc}
 *
 * Brief 222 worked example for C-39 — the multi-bitfield variant
 * showing the recipe scales to functions with several bitfield
 * extracts in the same body. See `func_ov002_0223fc28.c` for
 * the recipe rationale and `docs/research/
 * brief-222-c39-non-leaf-bitfield.md` for the variant matrix.
 *
 * Key structural elements that make the recipe reach orig:
 *   1. Halfword bitfield (`unsigned short ... : N`) for each
 *      bit/field — mwcc emits `ldrh` + canonical `lsl/lsr`
 *      shift pair instead of `and #mask` or `ands`.
 *   2. **Natural `if (cond) { ... }` form** (NOT `if (cond)
 *      goto end;` and NOT a ternary) — mwcc 2.0 emits the
 *      explicit `beq` branch shape rather than predicated
 *      execution.
 *   3. Constant-1 helper arg passed as a literal — mwcc emits
 *      `mov r2, #1`.
 */

struct Func021f609cF2 {
    unsigned short bit0  : 1;     /* bit 0 */
    unsigned short pad6  : 5;     /* bits 1-5 */
    unsigned short tag6  : 6;     /* bits 6-11 (the 0x23 check field) */
    unsigned short rest  : 4;     /* bits 12-15 */
};

struct Func021f609cF4 {
    unsigned short pad6   : 6;    /* bits 0-5 */
    unsigned short field9 : 9;    /* bits 6-14 (9 bits — lsl 17 / lsr 23) */
    unsigned short top    : 1;
};

struct Func021f609cSelf {
    unsigned short f0;            /* offset 0 */
    struct Func021f609cF2 f2;     /* offset 2 (halfword) */
    struct Func021f609cF4 f4;     /* offset 4 (halfword) */
};

extern int func_ov002_021e267c(
    unsigned int bit0,
    unsigned int f0,
    unsigned int constant1,
    unsigned int field9);

int func_ov002_021f5fac(struct Func021f609cSelf *self) {
    if (self->f2.tag6 != 0x23) {
        func_ov002_021e267c(self->f2.bit0, self->f0, 1, self->f4.field9);
    }
    return 1;
}
