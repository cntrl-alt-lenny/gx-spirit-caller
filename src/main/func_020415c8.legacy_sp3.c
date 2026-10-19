extern char data_020fe8ec[];
extern char data_020fe8f0[];
extern int func_020aaddc(const char *s);
extern int OS_SNPrintf(signed char *buffer, int bufsz, const signed char *format, ...);
extern int func_020438b8(const void *src, unsigned int len, char *dst, unsigned int size);
typedef struct {
    char *data;
    char *cur;
    char *end;
    int size;
} Buffer;
extern int func_020413b0(char *self, Buffer *buf, int extra);
int func_020415c8(char *self, const char *s, const void *src, unsigned int size) {
    int len;
    Buffer *buf;
    const char *format;
    int needed;
    int room;
    int n;
    buf = (Buffer *)(self + 0x19f4);
    format = *(int *)(self + 0x19f0) == 0 ? data_020fe8ec : data_020fe8f0;
    ++*(int *)(self + 0x19f0);
    len = func_020438b8(src, size, 0, 0);
    needed = func_020aaddc(format) - 2 + func_020aaddc(s) + len;
    room = buf->end - buf->cur;
    if (needed > room) {
        if (func_020413b0(self, buf, needed - room + 1) == 0) {
            return 1;
        }
        room = buf->end - buf->cur;
    }
    n = OS_SNPrintf((signed char *)buf->cur, room, (const signed char *)format, s);
    buf->cur += n;
    if (func_020438b8(src, size, buf->cur, buf->end - buf->cur - 1) < 0) {
        return 1;
    }
    buf->cur += len;
    *buf->cur = 0;
    return 0;
}


