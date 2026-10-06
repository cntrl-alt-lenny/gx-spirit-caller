typedef struct {
    short          current;
    short          target;
    short          step_incr;
    unsigned short frames_left;
} anim_linear_short_t;

typedef struct {
    unsigned short      active;
    unsigned short      f2;
    anim_linear_short_t ch[0x10];
} group_02038810_t;

typedef struct {
    char           _0[0x4];
    void          *handle;
    char           _8[0x2c];
    unsigned int   id;
    char           _38[0x30];
    unsigned short flags;
    signed char    slot;
} ent_02038810_t;

extern group_02038810_t data_0219b550[];
extern ent_02038810_t *func_02037b58(int id);
extern int func_0203874c(anim_linear_short_t *obj, int target, unsigned short frames);
extern void func_02087df4(void *p, int a1, int a2);

int func_02038810(int id, unsigned int mask, int target, unsigned short frames) {
    ent_02038810_t *e;
    group_02038810_t *g;
    int m;
    anim_linear_short_t *a;

    e = func_02037b58(id);

    if (e == 0 || e->slot >= 4 || ((e->id >> 20) & 0xf) != 1) {
        return 0;
    }
    g = &data_0219b550[e->slot];
    if (mask < 0x10000) {
        mask = 1 << mask;
    }
    mask = (unsigned short)mask;
    g->active |= mask;
    m = mask;
    if (m != 0) {
        a = g->ch;
        do {
            if (m & 1) {
                func_0203874c(a, target, frames);
            }
            m >>= 1;
            a++;
        } while (m != 0);
    }
    if (!(e->flags & 0x6000) && frames == 0) {
        func_02087df4(&e->handle, (unsigned short)mask, target);
        g->active &= ~mask;
    }
    return 1;
}
