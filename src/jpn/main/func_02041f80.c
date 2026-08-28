extern int func_020416a8(void *arg0, const char *arg1, const char *arg2);
extern char *func_020aafd0(char *haystack, char *needle);
extern int func_020aace8(const char *s);
extern void OS_SNPrintf(void *buf, int bufsz, void *fmt, int arg0);

extern char data_020fe710[];
extern char data_020fe8dc[];
extern char data_020fe8e8[];
extern char data_020fe8f0[];
extern char data_020fe8f4[];

int func_02041f80(void *arg0) {
    char buf[8];
    char *haystack;
    char *found;
    int y;

    if (func_020416a8(arg0, data_020fe8dc, data_020fe8e8) != 0) {
        return 1;
    }

    haystack = *(char **)((char *)arg0 + 0x19f4);
    found = func_020aafd0(haystack, data_020fe710);
    y = func_020aace8(found + 4);
    if (y != 0) {
        OS_SNPrintf(buf, 7, data_020fe8f0, y);

        if (func_020416a8(arg0, data_020fe8f4, buf) != 0) {
            return 1;
        }
    }
    return 0;
}
