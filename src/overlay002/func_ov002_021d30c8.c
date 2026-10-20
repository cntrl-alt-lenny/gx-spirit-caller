typedef struct {
    unsigned short f0, f2, f4, f6;
    char pad[0x804];
    int f80c;
    int f810;
} State;
extern State data_ov002_022ce950;
extern int func_ov002_0229ade0(int, int, int, int);
extern int func_ov002_0229c7f8(int);

void func_ov002_021d30c8(void)
{
    int flag = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    int state = data_ov002_022ce950.f810;
    int f2 = data_ov002_022ce950.f2;
    int f4 = data_ov002_022ce950.f4;
    int f6 = data_ov002_022ce950.f6;
    if (state == 0) {
        func_ov002_0229ade0(0x40, flag, f2, (unsigned short)((unsigned char)f6 | ((unsigned char)f4 << 8)));
        data_ov002_022ce950.f810++;
    }
    if (func_ov002_0229c7f8(0x40) == 0) {
        func_ov002_0229ade0(8, 0, 0, 0);
        data_ov002_022ce950.f80c = 0;
    }
}

