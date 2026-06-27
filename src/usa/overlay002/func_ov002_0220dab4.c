
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021ff230(struct Ov002Self *self);
extern int func_ov002_021bc47c(int bit0, int n);
int func_ov002_0220dab4(struct Ov002Self *self) {
    unsigned int n;
    if (func_ov002_021ff230(self) == 0) return 0;
    n = self->b1_5;
    if (n < 4) { if (func_ov002_021bc47c(self->b0, n + 1) != 0) return 1; }
    n = self->b1_5;
    if (n != 0) { if (func_ov002_021bc47c(self->b0, n - 1) != 0) return 1; }
    return 0;
}
