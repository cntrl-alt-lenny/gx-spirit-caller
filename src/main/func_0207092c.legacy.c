/* func_0207092c: forward (a0, conn) to the handler matching conn->f9. */
typedef struct {
    unsigned char _pad_00[9];
    unsigned char f9;
} Conn;
typedef struct { char pad[0xa4]; Conn *f_a4; } Mid;
typedef struct { char pad[4]; Mid *ptr_4; } Root;
extern Root data_021a63d0;
extern void func_02074b38(int a, Conn *c);
extern void func_02070980(int a, Conn *c);

void func_0207092c(int a) {
    Conn *c = data_021a63d0.ptr_4->f_a4;
    if (c == 0) {
        return;
    }
    if (c->f9 != 0) {
        func_02074b38(a, c);
    } else {
        func_02070980(a, c);
    }
}
