/* func_ov002_021f97e8: brief 236 — interleaved 2-bitfield (r1 channel), helper(self, bit0, fld5); return 1.
 *
 *   ldrh r1, [r0, #2]   ; r1 = raw, r0 = self preserved
 *   lsl r3, r1, #31; lsl r2, r1, #26; lsr r1, r3, #31; lsr r2, r2, #27
 *   bl helper(self, bit0, fld5); mov r0, #1; pop
 */

struct F021f97e8_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F021f97e8_Self {
    unsigned short pad0;
    struct F021f97e8_F2 f2;
};

extern int func_ov002_021decdc(struct F021f97e8_Self *self, unsigned int bit, unsigned int fld);

int func_ov002_021f97e8(struct F021f97e8_Self *self) {
    func_ov002_021decdc(self, self->f2.bit0, self->f2.fld5);
    return 1;
}
