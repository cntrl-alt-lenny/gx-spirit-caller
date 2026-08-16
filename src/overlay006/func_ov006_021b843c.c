/* func_ov006_021b843c: per-index bank clear dispatcher. Fill32-clears one of
 * 5 fixed regions (offset depends on `mode`), then zeroes 1 or 2 parallel
 * u16 flag slots at (idx*2 + fixed base), depending on `mode`. Return 1. */
extern void Fill32(int val, void *dst, int size);

int func_ov006_021b843c(void *self, int idx, int mode)
{
    char *base = (char *)self;
    char *dst;

    switch (idx) {
    case 0:
        if (mode) { dst = base + 0x1d8; dst = dst + 0x8000; }
        else      { dst = base + 0x2a0; dst = dst + 0x6000; }
        Fill32(0, dst, 0x17c0);
        break;
    case 1:
        if (mode) { dst = base + 0x158; dst = dst + 0xb000; }
        else      { dst = base + 0xa60; dst = dst + 0x7000; }
        Fill32(0, dst, 0x200);
        break;
    case 2:
        if (mode) { dst = base + 0x358; dst = dst + 0xb400; }
        else      { dst = base + 0xc60; dst = dst + 0x7000; }
        Fill32(0, dst, 0x200);
        break;
    case 3:
        if (mode) { dst = base + 0x158; dst = dst + 0xbc00; }
        else      { dst = base + 0xe60; dst = dst + 0x7000; }
        Fill32(0, dst, 0x200);
        break;
    case 4:
        if (mode) { dst = base + 0x358; dst = dst + 0xc000; }
        else      { dst = base + 0x60;  dst = dst + 0x8000; }
        Fill32(0, dst, 0x100);
        break;
    }

    if (mode) {
        *(unsigned short *)(base + idx * 2 + 0xc658) = 0;
    } else {
        *(unsigned short *)(base + idx * 2 + 0x8160) = 0;
        *(unsigned short *)(base + idx * 2 + 0x816a) = 0;
    }

    return 1;
}
