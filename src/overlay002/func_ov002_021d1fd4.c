typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 f2;
    u16 f4;
    char _pad6[0x80c - 6];
    int f80c;
    int f810;
} S021d1fd4;

extern S021d1fd4 data_ov002_022ce950;
extern char data_ov002_022cf288[];
extern char data_ov002_022d016c[];
extern int func_ov002_021c3d84(int a);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d1fd4(void) {
    int a = (data_ov002_022ce950.f0 & 0x8000) != 0;
    u32 b = data_ov002_022ce950.f2 | (data_ov002_022ce950.f4 << 16);

    switch (data_ov002_022ce950.f810) {
    case 0:
        if (func_ov002_0229c7f8(-1) != 0)
            return;
        *(u32 *)(data_ov002_022d016c + 0xce4) = b;
        if (func_ov002_021c3d84(a) != 0)
            func_ov002_0229ade0(0x10, a, 0, 0);
        *(u32 *)(data_ov002_022cf288 + (a & 1) * 0x868) &= ~4;
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x10) != 0)
            return;
        data_ov002_022ce950.f80c = 0;
        return;
    default:
        break;
    }
}
