/* func_ov002_021fb138: 021ca2b8 predicate keyed on bit14 ^ bit0 — require
 * 021ff2b8(self, key) >= 2, then report 021ca2b8(key) nonzero. */

struct Func021fb138F2 {
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short rest : 1;
};

struct Func021fb138Self {
    unsigned short pad0;
    struct Func021fb138F2 f2;
};

extern int func_ov002_021ff2b8(struct Func021fb138Self *self, int key);
extern int func_ov002_021ca2b8(unsigned int key);

int func_ov002_021fb138(struct Func021fb138Self *self) {
    int key = self->f2.bit0 ^ self->f2.bit14;
    if (func_ov002_021ff2b8(self, key) < 2)
        return -1;
    if (func_ov002_021ca2b8(key) != 0)
        return 1;
    return -1;
}
