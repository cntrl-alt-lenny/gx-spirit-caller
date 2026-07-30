extern char data_ov002_022d0f2c[];
extern int data_ov002_022d1af8;
extern int data_ov002_022d1b64;
extern int data_020c3e48;
extern int data_02103da0;

extern void func_ov002_022b303c(int *p, int v);
extern void func_ov002_022b5180(int *p, int v);

void func_ov002_0229a414(int flag) {
    *(int *)(data_ov002_022d0f2c + 0xc8) = flag;
    if (flag != 0) {
        func_ov002_022b303c(&data_ov002_022d1af8, 0);
        func_ov002_022b5180(&data_ov002_022d1b64, 1);
        data_02103da0 = 1;
        data_020c3e48 = 0;
    } else {
        func_ov002_022b5180(&data_ov002_022d1b64, 0);
        func_ov002_022b303c(&data_ov002_022d1af8, 1);
        data_02103da0 = 1;
        data_020c3e48 = 1;
    }
}
