typedef struct {
    unsigned short f_0;
    unsigned short f_2;
    unsigned short f_4;
    char _pad1[0x806];
    unsigned int f_80c;
    unsigned int f_810;
} state_ov002_021d3420_t;

extern state_ov002_021d3420_t data_ov002_022ce950;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d3420(void) {
    int flag = (data_ov002_022ce950.f_0 & 0x8000) ? 1 : 0;
    int f2 = data_ov002_022ce950.f_2;
    int f4 = data_ov002_022ce950.f_4;
    if (data_ov002_022ce950.f_810 == 0) {
        func_ov002_0229ade0(0x45, flag, f2, f4);
        data_ov002_022ce950.f_810 = data_ov002_022ce950.f_810 + 1;
    }
    if (func_ov002_0229c7f8(0x45) == 0)
        data_ov002_022ce950.f_80c = 0;
}
