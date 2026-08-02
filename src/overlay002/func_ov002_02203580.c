typedef unsigned short u16;

struct Self02203580 {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 pad6_11 : 6;
    u16 disp : 2;
    u16 b14 : 1;
    u16 pad15 : 1;
};

extern char data_ov002_022d016c[];
extern int func_ov002_021bc8c8(int arg0, int arg1, int arg2);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_022536e8(int arg0, int arg1, int arg2);

int func_ov002_02203580(struct Self02203580 *self, int param2) {
    if (self->disp != 2) {
        if (func_ov002_021bc8c8(self->b0 ^ self->b14, self->b0, self->idx5) != 0) {
            goto one;
        }
        return 0;
    }

    if (param2 != 0) {
        return 0;
    }

    if (*(int *)(data_ov002_022d016c + 0xcec) != self->b0) {
        return 0;
    }

    if (*(int *)(data_ov002_022d016c + 0xd0) & 1) {
        return 0;
    }

    if (func_ov002_021b3ecc(self->b0, 0xb, self->f0) == 0) {
        return 0;
    }

    if (func_ov002_022536e8(self->b0, self->f0, 0) == 0) {
        return 0;
    }

    goto one;

one:
    return 1;
}
