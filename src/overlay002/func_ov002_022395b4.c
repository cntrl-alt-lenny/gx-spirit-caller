/* func_ov002_022395b4: family e77f605c sibling of 022221a8 — same
 * dispatch shape, case helpers func_ov002_022321e0 / func_ov002_022112f8.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #0xc]
 *     cmp   r2, #0x1
 *     beq   .L_case1
 *     cmp   r2, #0x2
 *     beq   .L_case2
 *     b     .L_default
 *  .L_case1:
 *     bl    func_ov002_022321e0
 *     pop   {r3, pc}
 *  .L_case2:
 *     bl    func_ov002_022112f8
 *     pop   {r3, pc}
 *  .L_default:
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 *
 * gotcha 7: pass-through `arg` (r1) keeps r1 live, pushing the tag temp
 * to r2 (orig) rather than r1.
 */

struct S022221a8 {
    char pad[0xc];
    unsigned short tag;
};

extern int func_ov002_022321e0(void *self, int arg);
extern int func_ov002_022112f8(void *self, int arg);

int func_ov002_022395b4(struct S022221a8 *self, int arg) {
    switch (self->tag) {
    case 1:
        return func_ov002_022321e0(self, arg);
    case 2:
        return func_ov002_022112f8(self, arg);
    }
    return 0;
}
