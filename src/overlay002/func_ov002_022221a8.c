/* func_ov002_022221a8: family e77f605c — dispatch on a u16 tag field at
 * offset 0xc; two cases tail to a helper, default returns 0.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #0xc]
 *     cmp   r2, #0x1
 *     beq   .L_case1
 *     cmp   r2, #0x2
 *     beq   .L_case2
 *     b     .L_default
 *  .L_case1:
 *     bl    func_ov002_02210104
 *     pop   {r3, pc}
 *  .L_case2:
 *     bl    func_ov002_0220e74c
 *     pop   {r3, pc}
 *  .L_default:
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 *
 * gotcha 7: the pass-through `arg` (r1) keeps r1 live across the calls,
 * pushing the tag temp to r2 (orig) rather than r1.
 */

struct S022221a8 {
    char pad[0xc];
    unsigned short tag;
};

extern int func_ov002_02210104(void *self, int arg);
extern int func_ov002_0220e74c(void *self, int arg);

int func_ov002_022221a8(struct S022221a8 *self, int arg) {
    switch (self->tag) {
    case 1:
        return func_ov002_02210104(self, arg);
    case 2:
        return func_ov002_0220e74c(self, arg);
    }
    return 0;
}
