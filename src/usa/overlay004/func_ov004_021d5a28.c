/* func_ov004_021d5a28: invoke the state's handler via a function-pointer
 * table indexed by self->f30, then (state < 0x27) run a 3-stage gate
 * (each stage polls func_02032638() then tests a sibling's result) leading
 * to either the 021d3bc0 action or a state reset to 0x27; always bump
 * self->f3c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     ldr   r2, [r4, #0x30]
 *     ldr   r1, .L_LIT0          ; data_ov004_02209c6c
 *     ldr   r1, [r1, r2, lsl #0x2]
 *     blx   r1
 *     ...
 *     ldmia sp!, {r4, pc}
 */

typedef void (*Handler)(void *);
extern Handler data_ov004_02209c6c[];

extern int func_02032638(void);
extern int func_020334ec(void);
extern int func_020334fc(void);
extern void func_ov004_021d3ae0(void *self);

void func_ov004_021d5a28(char *self) {
    data_ov004_02209c6c[*(int *)(self + 0x30)](self);

    if (*(int *)(self + 0x30) < 0x27) {
        if (func_02032638() != 0) {
            func_02032638();
            if (func_020334ec() != 0) {
                func_02032638();
                if (func_020334fc() == 1) {
                    func_ov004_021d3ae0(self);
                } else {
                    *(int *)(self + 0x30) = 0x27;
                    *(int *)(self + 0x38) = 1;
                    *(int *)(self + 0x3c) = 0;
                }
            }
        }
    }

    *(int *)(self + 0x3c) = *(int *)(self + 0x3c) + 1;
}
