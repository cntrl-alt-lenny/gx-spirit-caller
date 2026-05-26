/* func_ov002_02295d88: brief 230 C-39d — helper(!bit0, 0, 1) == 0 + helper(self, !bit0) != 0.
 *
 *     bl helper1(!bit0, 0, 1); cmp #0; moveq #0; popeq
 *     bl helper2(self, !bit0); cmp #0; movne #1; moveq #0; pop
 */

struct F02295d88_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02295d88_Self {
    unsigned short pad0;
    struct F02295d88_F2 f2;
};
extern int func_ov002_021bc16c(unsigned int v, unsigned int z, unsigned int k);
extern int func_ov002_02257ab8(struct F02295d88_Self *self, unsigned int v);

int func_ov002_02295d88(struct F02295d88_Self *self) {
    if (func_ov002_021bc16c(1 - self->f2.bit0, 0, 1) == 0) return 0;
    return func_ov002_02257ab8(self, 1 - self->f2.bit0) != 0;
}
