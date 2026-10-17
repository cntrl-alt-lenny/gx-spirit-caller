typedef unsigned short u16;
typedef unsigned int u32;

int func_0208de4c(void)
{
    int mode = *(volatile u32 *)0x04001000 & 7;
    u16 v = *(volatile u16 *)0x0400100c;
    if (mode < 5 || !(v & 0x80)) {
        return ((((u32)(v & 0x3c)) >> 2) << 14) + 0x06200000;
    }
    return 0;
}
