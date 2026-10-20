typedef struct {
    char pad[0x80];
    int f80;
    unsigned int on : 1;
    unsigned int b1 : 1;
    unsigned int b2 : 1;
    unsigned int b3 : 1;
    unsigned int b4 : 1;
    unsigned int f5 : 1;
    unsigned int val : 16;
    unsigned int rest : 10;
} Obj_0200f044;
typedef struct Obj Obj;
extern int func_0200f044(Obj_0200f044 *o, int mode, unsigned int val, int flag);
extern int func_0200f13c(Obj *o, unsigned int mode, unsigned int val, int flag);
extern int func_0200f2ac(void *o, unsigned int mode, unsigned int val, int flag);
extern int func_0200f4b4(void *o, unsigned int mode, unsigned int val, int flag);
extern int func_0200f684(void *o, unsigned int mode, unsigned int val, int flag);
typedef struct {
    char pad[0xa4];
    void *p;
    char pad_a8[3];
    unsigned char flags;
} MainObj;
int func_0202695c(MainObj *o, int mode, unsigned int flag, unsigned int val) {
    void *p = o->p;
    unsigned int masked = flag & 1;
    switch (mode) {
    case 0:
        if (o->flags & 1) {
            func_0200f044(p, 6, val, masked);
            func_0200f044(p, 1, val, masked);
        }
        if (o->flags & 2) {
            func_0200f2ac(p, 6, val, masked);
            func_0200f2ac(p, 1, val, masked);
        }
        if (o->flags & 4) {
            func_0200f13c(p, 6, val, masked);
            func_0200f13c(p, 1, val, masked);
        }
        if (o->flags & 8) {
            func_0200f4b4(p, 6, val, masked);
            func_0200f4b4(p, 1, val, masked);
        }
        if (o->flags & 16) {
            func_0200f684(p, 6, val, masked);
            func_0200f684(p, 1, val, masked);
        }
        break;
    case 1:
    case 2:
        if (o->flags & 1) func_0200f044(p, 5, val, masked);
        if (o->flags & 2) func_0200f2ac(p, 5, val, masked);
        if (o->flags & 4) func_0200f13c(p, 5, val, masked);
        if (o->flags & 8) func_0200f4b4(p, 5, val, masked);
        if (o->flags & 16) func_0200f684(p, 5, val, masked);
        break;
    }
    return 1;
}

