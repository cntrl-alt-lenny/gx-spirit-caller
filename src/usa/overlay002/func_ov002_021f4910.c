/* func_ov002_021f4910: brief 224 C-39 — tag6-check + bit-0 + helper.
 *
 * Orig shape (76 bytes):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldrh  r1, [r4, #2]
 *     lsl   r1, r1, #0x14
 *     lsr   r1, r1, #0x1a              ; tag6 (bits 6-11)
 *     cmp   r1, #0x23
 *     beq   .L_end
 *     bl    func_ov002_021f3ab0        ; pre-check
 *     mov   r1, r0
 *     cmp   r1, #0
 *     ble   .L_end
 *     ldrh  r0, [r4, #2]
 *     mov   r2, #0
 *     mov   r3, r2
 *     lsl   r0, r0, #0x1f
 *     lsr   r0, r0, #0x1f              ; bit0
 *     bl    func_ov002_0226ad40
 *   .L_end:
 *     mov   r0, #1
 *     pop   {r4, pc}
 *
 * Brief 222 C-39 recipe — halfword bitfield struct for the
 * field-extract operations. Default mwcc 2.0/sp1p5.
 */

struct Func021f4a00F2 {
    unsigned short bit0  : 1;
    unsigned short pad   : 5;
    unsigned short tag6  : 6;
    unsigned short rest  : 4;
};

struct Func021f4a00Self {
    unsigned short f0;
    struct Func021f4a00F2 f2;
};

extern int func_ov002_021f3ab0(struct Func021f4a00Self *self);
extern int func_ov002_0226ad40(
    unsigned int bit0,
    unsigned int z1,
    unsigned int z2,
    unsigned int z3);

int func_ov002_021f4910(struct Func021f4a00Self *self) {
    if (self->f2.tag6 != 0x23) {
        int n = func_ov002_021f3ab0(self);
        if (n > 0) {
            func_ov002_0226ad40(self->f2.bit0, n, 0, 0);
        }
    }
    return 1;
}
