/* func_ov002_0222be24: brief 230 C-39d wave 4 — D1 dual-call same-helper return 0.
 *
 *     push  {r4, lr}; mov r4, r0
 *     ldrh r0, [r4, #2]; mov r1, #0; lsl/lsr → bit0
 *     bl    helper(bit0, 0)
 *     ldrh r0, [r4, #2]; mov r1, #0; lsl/lsr → bit0; rsb r0, r0, #1 → !bit0
 *     bl    helper(!bit0, 0)
 *     mov r0, #0; pop
 *
 * Brief 229 C-39d natural-source recipe — re-read of `self->f2.bit0`
 * across the helper call is emitted naturally by mwcc 2.0/sp1p5.
 */

struct F0222bf14_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0222bf14_Self {
    unsigned short pad0;
    struct F0222bf14_F2 f2;
};
extern int func_ov002_021df64c(unsigned int bit, unsigned int z);

int func_ov002_0222be24(struct F0222bf14_Self *self) {
    func_ov002_021df64c(self->f2.bit0, 0);
    func_ov002_021df64c(1 - self->f2.bit0, 0);
    return 0;
}
