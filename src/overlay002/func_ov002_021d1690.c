typedef unsigned short u16;

typedef struct {
    u16 flags;
    u16 a;
    u16 b;
    char pad[0x806];
    int f80c;
    int f810;
} State;

extern State data_ov002_022ce950;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int cmd, int a, int b, int c);

void func_ov002_021d1690(void)
{
    int flag = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int cnt = data_ov002_022ce950.f810;
    u16 a = data_ov002_022ce950.a;
    u16 b = data_ov002_022ce950.b;

    if (cnt == 0) {
        func_ov002_0229ade0(0x2f, flag, a, b);
        data_ov002_022ce950.f810++;
    } else {
        if (func_ov002_0229c7f8(0x2f, flag, a, b) == 0) {
            data_ov002_022ce950.f80c = 0;
        }
    }
}
