typedef struct {
    char *data;
    int cap;
    int len;
} StrBuf;

extern int func_020453cc(int x, int y);
extern int func_0205ffc0(void *p, char *msg);
extern void func_020a6d54(const char *expr, const char *file, const char *func, int line);
extern void *func_020a7368(void *dst, signed char *src, int count);
extern char data_02100240[];
extern char data_021000d0[];
extern char data_02100250[];
extern char data_021000b8[];
extern char data_02100154[];

int func_020580a0(int *ctx, StrBuf *b, signed char *src, int count) {
    int len;
    int cap;
    char *data;
    if (src == 0) {
        func_020a6d54(data_02100240, data_021000d0, 0, 0x51);
    }
    if (count < 0) {
        func_020a6d54(data_02100250, data_021000d0, 0, 0x52);
    }
    if (b == 0) {
        func_020a6d54(data_021000b8, data_021000d0, 0, 0x53);
    }
    if (src == 0) {
        return 0;
    }
    len = b->len;
    cap = b->cap;
    data = b->data;
    if (cap - len < count) {
        cap += count < 0x800 ? 0x800 : count;
        data = (char *)func_020453cc((int)data, cap + 1);
        if (data == 0) {
            func_0205ffc0(ctx, data_02100154);
            return 1;
        }
    }
    func_020a7368(data + len, src, count);
    data[len + count] = 0;
    b->len += count;
    b->cap = cap;
    b->data = data;
    return 0;
}
