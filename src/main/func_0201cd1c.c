extern unsigned int data_0218febc[];
extern char data_0218fef4[];
extern unsigned short data_0218ff4c[];
extern char data_0219000c[];
extern void func_020927b8(char *self);
extern void func_02092748(char *self);
extern void func_02094688(const void *src, void *dst, unsigned int size);

int func_0201cd1c(int a0, unsigned short *a1, int a2) {
    unsigned short buf[8];
    int header;
    int i;
    int remaining;
    unsigned short irq;
    unsigned int index;
    if (a2 > 16) {
        header = a1[0];
        for (i = 2; i + 14 < a2; ) {
            buf[0] = 0;
            func_02094688((char *)a1 + i, buf + 1, 14);
            i += 14;
            if (func_0201cd1c(255, buf, 16) == 0) return 0;
        }
        remaining = a2 - i;
        buf[0] = header;
        func_02094688((char *)a1 + i, buf + 1, remaining);
        return func_0201cd1c(a0, buf, remaining + 2);
    }
    if (data_0218febc[4] >= 31) return 0;
    a1[0] |= a0 << 8;
    irq = *(volatile unsigned short *)0x04000208;
    *(volatile unsigned short *)0x04000208 = 0;
    func_020927b8(data_0218fef4);
    index = (data_0218febc[1] + data_0218febc[4]) & 31;
    func_02094688(a1, data_0219000c + index * 16, a2);
    data_0218ff4c[index] = a2;
    data_0218febc[4]++;
    func_02092748(data_0218fef4);
    (void)*(volatile unsigned short *)0x04000208;
    *(volatile unsigned short *)0x04000208 = irq;
    return 1;
}

