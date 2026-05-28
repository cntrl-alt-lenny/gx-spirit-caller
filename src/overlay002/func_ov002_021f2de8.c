/* func_ov002_021f2de8: family 0b94bd45 sibling of 021ee644 — extract
 * bit 15 of the u16 at +2; if set tail func_021eb964 else func_021ed4c0.
 *
 *     push  {r3, lr}
 *     ldrh  r3, [r0, #0x2]
 *     lsl   r3, r3, #0x10        ; << 16
 *     lsrs  r3, r3, #0x1f        ; >> 31  -> bit 15, set flags
 *     beq   .L
 *     bl    func_ov002_021eb964
 *     pop   {r3, pc}
 *  .L:
 *     bl    func_ov002_021ed4c0
 *     pop   {r3, pc}
 *
 * gotcha 7: pass-through (a, b) push the extract temp to r3.
 */

extern int func_ov002_021eb964(void *self, int a, int b);
extern int func_ov002_021ed4c0(void *self, int a, int b);

int func_ov002_021f2de8(unsigned short *self, int a, int b) {
    if (((unsigned int)self[1] << 16) >> 31) return func_ov002_021eb964(self, a, b);
    return func_ov002_021ed4c0(self, a, b);
}
