extern int func_020aaddc(const char *s);
extern int func_020aee3c(const unsigned short *s);
extern int func_020415c8(char *self, const char *s, const void *src, unsigned int size);
extern int func_020416f8(void *, const char *, const char *);
extern int OS_SNPrintf(char *, int, const char *, ...);
extern char data_020fe68c[], data_020fe698[], data_020fe6a0[], data_020fe6a8[], data_020fe6b0[], data_020fe6b8[], data_020fe6c0[], data_020fe6c8[], data_020fe6d0[], data_020fe6d8[], data_020fe6e0[], data_020fe6e8[], data_020fe6f0[], data_020fe6f8[], data_020fe700[], data_020fe708[], data_020fe720[], data_020fe72c[];
int func_0204068c(char *self, const char *in, int flag) {
    char buf[0x21];
    OS_SNPrintf(buf, 0x21, data_020fe68c, 1, 2);
    if (func_020415c8(self, data_020fe698, buf, func_020aaddc(buf))) return 0;
    if (func_020415c8(self, data_020fe6a0, in, func_020aaddc(in))) return 0;
    if (func_020415c8(self, data_020fe6a8, in + 0xe, func_020aaddc(in + 0xe))) return 0;
    if (func_020415c8(self, data_020fe6b0, in + 0x41, func_020aaddc(in + 0x41))) return 0;
    if (func_020415c8(self, data_020fe6b8, in + 0x6f, func_020aaddc(in + 0x6f))) return 0;
    if (func_020415c8(self, data_020fe6c0, in + 0x15, func_020aaddc(in + 0x15))) return 0;
    if (func_020415c8(self, data_020fe6c8, in + 0x1a, func_020aaddc(in + 0x1a))) return 0;
    if (func_020415c8(self, data_020fe6d0, in + 0x1d, func_020aaddc(in + 0x1d))) return 0;
    if (func_020415c8(self, data_020fe6d8, in + 0x1f, func_020aaddc(in + 0x1f))) return 0;
    if (func_020415c8(self, data_020fe6e0, in + 0x2c, func_020aaddc(in + 0x2c))) return 0;
    if (func_020415c8(self, data_020fe6e8, in + 0x2f, func_020aaddc(in + 0x2f))) return 0;
    if (func_020415c8(self, data_020fe6f0, in + 0x34, func_020aaddc(in + 0x34))) return 0;
    if (func_020415c8(self, data_020fe6f8, in + 0x7e, func_020aee3c((const unsigned short *)(in + 0x7e)) * 2)) return 0;
    if (flag == 1) {
        if (func_020415c8(self, data_020fe700, in + 0x4e, func_020aaddc(in + 0x4e))) return 0;
    }
    OS_SNPrintf(buf, 0x21, data_020fe708, 1, 2);
    if (func_020416f8(self, data_020fe720, buf)) return 0;
    if (func_020416f8(self, data_020fe72c, in + 0x15)) return 0;
    return 1;
}