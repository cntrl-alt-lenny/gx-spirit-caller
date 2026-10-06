extern void func_020a67cc(void *buf, unsigned int poly);
extern int func_020a66e8(int a, int b, int c);

int func_02053114(char *p) {
    unsigned int table[256];
    int crc;

    func_020a67cc(table, 0xedb88320);
    crc = func_020a66e8((int)table, (int)p, 0x3c);
    return crc == *(int *)(p + 0x3c);
}
