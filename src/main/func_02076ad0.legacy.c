/* func_02076ad0: parse a type-3 option record into the connection state:
 * copy the 32-byte name, then (when the length byte is 0x20) a second
 * 32-byte name, and pick the matching entry for the trailing list. */
typedef struct {
    unsigned char _pad_00[0x30];
    unsigned char f30;
    unsigned char _pad_31;
    unsigned short f32;
    unsigned char _pad_34[0x455 - 0x34];
    unsigned char f455;
} Ctx;
extern int func_02076c4c(int a, int b);
extern void func_02094688(void *src, void *dst, int n);
extern void func_02077db0(Ctx *c);
extern int func_02076c5c(void *p, int n, int m);

void func_02076ad0(Ctx *c, unsigned char *p) {
    unsigned char *q;
    unsigned char *e;
    int n;
    unsigned short r;

    if (func_02076c4c(p[0], p[1]) == 0) {
        return;
    }
    func_02094688(p + 2, (char *)c + 0x34, 0x20);
    n = p[0x22];
    q = p + 0x23;
    if (n != 0x20) {
        c->f30 = 0;
    } else {
        func_02094688(q, (char *)c + 0x74, 0x20);
        func_02077db0(c);
    }
    e = q + n;
    {
        int hi = q[n];
        int lo = e[1];
        r = func_02076c5c(e + 2, ((hi << 8) + lo) / 2, 2);
    }
    c->f32 = r;
    if (r != 0) {
        c->f455 = 1;
    }
}
