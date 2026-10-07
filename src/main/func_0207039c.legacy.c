/* func_0207039c: status of the connection held by data_021a63d0. */
typedef struct {
    unsigned char _pad_00[8];
    unsigned char f8;
    unsigned char f9;
    unsigned char _pad_0a[0x44 - 0xa];
    int f44;
} Conn;
typedef struct { char pad[0xa4]; Conn *f_a4; } Mid;
typedef struct { char pad[4]; Mid *ptr_4; } Root;
extern Root data_021a63d0;
extern int func_02074938(Conn *c);

int func_0207039c(void) {
    Conn *c = data_021a63d0.ptr_4->f_a4;
    int r;
    if (c != 0) {
        if (c->f9 != 0) {
            return func_02074938(c);
        }
        r = c->f44;
        if (r != 0 || c->f8 == 4 || (unsigned char)(c->f8 + 246) <= 1) {
            return r;
        }
        return -1;
    }
    return 0;
}
