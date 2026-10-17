extern int func_02097848(void *self, int mode);

typedef struct {
    int a;
    int b;
} Pair;

typedef struct {
    char pad0[8];
    int ctx;
    unsigned int flags;
    char pad1[0x30 - 0x10];
    Pair rec;
} Self;

int func_02098088(Self *self, Pair p) {
    if (p.a == 0) {
        return 0;
    }
    self->ctx = p.a;
    self->rec = p;
    if (func_02097848(self, 6) == 0) {
        return 0;
    }
    self->flags |= 0x10;
    self->flags &= ~0x20;
    return 1;
}
