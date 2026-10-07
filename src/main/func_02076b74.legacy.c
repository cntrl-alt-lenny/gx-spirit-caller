/* func_02076b74: parse a type-3 variant record: pick the matching entry from
 * the leading list, then copy (zero-padding when short) the trailing name. */
typedef struct {
    unsigned char _pad_00[0x30];
    unsigned char f30;
    unsigned char _pad_31;
    unsigned short f32;
    unsigned char _pad_34[0x455 - 0x34];
    unsigned char f455;
} Ctx;
extern int func_02076c4c(int a, int b);
extern int func_02076c5c(void *p, int n, int m);
extern void func_02094688(void *src, void *dst, int n);
extern void func_020945f4(void *dst, int val, int n);

void func_02076b74(Ctx *c, unsigned char *p) {
    int len;
    int hi;
    int lo;
    int a;
    int nlen;
    unsigned short r;
    unsigned char *name;

    if (func_02076c4c(p[0], p[1]) == 0) {
        return;
    }
    hi = p[2];
    lo = p[3];
    len = (hi << 8) + lo;
    r = func_02076c5c(p + 8, len / 3, 3);
    if (r == 0) {
        return;
    }
    c->f32 = r;
    hi = p[4];
    lo = p[5];
    a = (hi << 8) + lo;
    hi = p[6];
    lo = p[7];
    nlen = (hi << 8) + lo;
    name = p + (len + 8 + a);
    c->f30 = 0;
    if (nlen >= 0x20) {
        func_02094688(name, (char *)c + 0x34, 0x20);
    } else {
        func_020945f4((char *)c + 0x34, 0, 0x20 - nlen);
        func_02094688(name, (char *)c + 0x54 - nlen, nlen);
    }
    c->f455 = 1;
}
