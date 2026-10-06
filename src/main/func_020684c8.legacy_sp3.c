typedef struct {
    int            f0;
    unsigned short f4;
    char           _6[0x2];
    int            f8;
    unsigned short fc;
    char           _e[0x2];
    int            f10;
    unsigned char  f14;
    unsigned char  f15;
    char           _16[0x2];
    void          *table;
    int            f1c;
    int            f20;
} rec_020684c8_t;

extern rec_020684c8_t *func_020453e8(int size);
extern void func_020453b4(void *p);
extern void *func_02054700(int a, int b, int c, void *cb1, void *cb2, void *cb3);
extern int func_02068594(int *p);
extern int func_02068580(int *a, int *b);
extern void func_020685a4(void *self);

rec_020684c8_t *func_020684c8(int unused, int a, unsigned short b) {
    rec_020684c8_t *r = func_020453e8(sizeof(rec_020684c8_t));

    if (r == 0) {
        return 0;
    }
    r->table = func_02054700(8, 8, 4, func_02068594, func_02068580, func_020685a4);
    if (r->table == 0) {
        func_020453b4(r);
        return 0;
    }
    r->f14 = 0;
    r->f15 = 0;
    r->f20 = 0;
    r->f1c = 0;
    r->f10 = 0;
    r->f0 = a;
    r->f4 = b;
    r->f8 = 0;
    r->fc = 0;
    return r;
}
