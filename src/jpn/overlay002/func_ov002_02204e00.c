/* func_ov002_02204e00: brief 236 — E5 chain helper1(self, bit0) eq early + tail. */

struct F02204ef0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02204ef0_Self {
    unsigned short pad0;
    struct F02204ef0_F2 f2;
};

extern int func_ov002_021ff1d8(struct F02204ef0_Self *self, unsigned int bit);
extern int func_ov002_022015cc(struct F02204ef0_Self *self, void *arg1);

int func_ov002_02204e00(struct F02204ef0_Self *self, void *arg1) {
    if (func_ov002_021ff1d8(self, self->f2.bit0) == 0) return 0;
    return func_ov002_022015cc(self, arg1);
}
