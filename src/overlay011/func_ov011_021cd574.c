typedef unsigned int u32;
typedef int s32;

extern u32 data_ov011_021d4000[];
extern u32 data_ov011_021d403c[];
extern u32 func_0201b770();
extern void func_ov011_021cd0dc(s32 a, s32 b, s32 c, s32 d, s32 *e, s32 f, s32 g, s32 h);

void func_ov011_021cd574(void)
{
    s32 arr[2];
    u32 flags;
    u32 *p;
    u32 *q;

    p = data_ov011_021d4000;
    q = data_ov011_021d403c;
    if (((p[0x2a4 / 4] << 23) >> 28) != 2) {
        return;
    }
    flags = func_0201b770();
    arr[0] = 0x56000 - q[0x1fc / 4];
    arr[1] = 0x14c000 - q[0x200 / 4];
    if (flags & 0x2000) {
        func_ov011_021cd0dc(7, -1, 2, 0x1b, arr, 0, 0, 0);
    }
    if (flags & 0x4000) {
        func_ov011_021cd0dc(6, -1, 2, 0x1b, arr, 0, 0, 0);
    }
}
