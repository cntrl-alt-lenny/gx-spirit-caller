typedef struct {
    char _pad0[0x80c];
    int f80c;
    int f810;
} S021d1f2c;

extern S021d1f2c data_ov002_022ce950;
extern void func_ov002_021c31d4(int player);
extern int func_ov002_0229ade0(int a, int b, int c, int d);

void func_ov002_021d1f2c(void) {
    int i;

    switch (data_ov002_022ce950.f810) {
    case 0:
        func_ov002_021c31d4(0);
        func_ov002_021c31d4(1);
        data_ov002_022ce950.f810++;
        break;
    case 1:
        for (i = 0; i < 2; i++) {
            func_ov002_0229ade0(0x14, i, 0xd, 0);
            func_ov002_0229ade0(0x14, i, 0xe, 0);
        }
        data_ov002_022ce950.f80c = 0;
        break;
    default:
        break;
    }
}
