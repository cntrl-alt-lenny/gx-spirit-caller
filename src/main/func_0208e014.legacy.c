typedef unsigned short u16;
typedef unsigned int u32;

int func_0208e014(void)
{
    u32 mode = *(volatile u32 *)0x04000000 & 7;
    u16 v = *(volatile u16 *)0x0400000e;
    int base = ((*(volatile u32 *)0x04000000 & 0x38000000) >> 27) << 16;
    u32 sz = (u32)(v & 0x1f00) >> 8;
    switch (mode) {
    case 0:
    case 1:
    case 2:
        return base + 0x06000000 + (sz << 11);
    case 3:
    case 4:
    case 5:
        if (v & 0x80) {
            return (sz << 14) + 0x06000000;
        } else {
            return base + 0x06000000 + (sz << 11);
        }
    case 6:
        return 0;
    default:
        return 0;
    }
}
