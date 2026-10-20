typedef struct { char *data; int cap; int len; int fC; int kind; int offset; } StrBuf;
typedef struct { char pad[0x10]; int timer; char pad14[0x24]; struct Self0205407c *list; } Node;
typedef struct Self0205407c { int count; } Self0205407c;
extern char data_02100b54[], data_02100b64[], data_02100ba4[], data_02100bb4[], data_02100bb8[], data_02100bc0[];
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_020aaddc(const char *s);
/* This caller consumes r0 from both wrappers; func_02058038 also forwards a third formatting argument. */
extern int func_02058070(void *a, void *b, const char *c);
extern int func_02058038(void *a0, void *a1, int value);
extern int func_020580a0(void *ctx, StrBuf *buf, const char *s, int len);
extern int func_020581a8(void *ctx, StrBuf *b, char c);
extern void func_0205407c(Self0205407c *self, void *val);
/* The original consumes the timer left in r0 even when out is null. */
extern int func_02054b9c(int *out);
int func_0205c3c0(void *ctx, Node *node, int kind, const char *s) {
    int len;

    int result;
    if (node == 0) func_020a6d54((int)data_02100b54, (int)data_02100b64, 0, 0x340);
    if (s == 0) func_020a6d54((int)data_02100ba4, (int)data_02100b64, 0, 0x341);
    len = func_020aaddc(s);
    StrBuf buf = {0};
    buf.kind = kind;
    result = func_02058070(ctx, &buf, data_02100bb4);
    if (result != 0) return result;
    result = func_02058038(ctx, &buf, kind);
    if (result != 0) return result;
    result = func_02058070(ctx, &buf, data_02100bb8);
    if (result != 0) return result;
    result = func_02058038(ctx, &buf, len);
    if (result != 0) return result;
    result = func_02058070(ctx, &buf, data_02100bc0);
    if (result != 0) return result;
    buf.offset = buf.len;
    result = func_020580a0(ctx, &buf, s, len);
    if (result != 0) return result;
    result = func_020581a8(ctx, &buf, 0);
    if (result != 0) return result;
    func_0205407c(node->list, &buf);
    node->timer = func_02054b9c(0) + 0x12c;
    return 0;
}


