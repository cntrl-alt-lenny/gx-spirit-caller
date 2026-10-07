/* func_02070ce0: for a connection in state 4 or 10, report fields 0x18 and
 * 0x14 through the (optional) out pointers and return field 0x1c; else 0. */
typedef struct {
    unsigned char _pad_00[8];
    unsigned char f8;
    unsigned char _pad_09[0x14 - 9];
    int f14;
    unsigned short f18;
    unsigned char _pad_1a[2];
    int f1c;
} Conn;
typedef struct { char pad[0xa4]; Conn *f_a4; } Mid;
typedef struct { char pad[4]; Mid *ptr_4; } Root;
extern Root data_021a63d0;

int func_02070ce0(unsigned short *a, int *b) {
    Conn *c = data_021a63d0.ptr_4->f_a4;
    if (c != 0) {
        if (c->f8 == 4 || c->f8 == 10) {
            if (a != 0) {
                *a = c->f18;
            }
            if (b != 0) {
                *b = c->f14;
            }
            return c->f1c;
        }
    }
    return 0;
}
