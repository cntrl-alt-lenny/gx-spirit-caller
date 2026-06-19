/* func_ov002_02207a4c: brief 236 — E5 chain helper1(bit0) eq early + tail. */

struct F02207b3c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02207b3c_Self {
    unsigned short pad0;
    struct F02207b3c_F2 f2;
};

extern int func_ov002_021ca1d8(unsigned int bit);
extern int func_ov002_022064b0(struct F02207b3c_Self *self, void *arg1);

int func_ov002_02207a4c(struct F02207b3c_Self *self, void *arg1) {
    if (func_ov002_021ca1d8(self->f2.bit0) == 0) return 0;
    return func_ov002_022064b0(self, arg1);
}
