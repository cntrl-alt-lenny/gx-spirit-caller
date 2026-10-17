/* func_02070430: drain the pending-bytes buffer of the connection held by
 * data_021a63d0: send through func_020704e8, then slide any unsent tail down. */
typedef struct {
    unsigned char _pad_00[0x5c];
    unsigned char *buf;
    unsigned int len;
} Conn;
typedef struct { char pad[0xa4]; Conn *f_a4; } Mid;
typedef struct { char pad[4]; Mid *ptr_4; } Root;
extern Root data_021a63d0;
extern unsigned int func_020704e8(int a, unsigned int b, int c, int d);
extern void func_020a7388(void *dst, void *src, int n);

unsigned int func_02070430(int a, int b) {
    Conn *c = data_021a63d0.ptr_4->f_a4;
    unsigned int sent;
    unsigned int len;

    if (c != 0) {
        if (c->len != 0) {
            sent = func_020704e8((int)c->buf, c->len, a, b);
            len = c->len;
            if (sent >= len) {
                c->len = 0;
                return sent - len;
            }
            func_020a7388(c->buf, c->buf + sent, len - sent);
            c->len = c->len - sent;
            return 0;
        }
        return func_020704e8(a, b, 0, 0);
    }
    return 0;
}
