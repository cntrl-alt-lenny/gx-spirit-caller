/* func_ov006_021b831c: double-buffer VRAM bank-copy dispatcher. arg1
 * selects one of 5 chunk transfers (each copying a fixed-size block from
 * one of two source banks, chosen by arg2, into a shared destination
 * bank); arg1 out of [0,4] just falls through to the shared tail. The
 * tail always copies one more halfword cell (position keyed by arg1) from
 * one of two sources (again chosen by arg2) to the same destination bank.
 * Returns 1. */
extern void Copy32(void *src, void *dst, int n);

int func_ov006_021b831c(char *base, int sel, int bank) {
    char *src, *dst;

    switch (sel) {
    case 0:
        src = bank ? (base + 0x1d8 + 0x8000) : (base + 0x2a0 + 0x6000);
        dst = base + 0x198 + 0x9800;
        Copy32(src, dst, 0x17c0);
        break;
    case 1:
        src = bank ? (base + 0x158 + 0xb000) : (base + 0xa60 + 0x7000);
        dst = base + 0x358 + 0xb000;
        Copy32(src, dst, 0x200);
        break;
    case 2:
        src = bank ? (base + 0x358 + 0xb400) : (base + 0xc60 + 0x7000);
        dst = base + 0x158 + 0xb800;
        Copy32(src, dst, 0x200);
        break;
    case 3:
        src = bank ? (base + 0x158 + 0xbc00) : (base + 0xe60 + 0x7000);
        dst = base + 0x358 + 0xbc00;
        Copy32(src, dst, 0x200);
        break;
    case 4:
        src = bank ? (base + 0x358 + 0xc000) : (base + 0x60 + 0x8000);
        dst = base + 0x58 + 0xc400;
        Copy32(src, dst, 0x100);
        break;
    default:
        break;
    }

    {
        unsigned short v;
        if (bank) {
            v = *(unsigned short *)(base + sel * 2 + 0xc600 + 0x58);
        } else {
            v = *(unsigned short *)(base + sel * 2 + 0x8100 + 0x60);
        }
        ((unsigned short *)(base + 0xc600 + 0x62))[sel] = v;
    }
    return 1;
}
