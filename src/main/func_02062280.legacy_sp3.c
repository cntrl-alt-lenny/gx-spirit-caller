typedef struct {
    int            f0;
    unsigned short f4;
    char           _6[0x2];
    int            f8;
    char           _c[0x7c];
    int            f88;
} obj_02062280_t;

extern int func_020645e0(int a0, int a1, int a2, int a3, int a4);
extern int func_02055330(void);

int func_02062280(obj_02062280_t *o, int a, int b) {
    if (func_020645e0(o->f8, o->f0, o->f4, a, b) == 0) {
        return 0;
    }
    o->f88 = func_02055330();
    return 1;
}
