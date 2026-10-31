extern int func_02054140(void *p);
extern int func_02057f3c(void *ctx, int sock, int a2, int a3, int *done, int *result, char *name);
extern int func_020580a0(void *ctx, void *buf, int data, int size);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_021001cc[], data_021000d0[], data_021001f0[];
struct Buffer { int data, size, used; };
struct State { int pad[2]; int sock; int pad2[7]; struct Buffer buf; void *obj; };
int func_02057d5c(void *ctx, struct State *s, int data, int size) {
    int total, result, done, count;
    if (!s->buf.data) func_020a6d54((int)data_021001cc, (int)data_021000d0, 0, 0xfb);
    total = 0;
    if (size == 0) return 0;
    if (s->buf.used - (int)s->obj == 0 && func_02054140(*(void **)((char *)s + 0x38)) == 0) {
        do {
            result = func_02057f3c(ctx, s->sock, data + total, size, &done, &count, data_021001f0);
            if (result != 0) return result;
            if (count != 0) { total += count; size -= count; }
        } while (count != 0 && size != 0);
    }
    if (size != 0) {
        result = func_020580a0(ctx, &s->buf, data + total, size);
        if (result != 0) return result;
    }
    return 0;
}
