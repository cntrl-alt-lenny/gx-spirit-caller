typedef unsigned int u32;
typedef unsigned char u8;
typedef struct { u8 pad[12]; void *ctx; } Conn;
extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern void func_02094688(const void *src, void *dst, int n);
extern u32 func_02075df4(void *ctx, u8 *buf);
extern u32 func_020705d4(void *buf, u32 len, int a, int b, Conn *conn);
int func_020747e0(u8 *a, u32 n, u8 *b, int m, Conn *conn) {
    void *ctx = conn->ctx;
    int total = 0;
    u8 *buf;
    int remaining = n + m;
    int chunk;
    do {
        if (remaining > 0xb4f) chunk = 0xb4f;
        else chunk = remaining;
        buf = data_0219eee0(chunk + 0x19);
        u32 first;
        int second;
        u32 len;
        if (!buf) break;
        first = n >= (u32)chunk ? (u32)chunk : n;
        second = chunk - first;
        func_02094688(a, buf + 5, first);
        a += first;
        n -= first;
        func_02094688(b, buf + 5 + first, second);
        b += second;
        buf[0] = 0x17;
        buf[1] = 3;
        buf[2] = 0;
        buf[3] = chunk >> 8;
        buf[4] = chunk;
        len = func_02075df4(ctx, buf);
        if (func_020705d4(buf, len, 0, 0, conn) < len) chunk = 0;
        data_0219ef0c(buf);
        total += chunk;
        remaining -= chunk;
        if (remaining == 0) break;
    } while (chunk != 0);
    return total;
}









