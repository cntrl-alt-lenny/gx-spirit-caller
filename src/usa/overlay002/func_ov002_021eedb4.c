/* func_ov002_021eedb4: bne-skip dispatch on u16 field.
 *
 *     push  {r3, lr}
 *     ldrh  r3, [r0, #10]
 *     cmp   r3, #0
 *     beq   .L_else
 *     bl    helper1
 *     pop   {r3, pc}
 *   .L_else:
 *     bl    helper2
 *     pop   {r3, pc}
 *
 * Brief 241 C-42 sub-shape (if-else dispatch). Recipe gotcha: 3-arg
 * pass-through is needed to force the field load into **r3** (orig).
 * With 1-arg signature, mwcc allocates r1 for the temp — wrong reg.
 * With 3-arg (self, a, b), r1 and r2 are reserved for live args, so
 * the temp goes to r3 exactly as orig.
 */
struct FuncOv002021eeea4Self {
    char pad[10];
    unsigned short f10;
};

extern void func_ov002_021eb614(struct FuncOv002021eeea4Self *self, int a, int b);
extern void func_ov002_021ec73c(struct FuncOv002021eeea4Self *self, int a, int b);

void func_ov002_021eedb4(struct FuncOv002021eeea4Self *self, int a, int b) {
    if (self->f10) {
        func_ov002_021eb614(self, a, b);
    } else {
        func_ov002_021ec73c(self, a, b);
    }
}
