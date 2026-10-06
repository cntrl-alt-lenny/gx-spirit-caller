typedef struct {
    char *data;
    int   cap;
    int   len;
} buf_020613d8_t;

extern char data_02101448[];
extern char data_02101478[];
extern void func_020a6d54(const char *msg, const char *file, int a, int line);
extern void *func_020a7368(void *dst, signed char *src, int count);
extern int func_020aaddc(char *s);

void func_020613d8(buf_020613d8_t *b, signed char *src, int n) {
    if (src == 0) {
        return;
    }
    if (n == 0) {
        return;
    }
    if (n == -1) {
        n = func_020aaddc((char *)src);
    }
    if (b->len + n > b->cap) {
        func_020a6d54(data_02101478, data_02101448, 0, 0x40);
    }
    func_020a7368(b->data + b->len, src, n);
    b->len += n;
}
