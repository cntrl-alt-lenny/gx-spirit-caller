typedef unsigned short u16;
typedef struct { u16 a:1; u16 b:5; u16 c:8; u16 d:2; } Bits;
typedef struct { char _pad0[4]; unsigned short f_4; } arg0_0229d2ec_t;
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern void func_ov002_022a6500(char *base, int value, Bits *src, Bits *dst);
extern void func_ov002_0229d2ec(arg0_0229d2ec_t *p);
void func_ov002_022a6860(char *base, int value, Bits *src, Bits *dst) {
    signed char *p = func_ov002_022a6324(base, src->a, src->b, src->c);
    if (p != 0 && *p != 0) {
        func_ov002_022a6500(base, value, src, dst);
        p = func_ov002_022a6324(base, dst->a, dst->b, dst->c);
        if (p != 0) {
            func_ov002_0229d2ec((arg0_0229d2ec_t *)p);
        }
    }
}
