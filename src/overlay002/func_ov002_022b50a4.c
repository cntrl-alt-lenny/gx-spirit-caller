typedef struct { unsigned int attr; unsigned short tile, pad; } Sprite;
typedef struct { int head[2]; int phase; int rest[6]; int value[2]; } State;
extern int func_02034784(void);
extern int func_02034810(void);
extern int func_0207f05c(void *, const void *, int);
extern unsigned char data_ov002_022d0f7c[];
extern void func_ov002_022b3fbc(State *, int);
extern void func_ov002_022b4380(State *, int);
extern void func_ov002_022b3c5c(State *, int);
extern void func_ov002_022b4df0(int *);
extern void func_ov002_022b4588(State *);
extern void func_ov002_022b4950(int *);
void func_ov002_022b50a4(State *self) {
    Sprite s;
    int i;
    if (self->head[0] == 0) return;
    for (i = 0; i < 2; i++) {
        func_ov002_022b3fbc(self, i);
        func_ov002_022b4380(self, i);
    }
    if (func_02034784() != 0) {
        int tile = (0x4380 + (func_02034810() << 8)) / 32;
        s.attr = 0x40ef2001;
        s.tile = tile;
        func_0207f05c(data_ov002_022d0f7c, &s, 1);
    }
    if (self->phase == 0) return;
    func_ov002_022b4df0((int *)self);
    func_ov002_022b4588(self);
    for (i = 0; i < 2; i++) func_ov002_022b3c5c(self, i);
    func_ov002_022b4950((int *)self);
}


