typedef unsigned short u16;

struct S02241fec {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int data_ov002_022ce288[];
extern int data_ov002_022cd744[];
extern int data_ov002_022d016c[];

extern int func_ov002_021b4120(int a, int b, int c);
extern int func_ov002_021b947c(void);
extern void func_ov002_0223dad0(void *self, unsigned short val);
extern void func_ov002_021d5b80(int a, int b, int c, int d);
extern int func_ov002_021ae4bc(int a, int b);

int func_ov002_02241fec(struct S02241fec *self) {
    int idx;
    switch (data_ov002_022ce288[0x16e]) {
    case 0:
        idx = func_ov002_021b4120(self->bit0, 0xb, 0x1415);
        if (idx >= 0) {
            func_ov002_021b947c();
            func_ov002_0223dad0(self, (unsigned short)idx);
            func_ov002_021d5b80(self->bit0, 0xb, self->f0, 0);
        } else {
            return -1;
        }
        if (data_ov002_022cd744[self->bit0] == 1)
            data_ov002_022d016c[0x351] = 1;
        else
            func_ov002_021ae4bc(0x35, idx);
        data_ov002_022ce288[0x16e]++;
        return 0;
    case 1:
        if (data_ov002_022d016c[0x351] != 0)
            return 1;
        return -1;
    default:
        return 1;
    }
}
