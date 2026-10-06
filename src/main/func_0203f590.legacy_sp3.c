typedef struct {
    unsigned char order[0x18];
} perm_0203f590_t;

extern perm_0203f590_t data_020bed04;
extern signed char *data_020fe4e8;
extern signed char *data_020fe4dc;
extern void func_0203f198(void *in, unsigned char *out, int a, int b);

void func_0203f590(void *in, unsigned char *out) {
    perm_0203f590_t perm = data_020bed04;
    unsigned char from;
    unsigned char cur;
    unsigned char next;
    unsigned char val;
    unsigned char tmp;
    int i;

    func_0203f198(in, out, 0x20, 0x18);
    for (i = 0; i < 0x18; i++) {
        out[i] ^= data_020fe4e8[i];
    }
    for (i = 0; i < 0x18; i++) {
        from = i;
        cur = from;
        val = out[i];
        while (perm.order[from] != 0xff) {
            next = perm.order[cur];
            tmp = out[next];
            out[perm.order[from]] = val;
            perm.order[cur] = 0xff;
            from = next;
            cur = next;
            val = tmp;
        }
    }
    for (i = 0; i < 0x18; i++) {
        out[i] ^= data_020fe4dc[i];
    }
}
