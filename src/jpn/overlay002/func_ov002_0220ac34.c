/* func_ov002_0220ac34: brief 234 C-39b — helper-reuse + multi-arg helper2 + tail-call.
 *
 * Orig (0x54):
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl helper1(self)
 *   mov r3, #0; str r3, [sp]                 ; stack-spilled 5th arg = 0
 *   ldrh r2, f4; ldrh ip, f2; mov r1, r0 (n)
 *   lsl r2, #17; lsl r0, ip, #31; lsr r0; lsr r2 #23
 *   bl helper2(bit0, n, field9, 0, 0)
 *   cmp #0; moveq #0; popeq                  ; early-return 0
 *   mov r0, r5; mov r1, r4
 *   bl helper3(self, arg1)                    ; tail-call
 *   pop
 */

struct F0220ad24_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0220ad24_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F0220ad24_Self {
    unsigned short pad0;
    struct F0220ad24_F2 f2;
    struct F0220ad24_F4 f4;
};

extern int func_ov002_021f4004(struct F0220ad24_Self *self);
extern int func_ov002_021ff080(unsigned int bit, int n, unsigned int field9,
                                unsigned int z0, unsigned int z1);
extern int func_ov002_0220d3e0(struct F0220ad24_Self *self, void *arg1);

int func_ov002_0220ac34(struct F0220ad24_Self *self, void *arg1) {
    int n = func_ov002_021f4004(self);
    if (func_ov002_021ff080(self->f2.bit0, n, self->f4.field9, 0, 0) == 0) return 0;
    return func_ov002_0220d3e0(self, arg1);
}
