/* func_ov002_021ff264: brief 234 C-39b — tag6-check + multi-arg helper + return 1.
 *
 * Orig (0x68):
 *   push {r3, r4, lr}; sub sp, sp, #4; mov r4, r0
 *   ldrh r1; lsl #20; lsr #26 → tag6 (bits 6-11)
 *   cmp r1, #0x23; beq <end-with-1>
 *   bl helper1(self)
 *   mov r3, #0; str r3, [sp]
 *   ldrh r2 (f4); ldrh ip (f2); mov r1, r0 (n)
 *   lsl r2, #17; lsl r0, ip, #31; lsr r0; lsr r2
 *   bl helper2(bit0, n, field9, 0, 0)
 *   cmp #0; addeq sp, #4; moveq #0; popeq    ; if h2 == 0 return 0
 *   mov r0, #1; add sp, #4; pop              ; return 1
 *
 * Brief 224 021f4a00 shape extended — tag6 check + helper1+helper2 chain.
 */

struct F021ff354_F2 {
    unsigned short bit0 : 1;
    unsigned short pad6 : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F021ff354_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F021ff354_Self {
    unsigned short pad0;
    struct F021ff354_F2 f2;
    struct F021ff354_F4 f4;
};

extern int func_ov002_021f3ab0(struct F021ff354_Self *self);
extern int func_ov002_021ff05c(unsigned int bit, int n, unsigned int field9,
                                unsigned int z0, unsigned int z1);

int func_ov002_021ff264(struct F021ff354_Self *self) {
    if (self->f2.tag6 != 0x23) {
        int n = func_ov002_021f3ab0(self);
        if (func_ov002_021ff05c(self->f2.bit0, n, self->f4.field9, 0, 0) == 0) return 0;
    }
    return 1;
}
