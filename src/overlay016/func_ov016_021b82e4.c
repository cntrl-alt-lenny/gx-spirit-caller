extern char data_ov016_021b9784[];
extern void func_ov016_021b8774(void *self0, void *arg1_0);
extern void func_ov016_021b83a0(void *self, void *entry);

int func_ov016_021b82e4(void *arg0) {
    char *self = arg0;
    char *table = data_ov016_021b9784;
    int offset = *(int *)(self + 0x1dc) * 0x54;
    if (*(int *)(self + 0x1f0) == 0) {
        if (*(unsigned short *)(self + 0x1d8) == 0) {
            if (*(int *)(self + 0x1e0) < 0x50)
                *(int *)(self + 0x1e0) += 0x10;
            if (*(int *)(self + 0x1e8) < 0x18)
                *(int *)(self + 0x1e8) += 0x10;
        } else if (*(int *)(self + 0x1e0) < 0) {
            func_ov016_021b8774(self, table + offset);
            func_ov016_021b83a0(self, table + offset);
            *(unsigned short *)(self + 0x1d8) = 0;
        }
    } else {
        if (*(int *)(self + 0x1e0) > -0xa0)
            *(int *)(self + 0x1e0) -= 0x18;
        if (*(int *)(self + 0x1e8) > -0xd8)
            *(int *)(self + 0x1e8) -= 0x18;
    }
    return 1;
}


