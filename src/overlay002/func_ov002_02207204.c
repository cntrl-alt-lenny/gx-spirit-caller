/* func_ov002_02207204: brief 234 C-39b — null-check + bit-check + tail-call (E5 chain).
 *
 * Orig (0x4c):
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl helper1(self); cmp #0; moveq #0; popeq    ; if (h1 == 0) return 0
 *   ldrh; lsl/lsr → bit0; mov r1, r0
 *   bl helper2(bit0, bit0); cmp #0; moveq #0; popeq
 *   mov r0, r5; mov r1, r4; bl helper3(self, arg1)  ; tail-call
 *   pop
 */

struct F02207204_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02207204_Self {
    unsigned short pad0;
    struct F02207204_F2 f2;
};

extern int func_ov002_021ff320(struct F02207204_Self *self);
extern int func_ov002_021ca698(unsigned int a, unsigned int b);
extern int func_ov002_021ff500(struct F02207204_Self *self, void *arg1);

int func_ov002_02207204(struct F02207204_Self *self, void *arg1) {
    if (func_ov002_021ff320(self) == 0) return 0;
    if (func_ov002_021ca698(self->f2.bit0, self->f2.bit0) == 0) return 0;
    return func_ov002_021ff500(self, arg1);
}
