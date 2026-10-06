typedef struct {
    int            current;
    int            target;
    unsigned short step_incr;
    unsigned short frames_left;
} anim_020380dc_t;

typedef struct {
    char            _0[0x4];
    void           *handle;
    char            _8[0x4];
    anim_020380dc_t anim;
    short           base;
    char            _1a[0x1a];
    unsigned int    id;
    char            _38[0x30];
    unsigned short  flags;
} ent_020380dc_t;

extern ent_020380dc_t *func_02037b58(int id);
extern int func_020386f4(void *obj, int target, int frames);
extern void func_02087dcc(void **pp, int mask, int value);

int func_020380dc(int id, int target, int frames, int relative) {
    ent_020380dc_t *e = func_02037b58(id);

    if (e == 0) {
        return 0;
    }
    if (((e->id >> 20) & 0xf) == 4) {
        return 0;
    }
    if (relative != 0) {
        target += e->base;
    }
    if (frames != 0) {
        func_020386f4(&e->anim, target, frames);
    } else {
        e->base = target;
        if (!(e->flags & 0x6000)) {
            func_02087dcc(&e->handle, 0xffff, target);
        }
    }
    return 1;
}
