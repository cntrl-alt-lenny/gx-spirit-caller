/* func_ov002_02240904: family 8 — bitfield(bit9, tag4) + helper + return 1.
 *
 *     push {r3, lr}
 *     ldr r1, [r0, #0x14]
 *     mov r3, r1, lsl #22      ; r3 = f14 << 22
 *     mov r2, r1, lsl #18      ; r2 = f14 << 18
 *     mov r1, r3, lsr #31      ; r1 = (f14 >> 9) & 1 (bit9)
 *     mov r2, r2, lsr #28      ; r2 = (f14 >> 10) & 0xf (tag4)
 *     bl helper(self, bit9, tag4)
 *     mov r0, #1; pop
 *
 * Sibling family: 3 ov002 picks.
 */
struct F022409ec {
    char pad[0x14];
    struct {
        unsigned int low9 : 9;
        unsigned int bit9 : 1;
        unsigned int tag4 : 4;
        unsigned int rest : 18;
    } f14;
};

extern void func_ov002_0223dbd0(struct F022409ec *self, unsigned int bit9, unsigned int tag4);

int func_ov002_02240904(struct F022409ec *self) {
    func_ov002_0223dbd0(self, self->f14.bit9, self->f14.tag4);
    return 1;
}
