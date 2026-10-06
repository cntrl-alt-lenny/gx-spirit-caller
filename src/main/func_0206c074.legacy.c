typedef struct {
    char   _0[0x18];
    void *(*alloc)(int size);
} vt_0206c074_t;

extern vt_0206c074_t *data_0219ecd8;
extern char data_0219ed20[];
extern void *data_0219ed1c;
extern void func_02092614(void *p, int a1, int a2);
extern void func_0206bf60(int a0);

int func_0206c074(int n) {
    int body = (n * 0x2c + 3) & ~3;
    int hdr = (n * 4 + 3) & ~3;
    char *mem;
    char *p;

    mem = data_0219ecd8->alloc(body + hdr);
    if (mem == 0) {
        return -1;
    }
    func_02092614(data_0219ed20, (int)mem, n);
    for (p = mem + hdr; n > 0; n--, p += 0x2c) {
        func_0206bf60((int)p);
    }
    data_0219ed1c = mem;
    return 0;
}
