typedef struct {
    unsigned short f0;
    unsigned short b0   : 1;
    unsigned short _pad : 15;
} S0220b634;

typedef struct {
    char _pad0[0xcec];
    int  f_cec;
    char _pad1[0xcf8 - 0xcf0];
    int  f_cf8;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d016c;
extern int func_ov002_021c2e34(int player, int arg1);
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_022536e8(int a, unsigned short b, int c);

int func_ov002_0220b634(S0220b634 *self, int arg1) {
    if (arg1 != 0) {
        return 0;
    }
    if (data_ov002_022d016c.f_cec != self->b0) {
        return 0;
    }
    if (data_ov002_022d016c.f_cf8 != 2 && data_ov002_022d016c.f_cf8 != 4) {
        return 0;
    }
    if (func_ov002_021c2e34(self->b0, self->f0) < 0) {
        return 0;
    }
    if (func_ov002_021ca698(self->b0, self->b0) == 0) {
        return 0;
    }
    return func_ov002_022536e8(self->b0, self->f0, 0) >= 2;
}
