/* func_ov002_02218740: 2-bit field + helper-tail (sub-shape 1 sibling).
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #2]
 *     lsl   r2, r2, #18
 *     lsr   r2, r2, #30          ; field2 = bits 12-13 of f2
 *     cmp   r2, #2
 *     movne r0, #0
 *     popne {r3, pc}
 *     bl    helper
 *     pop   {r3, pc}
 *
 * Brief 242 sibling of 021f9954: same 2-arg recipe forces temp to r2.
 */
struct FuncOv00202218740Self {
    unsigned short f0;
    struct {
        unsigned short pad1   : 12;
        unsigned short field2 : 2;
        unsigned short pad2   : 2;
    } f2;
};

extern int func_ov002_02219734(struct FuncOv00202218740Self *self, int arg);

int func_ov002_02218740(struct FuncOv00202218740Self *self, int arg) {
    if (self->f2.field2 != 2) return 0;
    return func_ov002_02219734(self, arg);
}
