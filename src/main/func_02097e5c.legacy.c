typedef struct {
    void *f_0;
    unsigned short f_4;
    unsigned short f_6;
    int f_8;
} Rec;

typedef struct {
    char pad0[8];
    void *ctx;
    unsigned int flags;
    char pad1[0x30 - 0x10];
    Rec rec;
} Self;

extern int func_02097848(Self *self, int mode);

int func_02097e5c(Self *self, Rec *src) {
    self->ctx = src->f_0;
    self->rec = *src;
    if (func_02097848(self, 2) == 0) {
        return 0;
    }
    self->flags |= 0x20;
    return 1;
}
