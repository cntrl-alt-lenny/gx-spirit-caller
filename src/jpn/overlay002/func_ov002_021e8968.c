/* func_ov002_021e8968: brief 227 C-39 wave 2 — single-arg helper, bool-from-int.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31              ; bit0 extract
 *     bl    func_ov002_021bc7e8
 *     cmp   r0, #0
 *     movne r0, #1
 *     moveq r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + bool-coercion of helper return.
 */

struct F021e8a58_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F021e8a58_Self {
    unsigned short f0;
    struct F021e8a58_F2 f2;
};

extern int func_ov002_021bc7e8(unsigned int bit0);

int func_ov002_021e8968(struct F021e8a58_Self *self) {
    return func_ov002_021bc7e8(self->f2.bit0) != 0;
}
