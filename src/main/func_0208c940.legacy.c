typedef unsigned short u16;
typedef short s16;
typedef unsigned int u32;
extern s16 data_02102498;
extern u16 data_021a6300;

void func_0208c940(void)
{
    u16 v = data_021a6300;
    data_02102498 = 1;
    if (v != 0) {
        *(u32 *)0x04000000 = (*(u32 *)0x04000000 & ~0x30000) | (v << 16);
    } else {
        *(u32 *)0x04000000 |= 0x10000;
    }
}
