typedef unsigned short u16;

typedef struct {
    u16 flags;
    char pad[0x80a];
    int f80c;
    int f810;
} State;

extern State data_ov002_022ce950;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int cmd, int a);

void func_ov002_021d1820(void)
{
    int flag = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;

    if (data_ov002_022ce950.f810 == 0) {
        func_ov002_0229ade0(0x3a, flag, 0, 0);
        data_ov002_022ce950.f810++;
    } else {
        if (func_ov002_0229c7f8(0x3a, flag) == 0) {
            data_ov002_022ce950.f80c = 0;
        }
    }
}
