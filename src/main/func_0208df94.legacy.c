typedef unsigned short u16;
typedef unsigned int u32;

int func_0208df94(void)
{
    u32 mode = *(volatile u32 *)0x04001000 & 7;
    u16 v = *(volatile u16 *)0x0400100e;
    u32 sz = (u32)(v & 0x1f00) >> 8;
    switch (mode) {
    case 0:
    case 1:
    case 2:
        return (sz << 11) + 0x06200000;
    case 3:
    case 4:
    case 5:
        if (v & 0x80) {
            return (sz << 14) + 0x06200000;
        } else {
            return (sz << 11) + 0x06200000;
        }
    case 6:
        return 0;
    default:
        return 0;
    }
}
