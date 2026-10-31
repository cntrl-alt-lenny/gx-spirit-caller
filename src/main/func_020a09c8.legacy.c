typedef unsigned short u16;
extern unsigned int data_021a9840;
extern unsigned char *data_021a98fc;
void func_020a09c8(int index) {
    u16 target;
    unsigned char *p;
    u16 current;
    if (!(data_021a9840 & (1 << index))) return;
    p = data_021a98fc + index * 0x5d4;
    if (!p[0x1d52]) return;
    if (!*(u16 *)(p + 0x1d4c)) return;
    current = *(u16 *)(p + 0x1d48);
    target = *(u16 *)(p + 0x1d4a);
    if (target <= current) {
        if (current <= target + 2) {
            *(u16 *)(p + 0x1d48) = current + 1;
            return;
        }
    }
    *(u16 *)(p + 0x1d48) = target;
}

