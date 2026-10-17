typedef struct Obj {
    char pad0[0x1c];
    unsigned int count;
} Obj;

void *func_0208b000(Obj *o, int i)
{
    char *base;
    int off;
    char *p;
    if (i < 0) {
        return 0;
    }
    if ((unsigned int)i >= o->count) {
        return 0;
    }
    off = i * 12;
    base = (char *)o + 0x20;
    p = base + off;
    if (*(int *)p == -1) {
        p = 0;
    }
    return p;
}
