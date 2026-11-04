typedef struct {
    void *store;
    char pad4[0x9];
    unsigned char count;
    char pad0e[0x16 - 0xe];
    unsigned char f16;
    char pad17[0xf4 - 0x17];
    int ids[1];
    char pad_f8[0x1a5 - 0xf8];
    unsigned char cur;
    char pad1a6[0x1bc - 0x1a6];
    int f1bc;
    char pad1c0[0x1c8 - 0x1c0];
    int f1c8;
    int f1cc;
    int f1d0;
    char pad1d4[0x2fc - 0x1d4];
    char *table;
    int pad300;
    unsigned char slots[0x40];
    int total;
} Single;
typedef struct {
    int id;
    int type;
    char text[0x100];
    char other[0x100];
    int x;
    int y;
} Entry;
extern Single *func_020498f0(void);
extern int func_02048108(void);
extern int func_02052f04(int context, void *entry);
extern int func_02053164(void *p);
extern int func_02055738(void *a0, int a1, int *out);
extern int func_020557b8(void *a0, int id, Entry *out);
extern int func_02045b1c(char *key, char *out, char *text, int sep);
extern long func_020acca0(char *s, char **end, int base);
extern long long func_020930b0(void);
extern int func_0204d284(int a, int b);
extern char data_020ff9c4[], data_020ff9cc[], data_020ff9d0[];

int func_0204cf7c(int a, int b, int c) {
    int id;
    int start;
    int first;
    int looped;
    int i;
    int r;
    char n3[2];
    char n2[6];
    int idx;
    char n1[12];
    Entry entry;
    long long t;
    Single *s;
    Single *s1;
    Single *s2;
    Single *s3;
    int ctx;
    int k;

    if (b != 0) {
        start = func_020498f0()->cur;
    } else if (func_020498f0()->cur >= func_020498f0()->total - 1) {
        start = 0;
    } else {
        start = func_020498f0()->cur + 1;
    }
    looped = 0;
    first = (b == 0);
    for (;;) {
        if (first != 0 || looped != 0) {
            func_020498f0()->cur++;
            if (func_020498f0()->cur >= func_020498f0()->total) {
                func_020498f0()->cur = 0;
            }
        }
        if (looped != 0 && start == func_020498f0()->cur) {
            func_020498f0()->f1c8 = 0xbb8;
            s = func_020498f0();
            t = func_020930b0();
            s->f1cc = (int)t;
            s->f1d0 = (int)(t >> 32);
            func_020498f0()->f1bc = 0;
            return 0;
        }
        looped = 1;
        ctx = func_02048108();
        s1 = func_020498f0();
        s2 = func_020498f0();
        s3 = func_020498f0();
        id = func_02052f04(ctx, s1->table + s2->slots[s3->cur] * 12);
        if (id == 0 || id == -1) continue;
        if (func_02053164(func_020498f0()->table + func_020498f0()->slots[func_020498f0()->cur] * 12) == 0) continue;
        for (i = 1; i <= func_020498f0()->count; i++) {
            if (id == func_020498f0()->ids[i]) break;
        }
        if (i <= func_020498f0()->count) continue;
        r = func_02055738(func_020498f0()->store, id, &idx);
        if ((r | func_020557b8(func_020498f0()->store, idx, &entry)) != 0) continue;
        if (entry.type != 4) continue;
        i = func_02045b1c(data_020ff9c4 + 4, n1, entry.text, 0x2f);
        r = func_02045b1c(data_020ff9cc, n2, entry.text, 0x2f);
        k = func_02045b1c(data_020ff9d0, n3, entry.text, 0x2f);
        if (i <= 0 || r <= 0 || k <= 0) continue;
        if (func_020acca0(n1, 0, 10) != 3) continue;
        if (func_020acca0(n2, 0, 10) != func_020498f0()->f16) continue;
        if (id == c) a = 1;
        return func_0204d284(id, a);
    }
}
