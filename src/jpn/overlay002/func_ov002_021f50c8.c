/* func_ov002_021f50c8: tag6 bitfield + helper-tail (brief 242 recipe).
 *
 *     push {r3, lr}
 *     ldrh r2, [r0, #2]; lsl/lsr → tag6
 *     cmp r2, #2; moveq r0, #1; popeq
 *     bl func_ov002_021f4d04
 *     pop
 *
 * Gotcha 7: 2-arg pass-through forces bitfield temp to r2.
 */
struct FuncOv002021f51b8Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_021f4d04(struct FuncOv002021f51b8Self *self, int arg);

int func_ov002_021f50c8(struct FuncOv002021f51b8Self *self, int arg) {
    if (self->f2.tag6 == 2) return 1;
    return func_ov002_021f4d04(self, arg);
}
