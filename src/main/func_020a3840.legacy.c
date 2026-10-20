extern char *data_021a98fc;
extern void func_020945f4(void *p, int val, int size);
extern int func_0209e91c(void (*callback)(void *), unsigned int id);
extern void func_020a4b6c(void *);
extern void func_020a5d08(int a0);

void func_020a3840(unsigned int id) {
    int idx;
    int group;
    int offset;
    unsigned int mask;
    func_0209e91c(func_020a4b6c, id);
    if (id == 0) return;
    if (id >= 16) return;
    idx = id - 1;
    *(unsigned short *)(data_021a98fc + idx * 2 + 0x148a) = 0;
    func_020945f4((int *)(data_021a98fc + 0x14a8) + idx, 0, 4);
    func_020945f4(data_021a98fc + 0x1340 + idx * 22, 0, 22);
    func_020a5d08(id);
    *(unsigned short *)(data_021a98fc + idx * 2 + 0x1754) = 0;
    group = *(signed char *)(data_021a98fc + idx + 0x1526);
    if (group != -1) {
        offset = (unsigned char)group * 0x5d4;
        *(unsigned short *)(data_021a98fc + offset + 0x1d4e) &= ~(1 << id);
        *(unsigned short *)(data_021a98fc + offset + 0x1d50) |= 1 << id;
        *(signed char *)(data_021a98fc + (id - 1) + 0x1526) = -1;
        *(unsigned short *)(data_021a98fc + offset + 0x1d4c) &= ~(1 << id);
    }
    mask = 1 << id;
    if (*(unsigned short *)(data_021a98fc + 0x1536) & mask) {
        *(unsigned char *)(data_021a98fc + 0x1535) -= 1;
        *(unsigned short *)(data_021a98fc + 0x1536) &= ~mask;
    }
    *(int *)(data_021a98fc + idx * 4 + 0x14e8) = 0;
}





