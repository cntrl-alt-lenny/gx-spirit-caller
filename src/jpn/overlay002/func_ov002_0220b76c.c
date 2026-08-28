struct Ov002SelfBitKind {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short _pad1 : 5;
    unsigned short kind : 6;
    unsigned short _pad2 : 4;
    unsigned short _pad4[4];
    unsigned short fieldC;
};

extern int func_ov002_02207a4c(void *self, void *arg1);
extern int func_ov002_022576f4(void *self);
extern int func_ov002_021ff1c8(int unused, int b);

int func_ov002_0220b76c(struct Ov002SelfBitKind *self, void *arg1) {
    if (func_ov002_02207a4c(self, arg1) == 0) {
        return 0;
    }
    if (self->kind != 0x23) {
        self->fieldC = 0;
        if (func_ov002_022576f4(self) < 2) {
            return 0;
        }
        self->fieldC = 2;
        if (func_ov002_022576f4(self) == 0) {
            return 0;
        }
    } else {
        if (func_ov002_021ff1c8((int)self, self->b0) == 0) {
            return 0;
        }
    }
    return 2;
}
