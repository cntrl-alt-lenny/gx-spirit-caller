extern unsigned char data_021040ac[];

int func_0200c078(void *a, int idx, unsigned int val, int mode)
{
    unsigned int v = *(unsigned int *)(*(char **)((char *)a + 0x18) + idx * 0x20 + 0x18);
    if (v == val) return 1;
    if (mode == 1) {
        if (v < val) return 1;
    } else if (mode == 2) {
        if (v > val) return 1;
    }
    *(unsigned int *)((char *)a + 0x25c) = val;
    *(int *)((char *)a + 0x260) = idx;
    *(unsigned int *)((char *)a + 0x7c) |= 0x4000000;
    *(int *)(data_021040ac + 0x20) = 1;
    return 1;
}
