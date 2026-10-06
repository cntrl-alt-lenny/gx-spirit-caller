extern void func_020a68e0(unsigned char *table, int poly);
extern int func_020a6754(int a, int b, int c);

int func_020534d4(unsigned long long id, int extra) {
    unsigned int key[2];
    unsigned char work[0x100];
    long long h;
    if (id & 0x80000000) {
        return 0;
    }
    key[0] = (unsigned int)id;
    key[1] = extra;
    func_020a68e0(work, 7);
    h = func_020a6754((int)work, (int)key, 8) & 0x7f;
    return h == (id >> 32);
}
