extern int func_020aaddc(const char *s);
extern int func_020aee3c(const unsigned short *s);
extern int func_020415c8(char *self, const char *s, const void *src, unsigned int size);
extern int func_020409d8(char *, const void *);
extern int func_0204068c(char *, const char *, int);
extern unsigned long long data_0219d9d8;
extern int data_0219d9f8;
extern int data_0219d9cc;
extern char data_020fe5a0[], data_020fe5ac[], data_020fe5b4[], data_020fe5bc[];
extern char data_020fe5c4[], data_020fe5c8[], data_020fe5d0[];

int func_0203f7c0(char *self, const char *s, const unsigned short *wide) {
    char local[0x94];
    if (data_0219d9d8 == 0) {
        if (func_020415c8(self, data_020fe5ac, data_020fe5a0, func_020aaddc(data_020fe5a0)))
            return 8;
    } else {
        if (func_020415c8(self, data_020fe5ac, data_020fe5b4, func_020aaddc(data_020fe5b4)))
            return 8;
        if (func_020415c8(self, data_020fe5bc, s, func_020aaddc(s)))
            return 8;
    }
    if (!func_020409d8(local, &data_0219d9d8))
        return 5;
    if (!func_0204068c(self, local, data_0219d9f8))
        return 8;
    if (data_0219d9cc == 1) {
        if (func_020415c8(self, data_020fe5c8, data_020fe5c4, func_020aaddc(data_020fe5c4)))
            return 8;
    }
    if (func_020aee3c(wide) != 0) {
        if (func_020415c8(self, data_020fe5d0, wide, func_020aee3c(wide) * 2))
            return 8;
    }
    return 0;
}
