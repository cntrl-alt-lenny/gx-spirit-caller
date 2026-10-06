extern char data_020fe8b0[];
extern char data_020fe8c0[];
extern void func_02094688(const void *src, void *dst, int n);

typedef void *(*AllocFn)(const char *label, int size);
typedef void (*FreeFn)(const char *label, void *p, int line);

typedef struct {
    char *data;
    char *cur;
    char *end;
    int size;
} Buffer;

int func_020413b0(char *self, Buffer *buf, int extra) {
    FreeFn free_fn = *(FreeFn *)(self + 0x1014);
    AllocFn alloc_fn = *(AllocFn *)(self + 0x1010);
    char *p;
    if (extra <= 0) {
        return 0;
    }
    p = alloc_fn(data_020fe8b0, buf->size + extra);
    if (p == 0) {
        return 0;
    }
    func_02094688(buf->data, p, buf->size);
    free_fn(data_020fe8c0, buf->data, 0);
    if (p == 0) {
        return 0;
    }
    buf->cur = buf->cur + (p - buf->data);
    buf->size = buf->size + extra;
    buf->data = p;
    buf->end = p + buf->size;
    return 1;
}
