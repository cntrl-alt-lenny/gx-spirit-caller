extern unsigned char data_02104f4c[];
extern void func_0200a7a4(int *buf);
extern void Copy32(void *src, void *dst, int size);

int func_0200a928(void) {
    unsigned char *base = data_02104f4c;
    int buf[2];
    int changed = 0;
    int i;

    func_0200a7a4(buf);
    for (i = 0; i < 2; i++) {
        if ((buf[i] ^ ((int *)(base + 0x18a8))[i]) != 0) {
            changed = 1;
            break;
        }
    }
    Copy32(buf, base + 0x18a8, 8);
    return changed;
}
