struct Packed { unsigned short a : 1; unsigned short b : 5; unsigned short c : 8; };
struct Obj { char _pad[0x590]; struct Packed p; };
struct Slot { unsigned int _lo : 13; unsigned int f13 : 1; };
extern struct { char _pad0[4]; int f4; } data_ov002_022cd73c;
extern int func_ov002_021c9504(int a, int b, int c);
extern int func_ov002_021c988c(int a, int b, int c);
extern struct Slot *func_ov002_021c93f0(int a, int b, int c);

int func_ov002_022a6afc(struct Obj *self) {
    int r = (self->p.a == (data_ov002_022cd73c.f4 ^ 1));
    if (func_ov002_021c9504(self->p.a, self->p.b, self->p.c) != 0) {
        if (self->p.a == data_ov002_022cd73c.f4 ||
            func_ov002_021c988c(self->p.a, self->p.b, self->p.c) != 0) {
            struct Slot *s = func_ov002_021c93f0(self->p.a, self->p.b, self->p.c);
            r = ((data_ov002_022cd73c.f4 ^ 1) == s->f13);
        }
    }
    return r;
}
