extern char data_02100b54[], data_02100b64[], data_02100b70[];
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_020aaddc(const char *s);
extern int func_020a978c(char *out, const char *fmt, ...);
/* The original consumes r0 from these wrappers despite their void C definitions. */
extern int func_02057d2c(int a, int b, int c);
extern int func_02054b9c(int *out);
extern int func_02057d5c(int a, int b, int c, int len);
/* This caller passes three arguments, fewer than the four-argument C definition. */
extern int func_02057e60();
typedef struct { char pad[0x10]; int timer; } Node;
int func_0205c258(void *ctx, Node *node, const char *s, int len) {
    char buf[32];
    int result;
    if (node == 0) func_020a6d54((int)data_02100b54, (int)data_02100b64, 0, 0x389);
    if (s == 0) s = data_02100b70;
    if (len == -1) len = func_020aaddc(s);
    func_020a978c(buf, data_02100b70 + 4, len);
    result = func_02057d2c((int)ctx, (int)node, (int)buf);
    if (result != 0) return result;
    result = func_02057d5c((int)ctx, (int)node, (int)s, len);
    if (result != 0) return result;
    result = func_02057e60(ctx, node, 0);
    if (result != 0) return result;
    node->timer = func_02054b9c(0) + 0x12c;
    return 0;
}
