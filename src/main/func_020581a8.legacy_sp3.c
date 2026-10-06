typedef struct {
    char *data;
    int cap;
    int len;
} StrBuf;

extern int func_020453cc(int x, int y);
extern int func_0205ffc0(int *p, int b);
extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern char data_021000b8[];
extern char data_021000d0[];
extern char data_02100154[];

int func_020581a8(void *ctx, StrBuf *b, char c) {
    int len;
    int cap;
    char *data;

    if (b == 0) {
        func_020a6d54(data_021000b8, data_021000d0, 0, 0x25);
    }
    len = b->len;
    cap = b->cap;
    data = b->data;
    if (cap == len) {
        cap += 0x800;
        data = (char *)func_020453cc((int)data, cap + 1);
        if (data == 0) {
            func_0205ffc0((int *)ctx, (int)data_02100154);
            return 1;
        }
    }
    data[len] = c;
    data[len + 1] = 0;
    b->len++;
    b->cap = cap;
    b->data = data;
    return 0;
}
