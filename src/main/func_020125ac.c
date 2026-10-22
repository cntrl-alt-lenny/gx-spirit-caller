typedef struct {
    char pad[0xb84];
    int f_b84, f_b88;
    char pad_b8c[0x14];
    int f_ba0;
    char pad_ba4[0xc];
    int f_bb0, f_bb4;
    char pad_bb8[4];
    int f_bbc, f_bc0, f_bc4, f_bc8;
    char pad_bcc[0x6c];
    int f_c38, f_c3c, f_c40, f_c44, f_c48;
} State;
extern State data_021040ac;
/* Original caller supplies r0=0x26 and r1=0 and consumes r0; callee C declares void(void). */
extern int func_02011aec(int a, int b);
void func_020125ac(void) {
    data_021040ac.f_ba0 = 0;
    data_021040ac.f_bbc = 1;
    data_021040ac.f_bc0 = 0x26;
    data_021040ac.f_bc4 = -1;
    data_021040ac.f_bc8 = func_02011aec(0x26, 0);
    data_021040ac.f_bb0 = 0;
    data_021040ac.f_bb4 = -1;
    data_021040ac.f_c38 = 0;
    data_021040ac.f_c3c = 0;
    data_021040ac.f_c48 = 2;
    data_021040ac.f_c40 = 1;
    data_021040ac.f_c44 = 1;
    data_021040ac.f_b88 = 0;
    data_021040ac.f_b84 = 1;
}


