extern char data_ov002_022d0e4c[];
extern int data_ov002_022d1a18;
extern int data_ov002_022d1a84;
extern int data_020c3d68;
extern int data_02103cc0;

extern void func_ov002_022b2ef8(int *p, int v);
extern void func_ov002_022b5070(int *p, int v);

void func_ov002_0229a304(int flag) {
    *(int *)(data_ov002_022d0e4c + 0xc8) = flag;
    if (flag != 0) {
        func_ov002_022b2ef8(&data_ov002_022d1a18, 0);
        func_ov002_022b5070(&data_ov002_022d1a84, 1);
        data_02103cc0 = 1;
        data_020c3d68 = 0;
    } else {
        func_ov002_022b5070(&data_ov002_022d1a84, 0);
        func_ov002_022b2ef8(&data_ov002_022d1a18, 1);
        data_02103cc0 = 1;
        data_020c3d68 = 1;
    }
}
