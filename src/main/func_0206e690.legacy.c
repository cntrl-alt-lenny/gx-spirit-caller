extern char data_02101e94[];
extern void func_02094688(const void *src, void *dst, int n);
extern void func_0206e670(unsigned int v, unsigned char *dst);
extern int OS_SNPrintf(char *buffer, int bufsz, const char *format, ...);

char *func_0206e690(int family, const void *src, char *buf, unsigned int len) {
    unsigned int addr;
    unsigned char b[4];

    if (family != 2) {
        return 0;
    }
    if (len < 0x10) {
        return 0;
    }
    func_02094688(src, &addr, 4);
    func_0206e670(addr, b);
    OS_SNPrintf(buf, 0x10, data_02101e94, b[3], b[2], b[1], b[0]);
    return buf;
}
