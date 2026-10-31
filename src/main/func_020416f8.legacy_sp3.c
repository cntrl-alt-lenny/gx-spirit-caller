extern char data_020fe8f8[];
extern char data_020fe7f0[];
extern int func_020aaddc(const char *s);
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);
extern int OS_SNPrintf(signed char *buffer, int bufsz, const signed char *format, ...);
typedef struct {
    char *data;
    char *cur;
    char *end;
    int size;
} Buffer;
extern int func_020413b0(char *self, Buffer *buf, int extra);
int func_020416f8(char *self, const char *s, const char *value) {
    int len;
    Buffer *buf;
    int formatlen;
    int room;
    char saved;
    char *p;
    int n;
    buf = (Buffer *)(self + 0x19f4);
    len = func_020aaddc(value);
    formatlen = func_020aaddc(data_020fe8f8);
    len += formatlen - 4 + func_020aaddc(s);
    room = buf->end - buf->cur;
    if (len + 1 > room) {
        if (func_020413b0(self, buf, len - room + 1) == 0) {
            return 1;
        }
    }
    p = (char *)func_020ab0c4((unsigned char *)buf->data, (const unsigned char *)data_020fe7f0) + 2;
    saved = *p;
    func_020a7388((signed char *)(p + len), (signed char *)p, func_020aaddc(p) + 1);
    n = OS_SNPrintf((signed char *)p, len + 1, (const signed char *)data_020fe8f8, s, value);
    p[n] = saved;
    buf->cur += len;
    return 0;
}

