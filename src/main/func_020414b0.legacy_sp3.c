extern char data_020fe8d4[];

typedef void *(*AllocFn)(const char *label, int size);

typedef struct {
    char *data;
    char *cur;
    char *end;
    int size;
} Buffer;

int func_020414b0(char *self, Buffer *buf, int size) {
    AllocFn alloc_fn = *(AllocFn *)(self + 0x1010);
    if (size == 0) {
        return 0;
    }
    buf->data = alloc_fn(data_020fe8d4, size);
    if (buf->data == 0) {
        return 0;
    }
    buf->cur = buf->data;
    buf->size = size;
    buf->end = buf->data + buf->size;
    return 1;
}
