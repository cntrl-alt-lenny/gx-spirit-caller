extern int func_02057f3c(void *ctx, int sock, int a2, int a3, int *done, int *result, char *name);
extern void func_020a6d54(int a, int b, int c, int d);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);
extern char data_021000b8[], data_021000d0[], data_021000dc[], data_021000e8[], data_021000f4[];
struct Buffer { signed char *data; int unk4; int size; int used; };
int func_02057980(void *ctx, int sock, struct Buffer *buf, int *out, int compact, char *name) {
    int size, total, remaining;
    signed char *data;
    int used;
    int result, done, count;
    if (!buf) func_020a6d54((int)data_021000b8, (int)data_021000d0, 0, 0x1b9);
    total = 0;
    size = buf->size;
    used = buf->used;
    data = buf->data;
    remaining = size - used;
    if (remaining == 0) return 0;
    do {
        result = func_02057f3c(ctx, sock, (int)(data + (used + total)), remaining, &done, &count, name);
        if (result != 0) return result;
        if (count != 0) { total += count; remaining -= count; }
    } while (count != 0 && remaining != 0);
    if (compact) {
        if (total > 0) {
            func_020a7388(data, data + total, remaining + 1);
            size -= total;
        }
    } else { used += total; }
    if (size < 0) func_020a6d54((int)data_021000dc, (int)data_021000d0, 0, 0x1de);
    if (used < 0) func_020a6d54((int)data_021000e8, (int)data_021000d0, 0, 0x1df);
    if (used > size) func_020a6d54((int)data_021000f4, (int)data_021000d0, 0, 0x1e0);
    buf->size = size;
    buf->used = used;
    if (out) *out = done;
    return 0;
}


