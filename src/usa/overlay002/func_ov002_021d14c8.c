typedef struct {
    unsigned short f_0;
    unsigned short f_2;
    char _pad1[0x808];
    unsigned int f_80c;
    unsigned int f_810;
} state_ov002_021d15b0_t;

extern state_ov002_021d15b0_t data_ov002_022ce870;
extern int func_ov002_0229acd0(int cmd, int a, int b, int c);
extern int func_ov002_0229c6e8(int a);

void func_ov002_021d14c8(void) {
    int flag = (data_ov002_022ce870.f_0 & 0x8000) ? 1 : 0;
    int f2 = data_ov002_022ce870.f_2;
    if (data_ov002_022ce870.f_810 == 0) {
        func_ov002_0229acd0(0x42, flag, f2, 0);
        data_ov002_022ce870.f_810 = data_ov002_022ce870.f_810 + 1;
        return;
    }
    if (func_ov002_0229c6e8(0x42) == 0)
        data_ov002_022ce870.f_80c = 0;
}
