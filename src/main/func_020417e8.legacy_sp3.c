extern char data_020fe904[];
extern char data_020fe958[];
extern int func_020aaddc(const char *s);
extern int OS_SNPrintf(signed char *buffer, int bufsz, const signed char *format, ...);
typedef struct {
    char *data;
    char *cur;
    char *end;
    int size;
} Buffer;
extern int func_020414b0(char *self, Buffer *buf, int size);
int func_020417e8(char *self) {
    const char *format;
    Buffer *buf;
    int len;
    int n;
    buf = (Buffer *)(self + 0x19f4);
    format = *(int *)(self + 0x1008) == 0 ? data_020fe904 : data_020fe958;
    len = func_020aaddc(*(char **)(self + 0x1124));
    len += func_020aaddc(format) - 4 + func_020aaddc(*(char **)(self + 0x1128));
    if (func_020414b0(self, (Buffer *)(self + 0x19f4), len + 0x400) != 1) return 1;
    n = OS_SNPrintf((signed char *)buf->cur, buf->size, (const signed char *)format,
        *(char **)(self + 0x1128), *(char **)(self + 0x1124));
    buf->cur += n;
    return 0;
}

