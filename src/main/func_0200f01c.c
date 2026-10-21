typedef struct {
    char pad[0x60];
    unsigned int flags;
} Obj;

int func_0200f01c(Obj *o) {
    if (o == 0) return 0;
    o->flags &= ~4;
    o->flags |= 8;
    o->flags &= ~0x1e00000;
    return 1;
}
