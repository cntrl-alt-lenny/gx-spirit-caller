typedef unsigned char u8;
typedef signed char s8;
typedef unsigned short u16;
extern unsigned char *data_021a98fc;
extern u8 data_021026e0;
extern void func_020945f4(void *, int, unsigned int);
extern void func_02094688(const void *, void *, unsigned int);
extern void *func_020a5c80(void *, void *);
extern int func_020a2cbc(int a, int b, int c);
int func_020a0f38(void) {
    s8 chosen = -1;
    u16 mask = 0;
    struct { u8 type; u16 id; u16 value; } command;
    u8 counts[16];
    u16 i;
    u8 n;
    u8 current;
    unsigned char *base;
    void *dest;
    func_020945f4(counts, 0, 16);
    base = data_021a98fc;
    for (i = 1; i <= 15; i++) {
        if (*(int *)(base + 0x14e8 + (i-1)*4) == 5)
            counts[*(s8 *)(base + 0x1526 + (i-1))]++;
    }
    current = data_021026e0;
    for (n = 0; n < 16; n++) {
        current = (current + 1) % 16;
        if (*(u8 *)(base + current * 0x5d4 + 0x1d52) != 0) {
            if (counts[current] != 0) {
                chosen = current;
                break;
            }
        }
    }
    if (chosen == -1) return 21;
    data_021026e0 = chosen;
    for (i = 1; i <= 15; i++) {
        if (*(int *)(base + 0x14e8 + (i-1)*4) == 5) {
            if (chosen == *(s8 *)(base + 0x1526 + (i-1)))
                mask |= 1 << i;
        }
    }
    command.type = 3;
    command.id = chosen;
    dest = func_020a5c80(&command, base);
    if (dest != 0)
        func_02094688(data_021a98fc + 0x1788 + chosen * 0x5d4, dest, 0xe4);
    return func_020a2cbc(0xea, mask, (int)data_021a98fc);
}


