/* func_ov005_021aaf08: Fill32-zero a 0x1c-byte global region,
 * then set p->f_18 bit 0 (clear+set chain), zero p->f_0.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r1, .L_021aaf3c
 *     mov   r4, r0
 *     mov   r0, #0x0
 *     mov   r2, #0x1c
 *     bl    Fill32
 *     ldr   r1, [r4, #0x18]
 *     mov   r0, #0x0
 *     bic   r1, r1, #0x1
 *     orr   r1, r1, #0x1
 *     str   r1, [r4, #0x18]
 *     str   r0, [r4, #0x0]
 *     ldmia sp!, {r4, pc}
 *  .L_021aaf3c: .word data_ov005_021b1db4
 *
 * The bic+orr-1+orr-1 chain matches `(x & ~1) | 1`, which is
 * logically `x | 1`. mwcc 2.0/sp1p5 may simplify; if it does,
 * write the redundant clear-then-set to force the bic+orr pair.
 */

extern void Fill32(int v, void *dst, int size);
extern char data_ov005_021b1db4[];

typedef struct {
    void        *f_0;
    char         _pad4[0x14];
    unsigned int f_18;
} ov005_021aaf08_state_t;

void func_ov005_021aaf08(ov005_021aaf08_state_t *p) {
    Fill32(0, data_ov005_021b1db4, 0x1c);
    p->f_18 = (p->f_18 & ~0x1u) | 0x1u;
    p->f_0 = 0;
}
