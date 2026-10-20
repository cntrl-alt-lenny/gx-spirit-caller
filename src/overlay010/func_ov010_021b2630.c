typedef struct { short left, top, right, bottom; } Rect;
typedef struct {
    int unk0, scroll;
    char pad08[0x10];
    int active;
    char pad1c[0x18];
    Rect rect[5];
    char pad5c[0x14];
    unsigned dirty:1;
    unsigned disabled:1;
    unsigned rest:30;
    char pad74[0x18];
    int hit[6];
} State;
extern int func_0207ec28(void *arg);
extern int func_ov005_021aa4d0(void *arg);
extern unsigned int func_02006194(void);
extern void func_02006110(int *out_a, int *out_b);
extern int func_ov010_021b2280(void *arg0, int index, int cell, char **dst, int *remaining);
int func_ov010_021b2630(State *p, void *arg1, char **dst) {
    int remaining;
    int x, y;
    int total;
    int i;
    Rect *r;
    remaining = func_0207ec28(arg1);
    total = 0;
    if (!p->disabled) func_ov005_021aa4d0(p);
    if (p->active) p->dirty = 1;
    if (func_02006194()) {
        r = p->rect;
        func_02006110(&x, &y);
        for (i = 0; i < 5; i++, r++) {
            if (x >= r->left && x <= r->right && y >= r->top && y <= r->bottom)
                p->hit[i] = 1;
            else p->hit[i] = 0;
        }
        {
            int top = p->rect[0].top + p->scroll;
            if (x >= p->rect[0].left && x <= p->rect[0].right && y >= top && y <= top + 0x15)
                p->hit[5] = 1;
            else p->hit[5] = 0;
        }
    } else {
        for (i = 0; i < 6; i++) p->hit[i] = 0;
    }
    total += func_ov010_021b2280(p, 1, 0, dst, &remaining);
    total += func_ov010_021b2280(p, 2, 2, dst, &remaining);
    total += func_ov010_021b2280(p, 5, 4, dst, &remaining);
    return total;
}

