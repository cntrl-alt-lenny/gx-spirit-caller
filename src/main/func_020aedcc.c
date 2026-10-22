typedef struct {
    unsigned short *data;
    unsigned int size;
    unsigned int pos;
} Buffer;

extern int func_020aed64(Buffer *buf, int src, unsigned int count);
extern int func_020ae474(int (*write)(Buffer *, int, unsigned int), Buffer *buf, const unsigned short *format, void *args);

int func_020aedcc(unsigned short *data, unsigned int size, const unsigned short *format, void *args) {
    Buffer buf;
    int result;
    buf.data = data;
    buf.size = size;
    buf.pos = 0;
    result = func_020ae474(func_020aed64, &buf, format, args);
    if (result < 0)
        return result;
    if ((unsigned int)result < size) {
        data[result] = 0;
        return result;
    }
    (data + size)[-1] = 0;
    return -1;
}

