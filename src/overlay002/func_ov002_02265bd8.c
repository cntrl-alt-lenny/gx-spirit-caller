typedef struct {
    char pad0[0xcec];
    int side;
    int count;
    int start;
    char pad1[0xc];
    int flag;
    char pad2[0x18];
    int state;
} Data;
extern Data data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int data_ov002_022cd524;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021e2d20(int arg0, int arg1, int arg2);
extern int func_ov002_0229cd5c();
int func_ov002_02265bd8(void) {
    int side = data_ov002_022d016c.side;
    switch (data_ov002_022d016c.state) {
    case 0:
        func_ov002_021d479c((side != 0 ? 0x8000 : 0) | 2, 0, 0, 0);
        if (data_ov002_022cd744[side] == 1)
            func_ov002_0229cd5c((int)&data_ov002_022cd524, 0x218);
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        if (func_ov002_021b3ecc(side, 0xb, 0x1356) != 0)
            func_ov002_021e2d20(side, 0x18, 1);
        if (data_ov002_022d016c.flag != 1 && data_ov002_022d016c.count == data_ov002_022d016c.start + 1)
            func_ov002_021d479c((side != 0 ? 0x8000 : 0) | 0xb, 1, 0, 0);
        if (data_ov002_022d016c.count == data_ov002_022d016c.start + 4)
            func_ov002_021d479c((side != 0 ? 0x8000 : 0) | 0xb, 2, 0, 0);
        break;
    }
    return 1;
}

