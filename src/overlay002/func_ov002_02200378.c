/* func_ov002_02200378: C-39d — multi-call re-read with early-return + literal arg.
 *
 * Orig shape (76 B, 19 ARM insns + 1 pool word):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldrh  r0, [r4, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31                   ; bit0
 *     bl    func_ov002_021ca2b8           ; helper1(bit0)
 *     cmp   r0, #0
 *     moveq r0, #0
 *     popeq {r4, pc}                      ; early-return 0
 *     ldrh  r0, [r4, #2]                 ; RE-READ
 *     ldr   r1, [pc, #24]                 ; pool: literal 0x14f8
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31                   ; bit0
 *     bl    func_ov002_021ca3f0           ; helper2(bit0, 0x14f8)
 *     cmp   r0, #0
 *     movne r0, #1
 *     moveq r0, #0
 *     pop   {r4, pc}
 *     .word 0x000014f8
 *
 * Brief 229 C-39d — same natural-source recipe as 02204f28 but with
 * two DIFFERENT helpers and a pool-loaded literal arg. mwcc 2.0 emits
 * the re-read of `self->f2.bit0` across the helper1 call without any
 * CSE-defeat idiom in the source.
 *
 * The 0x14f8 literal stays in the function's pool — mwcc materialises
 * it via `ldr rN, [pc, #imm]`.
 *
 * See `func_ov002_02204f28.c` for the recipe rationale.
 */

struct Func02200378F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02200378Self {
    unsigned short pad0;
    struct Func02200378F2 f2;
};

extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021ca3f0(unsigned int bit, int code);

int func_ov002_02200378(struct Func02200378Self *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    return func_ov002_021ca3f0(self->f2.bit0, 0x14f8) != 0;
}
