typedef struct { char pad0[0xb0]; int result; char pad1[0x24]; void *obj; } Context;
typedef struct { char pad0[0x2c]; void *obj; char pad1[0x1f0]; union { unsigned flags; struct { unsigned low : 6; unsigned enabled : 1; unsigned high : 25; } bits; }; } State;
typedef struct { char pad0[0x48]; short value; unsigned short unused, step, count; } Scroll;
typedef struct { char pad0[0x52]; unsigned short held, pressed; } Input;
extern Context data_ov010_021b91b4;
extern State data_ov010_021b9260;
extern Scroll data_ov010_021b93d0;
extern Input data_02104bac;
extern int func_ov010_021b2480(void *p);
extern int func_ov010_021b2488(void *p);
extern void func_ov010_021b23f4(void *arg0, int arg1);
int func_ov010_021b4e6c(void) {
    State *s = &data_ov010_021b9260;
    Scroll *p = &data_ov010_021b93d0;
    int result = data_ov010_021b91b4.result;
    int min = func_ov010_021b2480(data_ov010_021b91b4.obj);
    int max = func_ov010_021b2488(data_ov010_021b91b4.obj);
    int changed = 0;
    if (max < 0) max = 0;
    if (data_02104bac.pressed & 2) {
        s->flags |= 4;
    } else if ((data_02104bac.held & 0x40) && p->value > min) {
        p->value -= p->step;
        changed = 1;
        if (p->value < min) p->value = min;
        p->count++;
    } else if ((data_02104bac.held & 0x80) && p->value < max) {
        p->value += p->step;
        if (p->value > max) p->value = max;
        p->count++;
        changed = 1;
    } else {
        p->step = 1;
        p->count = 0;
    }
    if (p->count > 10) {
        unsigned step = p->step;
        p->count = 0;
        p->step = step + 1;
        if (p->step > 12) p->step = 12;
    }
    if (changed == 1) func_ov010_021b23f4(s->obj, p->value);
    if (s->bits.enabled == 1) {
        if (data_02104bac.pressed & 0x800) s->flags |= 8;
    }
    return result;
}



