typedef struct { int a; int b; } Pair;
typedef struct {
    int field_0;
    int field_4, field_8, field_c, field_10;
    char pad_14[4];
    int field_18;
    int field_1c;
} Obj_t;
typedef struct {
    char pad0[8]; int ctx; unsigned int flags;
    char pad1[0x20]; Pair rec;
} Self;
extern void func_02098388(Obj_t *obj);
extern int func_02098104(int *self, int a1, int a2, int a3, int a4);
extern int func_02097f10();
extern int func_02097ff0(int *self);
extern int func_02098088(Self *self, Pair p);
extern asm void func_02098c70(Pair *out, int *info);
int func_02098b60(int *out, int mode, unsigned int index, int ctx,
                 int base0, unsigned int size0, int base1, unsigned int size1) {
    int io[18];
    Pair p;
    unsigned int offset;
    int base;
    unsigned int size;
    if (mode == 0) { size = size0; base = base0; }
    else { size = size1; base = base1; }
    offset = index << 5;
    if (offset >= size) return 0;
    func_02098388((Obj_t *)io);
    if (func_02098104(io, ctx, base + offset, base + size, -1) == 0) return 0;
    if (func_02097f10((int)io, (int)out, 0x20) != 0x20) {
        func_02097ff0(io);
        return 0;
    }
    func_02097ff0(io);
    out[8] = mode;
    func_02098c70(&p, out);
    if (func_02098088((Self *)io, p) == 0) return 0;
    out[9] = io[9];
    out[10] = io[10] - io[9];
    func_02097ff0(io);
    return 1;
}


