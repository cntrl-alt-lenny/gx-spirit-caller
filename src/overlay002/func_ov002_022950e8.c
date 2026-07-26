typedef unsigned short u16;
struct Self0 { u16 f0; u16 bit0 : 1; u16 _r0 : 15; u16 f4lo6 : 6; u16 b6_14 : 9; u16 f4b15 : 1; };

extern int func_ov002_021b4254(int b6_14, int f0);
extern int func_ov002_02291214(struct Self0 *self, int arg1);
extern int func_ov002_021bbf50(int side);

int func_ov002_022950e8(struct Self0 *self, int arg1) {
    if (func_ov002_021b4254(self->b6_14, self->f0) < 3) {
        return func_ov002_02291214(self, arg1);
    }
    return func_ov002_021bbf50(1 - self->bit0) > 1;
}
