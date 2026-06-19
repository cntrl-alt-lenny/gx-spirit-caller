/* func_ov002_0220a690: brief 236 — E5 chain helper1(bit0) eq early + tail. */

struct F0220a780_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0220a780_Self {
    unsigned short pad0;
    struct F0220a780_F2 f2;
};

extern int func_ov002_021bc538(unsigned int bit);
extern int func_ov002_02206f20(struct F0220a780_Self *self, void *arg1);

int func_ov002_0220a690(struct F0220a780_Self *self, void *arg1) {
    if (func_ov002_021bc538(self->f2.bit0) == 0) return 0;
    return func_ov002_02206f20(self, arg1);
}
