/* func_ov002_021f9864: tag6 bitfield + helper-tail.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #2]
 *     lsl   r2, r2, #20
 *     lsr   r2, r2, #26          ; tag6 = bits 6-11 of f2
 *     cmp   r2, #2
 *     movne r0, #1
 *     popne {r3, pc}              ; if tag6 != 2: return 1
 *     bl    helper
 *     pop   {r3, pc}
 *
 * Brief 242 C-42 sub-shape 1 (tag6 bitfield + helper-tail). Recipe
 * gotcha: gotcha 7 (arg-count) — 1-arg sig allocates the bitfield
 * temp to r1, but orig has r2. The 2-arg pass-through (self, arg)
 * keeps r1 live for the helper call, forcing the temp to r2.
 */
struct FuncOv002021f9954Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_021f9344(struct FuncOv002021f9954Self *self, int arg);

int func_ov002_021f9864(struct FuncOv002021f9954Self *self, int arg) {
    if (self->f2.tag6 != 2) return 1;
    return func_ov002_021f9344(self, arg);
}
