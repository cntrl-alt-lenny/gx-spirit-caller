typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
extern int func_ov002_0228c460(int side);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c1a2c(int side, int slot, int id);
extern int func_ov002_021b9ecc(int side, int slot);
extern int func_ov002_021c8470(int a, int b);
int func_ov002_022930ec(Card021c1e44 *self) {
    int i;
    int excluded2, excluded1, minimum;
    if (func_ov002_0228c460(self->flag0) != 0) return 1;
    excluded2 = 0x1596;
    excluded1 = 0x13c3;
    minimum = 0x708;
    for (i = 0; i < 5; i++) {
        if (func_ov002_022575c8((int)self, 1 - self->flag0, i) != 0 &&
            func_ov002_021c1e44(self, 1 - self->flag0, i) == 0 &&
            func_ov002_021c1a2c(1 - self->flag0, i, self->f0) != 0) {
            int id = func_ov002_021b9ecc(1 - self->flag0, i);
            switch (id) { case 0x13c3: case 0x1596: continue; }
            if (func_ov002_021c8470(1 - self->flag0, i) >= minimum) return 1;
        }
    }
    return 0;
}




