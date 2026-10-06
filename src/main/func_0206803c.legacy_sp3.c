typedef struct {
    char          _0[0x14];
    unsigned char flags;
} rec_0206803c_t;

typedef struct {
    char _0[0x4];
    int  max;
    char _8[0x8];
    int  active;
    int  queue[2];
} obj_0206803c_t;

extern void func_02068194(void *self, int v);
extern void func_02068424(int *o, int *n);
extern void func_0206844c(int *o, int *n);

void func_0206803c(obj_0206803c_t *o, rec_0206803c_t *rec, int front, int mode) {
    rec->flags &= 0xc3;
    if (mode == 0) {
        rec->flags |= 4;
    } else if (mode == 1) {
        rec->flags |= 8;
    } else if (mode == 2) {
        return;
    }
    if (o->active < o->max) {
        func_02068194(o, (int)rec);
        return;
    }
    if (front != 0) {
        func_02068424(o->queue, (int *)rec);
    } else {
        func_0206844c(o->queue, (int *)rec);
    }
}
