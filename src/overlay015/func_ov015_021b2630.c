typedef struct { short left, top, right, bottom; } Rect;
typedef struct {
    int field0, offset;
    char pad8[0x10];
    int active;
    char pad1c[0x18];
    Rect rects[5];
    char pad5c[0x14];
    unsigned int flag0:1;
    unsigned int flag1:1;
    unsigned int other:30;
    int cells[6];
    int hit[6];
} Widget;
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_02006194(void);
extern unsigned short func_0207ec28(void *);
extern int func_ov005_021aa4d0(Widget *);
extern int func_ov015_021b2280(Widget *, int, int, char **, int *);
int func_ov015_021b2630(Widget *self, void *rng, char **dst)
{
    int remaining = func_0207ec28(rng);
    int x, y;
    int ret = 0;
    int i;
    Rect *rect;
    if (!self->flag1) func_ov005_021aa4d0(self);
    if (self->active) self->flag0 = 1;
    if (func_02006194()) {
        rect = self->rects;
        func_02006110(&x, &y);
        for (i = ret; i < 5; i++, rect++) {
            if (x >= rect->left && x <= rect->right && y >= rect->top && y <= rect->bottom)
                self->hit[i] = 1;
            else self->hit[i] = 0;
        }
        {
            int top = self->rects[0].top + self->offset;
            if (x >= self->rects[0].left && x <= self->rects[0].right && y >= top && y <= top + 0x15)
                self->hit[5] = 1;
            else self->hit[5] = 0;
        }
    } else {
        for (i = 0; i < 6; i++) self->hit[i] = 0;
    }
    ret += func_ov015_021b2280(self, 1, 0, dst, &remaining);
    ret += func_ov015_021b2280(self, 2, 2, dst, &remaining);
    ret += func_ov015_021b2280(self, 5, 4, dst, &remaining);
    return ret;
}

