extern unsigned char data_02103fcc[];

int func_0200c268(void *a, int idx, unsigned int val, int mode)
{
    unsigned int v = *(unsigned int *)(*(char **)((char *)a + 0x1c) + idx * 0xc + 0x8);
    if (v == val) return 1;
    if (mode == 1) {
        if (v < val) return 1;
    } else if (mode == 2) {
        if (v > val) return 1;
    }
    *(unsigned int *)((char *)a + 0x264) = val;
    *(int *)((char *)a + 0x268) = idx;
    *(unsigned int *)((char *)a + 0x7c) |= 0x8000000;
    *(int *)(data_02103fcc + 0x20) = 1;
    return 1;
}
