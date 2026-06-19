/* func_ov002_02217328: C-39 — guard on bit 2 of the u16 at +4, then a
 * bit-0 extract from +2 into the helper. helper(bit0@2, 0x17, 1);
 * return 0.
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #0x4]
 *     lsl   r1, r1, #0x1d
 *     lsrs  r1, r1, #0x1f        ; bit 2 of +4, set flags
 *     movne r0, #0x0
 *     popne {r3, pc}             ; if (bit2) return 0
 *     ldrh  r0, [r0, #0x2]
 *     mov   r1, #0x17
 *     mov   r2, #0x1
 *     lsl   r0, r0, #0x1f
 *     lsr   r0, r0, #0x1f        ; bit0@2
 *     bl    func_ov002_021e2c30
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S02217418 {
    u16 f0;
    u16 bit0 : 1;
    u16 r2 : 15;
    u16 b4lo : 2;
    u16 bit2 : 1;
    u16 b4hi : 13;
};

extern void func_ov002_021e2c30(int a0, int a1, int a2);

int func_ov002_02217328(struct S02217418 *self) {
    if (self->bit2) return 0;
    func_ov002_021e2c30(self->bit0, 0x17, 1);
    return 0;
}
