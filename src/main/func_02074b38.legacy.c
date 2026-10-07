/* func_02074b38: consume n bytes of the connection's window, or when n
 * reaches the end, fire the pending callback and clear it. */
typedef struct {
    unsigned char _pad_00[0x824];
    void *cb_arg;
    unsigned int end;
    unsigned int pos;
} Ctx;
typedef struct {
    unsigned char _pad_00[0xc];
    Ctx *ctx;
} Conn;
extern void (*data_0219ef0c)(void *arg);

void func_02074b38(unsigned int n, Conn *c) {
    Ctx *x = c->ctx;
    if (n >= x->end - x->pos) {
        if (x->cb_arg != 0) {
            data_0219ef0c(x->cb_arg);
        }
        x->cb_arg = 0;
    } else {
        x->pos = x->pos + n;
    }
}
