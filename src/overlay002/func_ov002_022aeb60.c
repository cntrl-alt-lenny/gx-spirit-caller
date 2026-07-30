/* func_ov002_022aeb60: flag = (d0f2c->+0xc8 == 0); dispatch func_02037208
 * with either (0x56,-1,0,1) [flag set, plus a d1af8+4 zero-store] or
 * (0x42,-1,0,1); notify func_ov002_0229a414(flag); clamp d0f2c->+0xd4 to
 * >=8; zero self->+0x38; set self->+0x40=1. */
extern int func_02037208(int a, int b, int c, int d);
extern void func_ov002_0229a414(int a);
extern char data_ov002_022d0f2c[];
extern char data_ov002_022d1af8[];

void func_ov002_022aeb60(void *self) {
    int val = *(int *)(data_ov002_022d0f2c + 0xc8);
    int flag = (val == 0) ? 1 : 0;
    int d4val;

    if (flag != 0) {
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        func_02037208(0x56, 0x56 - 0x57, 0, 1);
    } else {
        func_02037208(0x42, 0x42 - 0x43, 0, 1);
    }

    func_ov002_0229a414(flag);

    d4val = *(int *)(data_ov002_022d0f2c + 0xd4);
    if (d4val < 8)
        d4val = 8;
    *(int *)(data_ov002_022d0f2c + 0xd4) = d4val;

    *(int *)((char *)self + 0x38) = 0;
    *(int *)((char *)self + 0x40) = 1;
}
