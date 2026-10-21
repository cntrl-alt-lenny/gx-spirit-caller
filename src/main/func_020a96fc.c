typedef struct { unsigned char *data; unsigned int limit; int cursor; } Buffer;
extern int func_020a95a0(Buffer *p, const void *src, int size);
extern int func_020a8d50(int (*callback)(Buffer *, const void *, int), Buffer *, const char *, char *);

int func_020a96fc(unsigned char *dst, unsigned int limit, const char *fmt, char *ap) {
    Buffer buffer;
    int result;
    buffer.data = dst;
    buffer.limit = limit;
    buffer.cursor = 0;
    result = func_020a8d50(func_020a95a0, &buffer, fmt, ap);
    if (dst == 0) return result;
    if ((unsigned int)result < limit) {
        dst[result] = 0;
        return result;
    }
    if (limit != 0) (dst + limit)[-1] = 0;
    return result;
}

