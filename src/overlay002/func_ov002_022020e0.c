struct Ov002SelfLocal { unsigned short f0; unsigned short b0 : 1; };

extern int func_ov002_021ca2b8(int player);
extern int func_ov002_021ff2b8(struct Ov002SelfLocal *self, int i);
extern int func_ov002_022536e8(int i, int f0, int zero);

int func_ov002_022020e0(struct Ov002SelfLocal *self) {
    int i;
    if (func_ov002_021ca2b8(self->b0) == 0) {
        return 0;
    }
    for (i = 0; i < 2; i++) {
        if (func_ov002_021ff2b8(self, i) == 0) {
            return 0;
        }
        if (func_ov002_022536e8(i, self->f0, 0) == 0) {
            return 0;
        }
    }
    return 1;
}
