typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
    int pad[6];
    int slots[3];
    int pad2[5];
    int a;
    int pad3;
    int b;
} Obj;

typedef struct {
    unsigned short bit0 : 1;
    unsigned short val5 : 5;
    unsigned short val8 : 8;
    unsigned short : 2;
} Bits;

extern char data_ov002_022d1910[];
extern char data_ov002_022d0f2c[];
extern int func_ov002_022ae718(unsigned short *p);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
extern void func_ov002_0229a414(int flag);
extern void func_ov002_022ae9c0(Obj *p, unsigned short v);
extern int func_02037208(int a0, int r1, int r2, int r3);

void func_ov002_022aead0(Obj *self) {
    int flag = func_ov002_022ae718(&self->f0);
    unsigned short value;
    *(unsigned short *)&value = *(unsigned short *)(data_ov002_022d1910 + 0x90);
    int mode = flag ? 12 : 11;
    func_ov002_02259774(((const Bits *)&value)->bit0, ((const Bits *)&value)->val5, ((const Bits *)&value)->val8, mode);
    if (*(int *)(data_ov002_022d0f2c + 0xc8) != 0)
        func_ov002_0229a414(0);
    func_ov002_022ae9c0(self, 0);
    if (flag == 0)
        func_02037208(0x3a, -1, 0, 1);
}















