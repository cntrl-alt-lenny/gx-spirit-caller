extern int func_ov002_021de134(void *self, unsigned int mask, int k, int z);

typedef struct {
    unsigned short a;
    unsigned short b0 : 1;
    unsigned short rest : 15;
    unsigned int w[5];
} Req;

int func_ov002_021dec2c(int p, int slot, int q, unsigned short v) {
    Req r = {0};
    unsigned int mask = 1 << (slot + p * 16);
    r.a = v;
    r.b0 = p ^ q;
    return (func_ov002_021de134(&r, mask, 14, 0) & mask) != 0;
}
