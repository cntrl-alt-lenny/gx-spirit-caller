/* func_ov004_021d5b14: invoke the state's handler via a function-pointer
 * table indexed by self->f30, then (state < 0x27) run a 3-stage gate
 * (each stage polls func_0203268c() then tests a sibling's result) leading
 * to either the 021d3bc0 action or a state reset to 0x27; always bump
 * self->f3c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     ldr   r2, [r4, #0x30]
 *     ldr   r1, .L_LIT0          ; data_ov004_02209ecc
 *     ldr   r1, [r1, r2, lsl #0x2]
 *     blx   r1
 *     ...
 *     ldmia sp!, {r4, pc}
 */

typedef void (*Handler)(void *);
extern Handler data_ov004_02209ecc[];

extern int func_0203268c(void);
extern int func_0203353c(void);
extern int func_0203354c(void);
extern void func_ov004_021d3bc0(void *self);

void func_ov004_021d5b14(char *self) {
    data_ov004_02209ecc[*(int *)(self + 0x30)](self);

    if (*(int *)(self + 0x30) < 0x27) {
        if (func_0203268c() != 0) {
            func_0203268c();
            if (func_0203353c() != 0) {
                func_0203268c();
                if (func_0203354c() == 1) {
                    func_ov004_021d3bc0(self);
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
