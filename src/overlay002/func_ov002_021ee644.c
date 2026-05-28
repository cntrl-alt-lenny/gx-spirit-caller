/* func_ov002_021ee644: family 0b94bd45 — extract the high byte of the
 * u16 at +6; if non-zero tail func_021e9ac4 else func_021ea390.
 *
 *     push  {r3, lr}
 *     ldrh  r3, [r0, #0x6]
 *     lsl   r3, r3, #0x10        ; << 16
 *     lsrs  r3, r3, #0x18        ; >> 24  -> bits 8..15, set flags
 *     beq   .L
 *     bl    func_ov002_021e9ac4
 *     pop   {r3, pc}
 *  .L:
 *     bl    func_ov002_021ea390
 *     pop   {r3, pc}
 *
 * gotcha 7: the two pass-through args (a, b) keep r1/r2 live across the
 * calls, pushing the bitfield-extract temp to r3 (orig) rather than r1.
 */

extern int func_ov002_021e9ac4(void *self, int a, int b);
extern int func_ov002_021ea390(void *self, int a, int b);

int func_ov002_021ee644(unsigned short *self, int a, int b) {
    if (((unsigned int)self[3] << 16) >> 24) return func_ov002_021e9ac4(self, a, b);
    return func_ov002_021ea390(self, a, b);
}
