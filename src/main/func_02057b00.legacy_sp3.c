extern int func_020453cc(int x, int y);
/* Original caller supplies the socket although the C callee ignores it. */
extern void *func_02054bfc();
extern int func_02054d4c(int unused0, int unused1, int unused2, int unused3);
extern int func_0205ffc0(int *p, int b);
extern void func_020604a4(int a, ...);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_021000d0[], data_02100100[], data_02100118[], data_0210012c[], data_02100140[], data_02100154[], data_02100164[], data_02100190[], data_021001b4[];
struct Buffer { char *data; int size; int used; };
int func_02057b00(int *ctx, int sock, struct Buffer *buf, int *out, int *done, char *name) {
    char *data;
    int used, size, count, total, ended;
    if (sock == -1) func_020a6d54((int)data_02100100, (int)data_021000d0, 0, 0x150);
    if (!buf) func_020a6d54((int)data_02100118, (int)data_021000d0, 0, 0x151);
    if (!out) func_020a6d54((int)data_0210012c, (int)data_021000d0, 0, 0x152);
    if (!done) func_020a6d54((int)data_02100140, (int)data_021000d0, 0, 0x153);
    data = buf->data;
    used = buf->used;
    size = buf->size;
    total = 0;
    ended = 0;
    do {
        if (used + 0x800 > size) {
            size = used + 0x800;
            data = (char *)func_020453cc((int)data, size + 1);
            if (!data) {
                func_0205ffc0(ctx, (int)data_02100154);
                return 1;
            }
        }
        count = func_02054d4c(sock, (int)(data + used), size - used, 0);
        if (count == -1) {
            int err = (int)func_02054bfc(sock);
            if (err != -6 && err != -26 && err != -76) {
                func_0205ffc0(ctx, (int)data_02100164);
                return 3;
            }
        } else if (count != 0) {
            used += count;
            total += count;
        } else {
            ended = 1;
            func_020604a4((int)ctx, (int)data_02100190, name);
        }
        data[used] = 0;
    } while (count != -1 && !ended && total < 0x20000);
    if (total != 0) func_020604a4((int)ctx, (int)data_021001b4, name, total);
    buf->data = data;
    buf->used = used;
    buf->size = size;
    *out = total;
    *done = ended;
    return 0;
}

