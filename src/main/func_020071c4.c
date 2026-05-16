/* func_020071c4: brief 111 worked example — pool-dup + bit-extraction recipe.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r0, .L_pool1                ; r0 = &data_02104f1c (test slot)
 *     ldr   r4, .L_pool2                ; r4 = &data_02104f1c (callee-save)
 *     ldr   r0, [r0, #0x10]
 *     mov   r0, r0, lsl #0x1e           ; shift to isolate bit 1
 *     movs  r0, r0, lsr #0x1f           ; lsr 31 + S flag
 *     ldmeqia sp!, {r4, pc}             ; early return if bit clear
 *     bl    func_02006918
 *     bl    func_02006a38
 *     ldr   r0, [r4, #0x14]
 *     cmp   r0, #0
 *     beq   .L_done
 *     bl    func_020057dc
 *  .L_done:
 *     ldr   r1, [r4, #0x10]
 *     mov   r0, #0
 *     bic   r1, r1, #2
 *     str   r1, [r4, #0x10]             ; clear bit 1
 *     str   r0, [r4, #0x14]
 *     ldmia sp!, {r4, pc}
 *  .L_pool1: .word data_02104f1c
 *  .L_pool2: .word data_02104f1c
 *
 * Brief 111 Part 2 — combines C-27's pool-DUP recipe (dual-extern +
 * symbols.txt alias) with **shift-based bit-extraction** (orig emits
 * lsl + lsrs + ldmeqia where mwcc 2.0 emits tst + popeq).
 *
 * Recipe:
 *   1. Add `data_X_alias kind:bss addr:0x...` to symbols.txt at the
 *      same address (C-27 step).
 *   2. Source uses TWO distinct extern declarations — read via one,
 *      write via the other (C-27 step).
 *   3. Bit-extraction uses explicit shift idiom `((v << 30) >> 31)`
 *      not the natural `v & 2` — mwcc emits the long-form shift +
 *      flag-setting instead of the efficient tst peephole.
 */

extern unsigned int data_02104f1c;
extern unsigned int data_02104f1c_alias;
extern void func_02006918(void);
extern void func_02006a38(void);
extern void func_020057dc(void);

struct s071c4 {
    char _pad[0x10];
    unsigned int f_10;
    int f_14;
};

void func_020071c4(void) {
    struct s071c4 *p_test  = (struct s071c4 *)&data_02104f1c;
    struct s071c4 *p_store = (struct s071c4 *)&data_02104f1c_alias;
    unsigned int v = p_test->f_10;
    if (((v << 30) >> 31) == 0) return;
    func_02006918();
    func_02006a38();
    if (p_store->f_14 != 0) func_020057dc();
    p_store->f_10 &= ~2u;
    p_store->f_14 = 0;
}
