/* func_02033438: bit-clear with early-return-on-clear.
 *
 *     push   {r3, lr}
 *     ldr    r1, [r0, #0xeb4]
 *     tst    r1, #0x1
 *     mvneq  r0, #0x0          ; if (!(p->f_eb4 & 1)) return -1
 *     popeq  {r3, pc}
 *     bic    r1, r1, #0x1      ; p->f_eb4 &= ~1
 *     str    r1, [r0, #0xeb4]
 *     bl     func_02033868
 *     bl     func_0204739c
 *     mov    r0, #0x0
 *     pop    {r3, pc}
 *
 * Brief 105 — P-9 permuter sweep seed. mvnEQ-write peephole gap on the
 * tst-then-early-return branch.
 */

extern void func_02033868(void);
extern void func_0204739c(void);

struct func_02033488_struct {
    char         _pad[0xeb4];
    unsigned int f_eb4;
};

int func_02033438(struct func_02033488_struct *p) {
    if (!(p->f_eb4 & 1)) return -1;
    p->f_eb4 &= ~1u;
    func_02033868();
    func_0204739c();
    return 0;
}
