/* func_ov002_02221ab8: C-39 — two guards (f0==0x14c0, bits4-7@2==0),
 * then helper(arg1->bit0, self->f4 >> 1); return 0.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #0x0] ; cmp r2, #0x14c0 ; bne .L
 *     ldrh  r2, [r0, #0x2] ; lsl r2, r2, #0x18 ; lsrs r2, r2, #0x1c ; bne .L
 *     ldrh  r2, [r1, #0x2] ; ldrh r1, [r0, #0x4]
 *     lsl   r0, r2, #0x1f ; lsr r0, r0, #0x1f      ; arg1->bit0
 *     lsr   r1, r1, #0x1                           ; self->f4 >> 1
 *     bl    func_ov002_021e05fc
 *     mov   r0, #0x0 ; pop {r3, pc}
 *  .L: mov r0, #0x0 ; pop {r3, pc}
 */

typedef unsigned short u16;

struct S02221ab8 {
    u16 f0;
    u16 _2a : 4;
    u16 b4_7 : 4;
    u16 _2b : 8;
    u16 f4;
};

struct A02221ab8 {
    u16 _0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_ov002_021e05fc(int bit0, int v);

int func_ov002_02221ab8(struct S02221ab8 *self, struct A02221ab8 *arg1) {
    /* nested guards (not early-return) so both `bne` to the shared
     * `return 0` epilogue (orig), not predicated movne/popne. */
    if (self->f0 == 0x14c0) {
        if (self->b4_7 == 0) {
            func_ov002_021e05fc(arg1->bit0, (unsigned int)self->f4 >> 1);
        }
    }
    return 0;
}
