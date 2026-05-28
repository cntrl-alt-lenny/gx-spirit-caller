/* func_ov002_022951a4: bitfield-test + helper-tail.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #2]
 *     lsl   r2, r2, #18
 *     lsrs  r2, r2, #30      ; bits 12-13 of f2
 *     movne r0, #1
 *     popne {r3, pc}         ; if field2 != 0: return 1
 *     bl    helper
 *     pop   {r3, pc}
 *
 * Brief 241 C-42 sub-shape (bitfield + conditional-exec tail).
 * Recipe gotcha: 2-arg pass-through forces the bitfield extract to
 * **r2** (orig). With 1-arg, mwcc allocates r1.
 *
 * The bitfield layout puts `field2` at bits 12-13 of f2 — same
 * shape as 02206608 (brief 239).
 */
struct FuncOv002022951a4Self {
    unsigned short f0;
    struct {
        unsigned short pad     : 12;
        unsigned short field2  : 2;
        unsigned short top     : 2;
    } f2;
};

extern int func_ov002_02291160(struct FuncOv002022951a4Self *self, int arg);

int func_ov002_022951a4(struct FuncOv002022951a4Self *self, int arg) {
    if (self->f2.field2 != 0) return 1;
    return func_ov002_02291160(self, arg);
}
