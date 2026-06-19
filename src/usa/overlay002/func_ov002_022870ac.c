/* func_ov002_022870ac: brief 236 C-39b — if-then form wrapping cross-call compare.
 *
 * Orig (0x54):
 *   push {r4, lr}; mov r4, r0
 *   bl helper0(self); cmp #0; beq .fail
 *   ldrh r0; lsl/lsr → bit0; rsb → !bit0; bl helper1(!bit0)
 *   ldrh r1; mov r4, r0 (= a); lsl/lsr → bit0; bl helper1(bit0)
 *   cmp r4, r0; movgt #1; movle #0; pop
 *   .fail: mov r0, #0; pop
 */

struct F022871bc_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022871bc_Self {
    unsigned short pad0;
    struct F022871bc_F2 f2;
};

extern int func_ov002_02286868(struct F022871bc_Self *self);
extern int func_ov002_021bbe70(unsigned int v);

int func_ov002_022870ac(struct F022871bc_Self *self) {
    if (func_ov002_02286868(self)) {
        int a = func_ov002_021bbe70(1 - self->f2.bit0);
        int b = func_ov002_021bbe70(self->f2.bit0);
        return a > b;
    }
    return 0;
}
