extern int func_020ace88(int a, int b, int c);

typedef struct {
    unsigned short *data;
    unsigned int size;
    unsigned int pos;
} Buffer;

int func_020aed64(Buffer *buf, int src, unsigned int count) {
    int result;
    if (buf->pos + count > buf->size)
        count = buf->size - buf->pos;
    result = func_020ace88((int)(buf->data + buf->pos), src, count);
    buf->pos += count;
    return result;
}
