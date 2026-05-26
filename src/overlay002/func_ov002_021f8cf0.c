/* func_ov002_021f8cf0: brief 227 C-39 wave 2 — three-arg helper (self+bit0+10), return 1.
 *
 * Orig (0x20, 8 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #2]              ; r1 = raw, r0 = self preserved
 *     mov   r2, #10                   ; const #10 interleaved with bitfield extract
 *     lsl   r1, r1, #31
 *     lsr   r1, r1, #31              ; r1 = bit0
 *     bl    func_ov002_021decdc       ; helper(self, bit0, 10)
 *     mov   r0, #1
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + 3-arg helper with literal arg.
 */

struct F021f8cf0_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F021f8cf0_Self {
    unsigned short f0;
    struct F021f8cf0_F2 f2;
};

extern void func_ov002_021decdc(struct F021f8cf0_Self *self, unsigned int bit0, unsigned int n);

int func_ov002_021f8cf0(struct F021f8cf0_Self *self) {
    func_ov002_021decdc(self, self->f2.bit0, 10);
    return 1;
}
