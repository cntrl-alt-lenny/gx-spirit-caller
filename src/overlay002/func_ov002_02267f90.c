struct S02267f90 {
    char _pad0[0xcec];
    int f_cec;
    char _pad1[0xd24 - 0xcec - 4];
    int f_d24;
};
extern struct S02267f90 data_ov002_022d016c;
extern int  func_ov002_021b9e00(int a, int b);

int func_ov002_02267f90(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    if (sum <= 10) {
        if (arg0 == (data_ov002_022d016c.f_cec ^ data_ov002_022d016c.f_d24)) {
            if (func_ov002_021b9e00(arg0, sum) != 0)
                return 0x800;
        }
    }
    return 0;
}
