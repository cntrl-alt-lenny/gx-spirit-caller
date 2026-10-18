typedef unsigned short u16;

struct S {
    u16 id;
    u16 side : 1;
    u16 _p2a : 5;
    u16 type : 6;
    u16 _p2b : 4;
    u16 _p4a : 2;
    u16 skip : 1;
    u16 _p4b : 13;
};

extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202df78(int a, int b);
extern int func_ov002_021c1e44(void *self, int a, int b);
extern int func_ov002_021d59cc(int a, int b, int c, int d, int e);
extern void func_ov002_021e276c(int a, int b, int c, int d);
extern int func_ov002_0220e75c(void *self, int a);

int func_ov002_0222c590(struct S *self, int arg) {
    int i;

    if (self->skip) {
        return 0;
    }
    if (self->type != 0x23) {
        for (i = 0; i <= 4; i++) {
            if (func_0202df78(func_ov002_021b9ecc(self->side, i), 0xfa7) != 0
                && func_ov002_021c1e44(self, self->side, i) != 0) {
                func_ov002_021d59cc(self->side, i, self->id, 1, 0);
            }
        }
        func_ov002_021e276c(self->side, self->id, 1, 0);
    }
    return func_ov002_0220e75c(self, arg);
}
