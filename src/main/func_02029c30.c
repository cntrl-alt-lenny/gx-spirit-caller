typedef struct {
    char pad0[0x168];
    unsigned int mask;
} Obj;

int func_02029c30(Obj *o, int idx, int on) {
    if (idx < 0) {
        o->mask = on ? ~0u : 0;
    } else if (on) {
        o->mask |= 1 << idx;
    } else {
        o->mask &= ~(1 << idx);
    }
    return 1;
}
