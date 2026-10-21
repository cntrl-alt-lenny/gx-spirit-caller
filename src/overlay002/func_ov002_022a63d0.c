typedef struct { unsigned short a:1, b:5, c:8, d:1, e:1; } bits_t;
typedef struct {
    unsigned char f_0, _p1, f_2, f_3;
    unsigned short _p4, f_6, f_8;
    bits_t f_a;
    int f_c, f_10;
} obj_t;
typedef struct {
    signed char a,b,c,d;
    short e,f,g;
    unsigned short h;
    int i,j;
} entry_t;
typedef struct { entry_t first, second; bits_t flags; short count; } state_t;
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern void func_ov002_0229d184(obj_t *p, int arg1, bits_t *arg2);
extern void func_ov002_0229ed30(state_t *p, entry_t *src, int force);
extern void func_ov002_022a60f4(char *base, int idx, int type, int sub);
void func_ov002_022a63d0(char *base, int value, bits_t *src) {
    state_t *state;
    obj_t *obj;
    int type = src->b;
    int idx = src->a;
    if (type < 12) state = 0;
    else state = (state_t *)(base + 0x280 + idx * 0xb0 + (type - 12) * 0x2c);
    obj = func_ov002_022a6324(base, src->a, src->b, src->c);
    if (obj) func_ov002_0229d184(obj, value, src);
    if (state) func_ov002_0229ed30(state, (entry_t *)obj, 1);
    func_ov002_022a60f4(base, src->a, src->b, src->c);
}
