typedef unsigned short u16;

struct S {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern int func_ov002_0223def4(struct S *self, int a);
extern int func_ov002_021b99b4(unsigned int bit, int b);
extern void func_ov002_021d7d0c(struct S *self, int a, void *p);
extern void func_ov002_021e276c(unsigned int bit, u16 f0, int k, unsigned int v);

int func_ov002_02228b08(struct S *self) {
    switch (data_ov002_022ce288[0x5a8 / 4]) {
    case 0x80: {
        int idx = func_ov002_021b99b4(self->bit0, func_ov002_0223def4(self, 0));
        unsigned int b;
        if (idx < 0) {
            return 0;
        }
        b = self->bit0;
        func_ov002_021d7d0c(self, self->bit0, data_ov002_022cf16c + (b & 1) * 0x868 + 0x418 + idx * 4);
        return 0x7f;
    }
    case 0x7f: {
        unsigned int v = func_ov002_0223def4(self, 0);
        func_ov002_021e276c(self->bit0, self->f0, 1, (u16)v);
        return 0;
    }
    }
    return 0;
}
