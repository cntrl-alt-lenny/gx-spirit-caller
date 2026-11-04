struct Buffer { int data, size, used; };
struct State { int pad[2]; int sock; int pad2[7]; struct Buffer buf; void *obj; };
extern char data_02100b54[], data_02100b64[], data_02100b70[];
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_020aaddc(const char *s);
extern int func_020a978c(char *out, const char *format, ...);
/* This caller consumes r0 from helpers whose existing definitions say void. */
extern int func_02057d2c(int a, int b, int c);
extern int func_02054b9c(int *out);
extern int func_02057d5c(void *ctx, struct State *s, int data, int size);
/* The original passes three arguments; the current definition takes four. */
extern int func_02057e60();

int func_0205c258(void *ctx, struct State *s, const char *data, int size) {
    char buf[32];
    int result;
    if (s == 0) func_020a6d54((int)data_02100b54, (int)data_02100b64, 0, 0x389);
    if (data == 0) data = data_02100b70;
    if (size == -1) size = func_020aaddc(data);
    func_020a978c(buf, data_02100b70 + 4, size);
    result = func_02057d2c((int)ctx, (int)s, (int)buf);
    if (result != 0) return result;
    result = func_02057d5c(ctx, s, (int)data, size);
    if (result != 0) return result;
    result = func_02057e60(ctx, s, 0);
    if (result != 0) return result;
    s->pad2[1] = func_02054b9c(0) + 0x12c;
    return 0;
}

