typedef unsigned short u16;

typedef struct {
    u16 flags;
    u16 f2;
    u16 f4;
    char pad[0x806];
    int f80c;
    int f810;
} State;

extern State data_ov002_022ce950;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int cmd, int a, int b, int c);

void func_ov002_021d190c(void)
{
    int flag = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int n = data_ov002_022ce950.f810;
    u16 b = data_ov002_022ce950.f2;
    u16 c = data_ov002_022ce950.f4;

    if (n == 0) {
        func_ov002_0229ade0(0x3b, flag, c, b);
        data_ov002_022ce950.f810++;
    } else {
        if (func_ov002_0229c7f8(0x3b, flag, c, b) == 0) {
            data_ov002_022ce950.f80c = 0;
        }
    }
}
