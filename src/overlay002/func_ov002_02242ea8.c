/* func_ov002_02242ea8: for outer in 0..1, inner in 0..4, if
 * func_ov002_022575c8(self,outer,inner)!=0 forward to
 * func_ov002_021d59cc(outer,inner,0x1518,2,field9(self->f4)); then
 * self->f8 = 1. */
typedef unsigned short u16;
extern int func_ov002_022575c8(void *self, int a, int b);
extern void func_ov002_021d59cc(int a, int b, int c, int d, int e);

void func_ov002_02242ea8(void *self) {
    int outer;
    for (outer = 0; outer < 2; outer++) {
        int inner;
        for (inner = 0; inner <= 4; inner++) {
            if (func_ov002_022575c8(self, outer, inner) != 0) {
                u16 f4 = *(u16 *)((char *)self + 4);
                int field9 = ((unsigned)(f4 << 17)) >> 23;
                func_ov002_021d59cc(outer, inner, 0x1518, 2, field9);
            }
        }
    }
    *(u16 *)((char *)self + 8) = 1;
}
