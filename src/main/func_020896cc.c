typedef struct { int a; int b; } Pair;
typedef struct {
    char pad0[8]; int ctx; unsigned int flags;
    char pad1[0x30 - 0x10]; Pair rec;
} Self;
typedef struct {
    volatile int field_0;
    int field_4, field_8, field_c, field_10;
    char _pad_14[4]; int field_18;
    volatile int field_1c;
} Obj_t;
typedef struct {
    char pad0[0x30]; int state;
    char io[0x48]; Pair pair;
    int field84, field88, field8c;
} Manager;
extern Manager *data_021a5800;
extern int func_020894e0(Manager *self, int a, int b);
extern int func_0209815c(int a2, int name);
extern int func_02098088(Self *self, Pair p);
extern void func_02098388(Obj_t *obj);
void func_020896cc(Manager *self, int name, int a, int b) {
    self->field8c = 0;
    self->field84 = 0;
    self->field88 = 0;
    if (func_0209815c((int)&self->pair, name) == 0) return;
    func_02098388((Obj_t *)self->io);
    if (func_02098088((Self *)self->io, self->pair) == 0) return;
    self->state = 1;
    if (func_020894e0(self, a, b) != 0) data_021a5800 = self;
}
