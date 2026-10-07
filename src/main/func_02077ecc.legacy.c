/* func_02077ecc: feed len bytes to a 64-byte block hash (MD5-style update):
 * bump the bit count, top up the pending block, run whole blocks, keep the rest. */
typedef struct {
    unsigned char _pad_00[0x10];
    unsigned int count_lo;
    unsigned int count_hi;
    unsigned char buf[64];
} Ctx;
extern void func_02094688(void *src, void *dst, int n);
extern void func_02077fd8(Ctx *c, void *block);

void func_02077ecc(Ctx *c, unsigned char *data, unsigned int len) {
    unsigned int i;
    unsigned int part;
    unsigned int index;
    unsigned int old;

    old = c->count_lo;
    c->count_lo = old + (len << 3);
    index = (old >> 3) & 0x3f;
    if (c->count_lo < (len << 3)) {
        c->count_hi++;
    }
    part = 64 - index;
    c->count_hi += len >> 29;
    if (len >= part) {
        func_02094688(data, c->buf + index, part);
        index = 0;
        func_02077fd8(c, c->buf);
        for (i = part; i + 63 < len; i += 64) {
            func_02077fd8(c, data + i);
        }
    } else {
        i = 0;
    }
    func_02094688(data + i, c->buf + index, len - i);
}
