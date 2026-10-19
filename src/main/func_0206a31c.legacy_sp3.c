typedef struct {
    int f0;
    unsigned short f4;
    char _6[2];
    int f8;
    unsigned short fc;
    char _e[2];
    int f10;
    unsigned char f14, f15;
    char _16[2];
    void *table;
    int f1c, f20;
} rec_020684c8_t;
typedef struct {
    char pad0[4];
    int field_4;
    char pad1[0x480];
    void (*callback)(void *, int, int, int);
    char pad2[8];
    int field_494;
} T_0206b7d8;
extern int func_0206a958(int a0);
extern int func_0206a7b0(T_0206b7d8 *, unsigned char *, int);
extern int func_0206a8c0(signed char *s, int n);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern void func_0206a724(T_0206b7d8 *, unsigned char *, int, int *, unsigned short *);
extern rec_020684c8_t *func_020684c8(int unused, int a, unsigned short b);
extern int func_02068480(int arg);
extern int func_0206a44c(T_0206b7d8 *, rec_020684c8_t *, unsigned char *, int, int);
extern void func_0206b7d8(T_0206b7d8 *p, int a1);
extern unsigned char data_02101dcc[];
int func_0206a31c(T_0206b7d8 *ctx, unsigned char *s, int n) {
    int size, flags;
    int value;
    unsigned short kind;
    rec_020684c8_t *rec;
    int result;
    if (n < 1) return 0;
    flags = *s;
    size = func_0206a958(flags);
    if (n < size) return 0;
    if (flags & 0x40) {
        if (func_0206a7b0(ctx, s + size, n - size) == 0) return 0;
    }
    if (flags & 0x80) {
        if (func_0206a8c0((signed char *)(s + size), n - size) == 0) return 0;
    }
    if (func_020a7440(s + 1, data_02101dcc, 4) == 0) return -1;
    func_0206a724(ctx, s, n, &value, &kind);
    rec = func_020684c8((int)ctx, value, kind);
    if (func_02068480((int)rec) != 0) return -2;
    result = func_0206a44c(ctx, rec, s, n, 1);
    func_0206b7d8(ctx, (int)rec);
    return result;
}

