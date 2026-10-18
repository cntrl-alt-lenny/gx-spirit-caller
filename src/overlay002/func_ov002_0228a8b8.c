typedef unsigned short u16;
typedef unsigned int u32;

u32 func_ov002_0228a8b8(void *a, u16 *p)
{
    switch (*p) {
    case 0x12e5:
    case 0x1303:
    case 0x149c:
    case 0x18fe:
    case 0x1920:
    case 0x1921:
    case 0x1a5c:
    case 0x1a7e:
    case 0x1a7f:
        return 1;
    default:
        return 0;
    }
}
