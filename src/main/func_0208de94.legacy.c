typedef unsigned short u16;
typedef unsigned int u32;

int func_0208de94(void)
{
    int mode = *(volatile u32 *)0x04000000 & 7;
    u16 v = *(volatile u16 *)0x0400000c;
    if (mode < 5 || !(v & 0x80)) {
        return (((*(volatile u32 *)0x04000000 & 0x07000000) >> 24) << 16) + 0x06000000 + ((((u32)(v & 0x3c)) >> 2) << 14);
    }
    return 0;
}
