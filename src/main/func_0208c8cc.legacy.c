typedef unsigned short u16;
typedef unsigned int u32;
extern u16 data_02102498;
extern u16 data_021a6300;

void func_0208c8cc(u32 a, u32 b, u32 c)
{
    u16 flag = data_02102498;
    u32 v = *(u32 *)0x04000000;
    data_021a6300 = a;
    if (flag == 0) {
        a = 0;
    }
    *(u32 *)0x04000000 = (v & 0xfff0fff0) | (a << 16) | b | (c << 3);
    if (data_021a6300 == 0) {
        data_02102498 = 0;
    }
}
