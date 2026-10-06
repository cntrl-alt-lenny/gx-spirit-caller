typedef struct {
    char data[0x800];
    int  len;
} sbuf_02067294_t;

extern void *func_020a7368(void *dst, signed char *src, int count);
extern int func_020aaddc(const char *s);

void func_02067294(sbuf_02067294_t *b, char *s) {
    int n = func_020aaddc(s) + 1;

    if (n > 0x800 - b->len) {
        n = 0x800 - b->len;
    }
    if (n == 0) {
        return;
    }
    func_020a7368(b->data + b->len, (signed char *)s, n);
    b->len += n;
    b->data[b->len - 1] = 0;
}
