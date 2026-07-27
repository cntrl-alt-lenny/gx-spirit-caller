struct Ov002SelfLocal { unsigned short f0; unsigned short b0 : 1; };

extern int func_ov002_021ca1d8(int player);
extern int func_ov002_021ff1c8(struct Ov002SelfLocal *self, int i);
extern int func_ov002_02253600(int i, int f0, int zero);

int func_ov002_02201ff0(struct Ov002SelfLocal *self) {
    int i;
    if (func_ov002_021ca1d8(self->b0) == 0) {
        return 0;
    }
    for (i = 0; i < 2; i++) {
        if (func_ov002_021ff1c8(self, i) == 0) {
            return 0;
        }
        if (func_ov002_02253600(i, self->f0, 0) == 0) {
            return 0;
        }
    }
    return 1;
}
