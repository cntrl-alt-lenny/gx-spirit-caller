typedef struct {
    char          _0[0x54];
    signed char   name[0x20];
    signed char   key[8];
    char          _7c[0x440];
    unsigned char sbox[0x100];
} obj_0206a984_t;

extern int func_020aaddc(const char *s);
extern long long func_020b3870(int a, int b);
extern void func_02067984(unsigned char *sbox, unsigned char *key, unsigned int keylen);

void func_0206a984(obj_0206a984_t *o, signed char *in, int len) {
    signed char t;
    int i;
    int n = func_020aaddc((const char *)o->name);
    signed char *name = o->name;
    int c;

    for (i = 0; i < len; i++) {
        c = name[(int)(func_020b3870(i, n) >> 32)];
        t = o->key[i % 8] ^ in[i];
        o->key[(i * c) % 8] ^= t;
    }
    func_02067984(o->sbox, (unsigned char *)o->key, 8);
}
