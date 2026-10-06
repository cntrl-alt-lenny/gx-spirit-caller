typedef struct {
    int            id;
    unsigned short seq;
} ref_0206904c_t;

typedef struct obj_0206904c obj_0206904c_t;

struct obj_0206904c {
    char           _0[0x628];
    int            pending;
    unsigned short pending_seq;
    char           _62e[0x2];
    void         (*cb)(obj_0206904c_t *o, int ev, ref_0206904c_t *ref, int arg);
    int            arg;
};

void func_0206904c(int unused, int mode, ref_0206904c_t *ref, obj_0206904c_t *o) {
    switch (mode) {
    case 1:
        o->cb(o, 2, ref, o->arg);
        break;
    case 0:
        o->cb(o, 1, ref, o->arg);
        break;
    case 2:
        o->cb(o, 4, ref, o->arg);
        break;
    }
    if (ref == 0) {
        return;
    }
    if (ref->id != o->pending) {
        return;
    }
    if (ref->seq == o->pending_seq) {
        o->pending = 0;
    }
}
