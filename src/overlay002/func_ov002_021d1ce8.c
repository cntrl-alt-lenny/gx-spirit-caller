typedef unsigned short u16;

typedef struct {
    u16 flags;
    u16 f2;
    u16 f4;
    u16 f6;
    char pad[0x804];
    int f80c;
    int f810;
} State;

extern State data_ov002_022ce950;
extern void func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int cmd);

void func_ov002_021d1ce8(void)
{
    int flag = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    if (data_ov002_022ce950.f810 == 0) {
        func_ov002_0229ade0(0x3e, flag, data_ov002_022ce950.f2,
                            data_ov002_022ce950.f4 | (data_ov002_022ce950.f6 << 16));
        data_ov002_022ce950.f810++;
    }
    if (func_ov002_0229c7f8(0x3e) == 0) {
        data_ov002_022ce950.f80c = 0;
    }
}
