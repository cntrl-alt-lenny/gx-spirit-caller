typedef unsigned short u16;

int func_0208c844(volatile u16 *value)
{
    u16 type = *value & 0xc000;
    if (type == 0)
        return 0;
    if (type == 0x4000)
        return *value & 0x1f;
    if (type == 0x8000)
        return -(*value & 0x1f);
    return 0;
}
