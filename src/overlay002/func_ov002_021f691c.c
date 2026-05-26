/* func_ov002_021f691c: brief 227 C-39 wave 2 — three-arg helper (bit0,0,1), return 1.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]
 *     mov   r1, #0                    ; const #0 BEFORE bitfield extract
 *     mov   r2, #1                    ; const #1 BEFORE bitfield extract
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31              ; r0 = bit0
 *     bl    func_ov002_0226af38       ; helper(bit0, 0, 1)
 *     mov   r0, #1
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + 3-arg helper with two literal args.
 */

struct F021f691c_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F021f691c_Self {
    unsigned short f0;
    struct F021f691c_F2 f2;
};

extern void func_ov002_0226af38(unsigned int bit0, unsigned int z, unsigned int one);

int func_ov002_021f691c(struct F021f691c_Self *self) {
    func_ov002_0226af38(self->f2.bit0, 0, 1);
    return 1;
}
