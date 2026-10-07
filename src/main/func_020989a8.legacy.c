extern void *data_021024bc;
extern int data_021024c0;
extern void func_020945f4(void *dst, int val, int size);
extern void func_02094688(void *src, void *dst, int size);
extern void func_020992d8(void *out, int a1, int a2, void *ctx, int size);

int func_020989a8(unsigned int expected, int a1, int a2) {
    int hash[5];
    char ctx[0x40];
    unsigned int i;
    int *p;
    func_020945f4(hash, 0, 0x14);
    func_02094688(data_021024bc, ctx, data_021024c0);
    func_020992d8(hash, a1, a2, ctx, data_021024c0);
    p = hash;
    for (i = 0; i < 0x14; i += 4, p++) {
        if (*p != *(int *)(expected + i)) {
            break;
        }
    }
    return i == 0x14 ? 1 : 0;
}
