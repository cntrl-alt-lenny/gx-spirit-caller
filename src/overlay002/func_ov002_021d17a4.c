extern struct {
    unsigned short flags;
    unsigned short a;
    unsigned short b;
    char pad[0x806];
    int state;
    int count;
} data_ov002_022ce950;
extern int func_ov002_021b009c(void);
extern int func_ov002_0229ade0(int, int, int, int);
extern int func_ov002_0229c7f8(int);

void func_ov002_021d17a4(void)
{
    int flag = (data_ov002_022ce950.flags & 0x8000) != 0;
    int a = data_ov002_022ce950.a;
    int b = data_ov002_022ce950.b;
    if (data_ov002_022ce950.count == 0) {
        func_ov002_021b009c();
        func_ov002_0229ade0(0x38, flag, a, b);
        data_ov002_022ce950.count++;
    } else {
        if (func_ov002_0229c7f8(0x38) == 0)
            data_ov002_022ce950.state = 0;
    }
}
