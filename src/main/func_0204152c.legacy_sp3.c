extern char data_020fe8e8[];
extern int func_020aaddc(const char *s);
extern int OS_SNPrintf(signed char *buffer, int bufsz, const signed char *format, ...);

typedef struct {
    char *data;
    char *cur;
    char *end;
    int size;
} Buffer;

extern int func_020413b0(char *self, Buffer *buf, int extra);

int func_0204152c(char *self, const char *s) {
    int len;
    int room;
    int n;
    Buffer *buf;
    buf = (Buffer *)(self + 0x19f4);
    len = func_020aaddc(s);
    room = buf->end - buf->cur;
    if (len > room) {
        if (func_020413b0(self, buf, len - room + 1) == 0) {
            return 1;
        }
        room = buf->end - buf->cur;
    }
    n = OS_SNPrintf((signed char *)buf->cur, room, (const signed char *)data_020fe8e8, s);
    if (n != len) {
        return 1;
    }
    buf->cur += n;
    return 0;
}
