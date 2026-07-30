extern int func_020416f8(void *arg0, const char *arg1, const char *arg2);
extern char *func_020ab0c4(char *haystack, char *needle);
extern int func_020aaddc(const char *s);
extern void OS_SNPrintf(void *buf, int bufsz, void *fmt, int arg0);

extern char data_020fe7f0[];
extern char data_020fe9bc[];
extern char data_020fe9c8[];
extern char data_020fe9d0[];
extern char data_020fe9d4[];

int func_02041fd0(void *arg0) {
    char buf[8];
    char *haystack;
    char *found;
    int y;

    if (func_020416f8(arg0, data_020fe9bc, data_020fe9c8) != 0) {
        return 1;
    }

    haystack = *(char **)((char *)arg0 + 0x19f4);
    found = func_020ab0c4(haystack, data_020fe7f0);
    y = func_020aaddc(found + 4);
    if (y != 0) {
        OS_SNPrintf(buf, 7, data_020fe9d0, y);

        if (func_020416f8(arg0, data_020fe9d4, buf) != 0) {
            return 1;
        }
    }
    return 0;
}
