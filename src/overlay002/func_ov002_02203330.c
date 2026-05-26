/* func_ov002_02203330: brief 230 C-39d — eq-check + helper(self, bit0) ne ? 2 : 0 tail.
 *
 *     bl helper(self, !bit0); cmp #0; moveq #0; popeq
 *     bl helper(self, bit0); cmp #0; movne #2; moveq #0; pop
 */

struct F02203330_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02203330_Self {
    unsigned short pad0;
    struct F02203330_F2 f2;
};
extern int func_ov002_02257ab8(struct F02203330_Self *self, unsigned int v);

int func_ov002_02203330(struct F02203330_Self *self) {
    if (func_ov002_02257ab8(self, 1 - self->f2.bit0) == 0) return 0;
    return func_ov002_02257ab8(self, self->f2.bit0) != 0 ? 2 : 0;
}
