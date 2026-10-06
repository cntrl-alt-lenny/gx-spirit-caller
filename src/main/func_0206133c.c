typedef struct {
    char *data;
    int   _4;
    int   len;
} buf_0206133c_t;

extern char data_02101430[];
extern char data_02101448[];
extern char data_02101454[];
extern void func_020a6d54(const char *msg, const char *file, int a, int line);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);

void func_0206133c(buf_0206133c_t *b, int off, int n) {
    signed char *p;

    if (off == -1) {
        off = b->len - n;
    }
    if (off > b->len) {
        func_020a6d54(data_02101430, data_02101448, 0, 0x4f);
    }
    if (n > b->len - off) {
        func_020a6d54(data_02101454, data_02101448, 0, 0x50);
    }
    p = (signed char *)b->data + off;
    func_020a7388(p, p + n, b->len - off - n);
    b->len -= n;
}
