typedef struct Obj { int id; char first[64]; char second[64]; char bytes[4]; int f88,f8c,f90,f94,f98,f9c,fa0,fa4,fa8,fac,fb0,fb4,fb8,fbc,fc0,fc4,fc8,fcc,fd0,fd4; int slots[10]; int f100,f104; short f108,pad; int f10c; } Obj;
extern char data_021015e4[];
extern char data_021017d0[];
extern int data_0219eb6c;
extern signed char data_0219eb84[];
extern int func_020453e8(int a);
extern int func_02055330(void);
extern void func_020a9950(void *p);
extern char *func_020aadf8(char *dst, const char *src);
extern int func_020a991c(void);
extern void func_02067208(void);
extern int func_020a978c(char *dst, const char *fmt, ...);
extern int func_02067154(int arg0, int b, void *cptr, int *d);

int func_02067684(Obj *arg, int b, int c, char *d, char *e, int f, int g, int h, int i, int j, int k, int l, int m, int n) {
    char buf[64];
    int idx;
    int flag;
    int result;
    Obj *self = arg;
    if (self == 0) self = (Obj *)data_021015e4;
    else {
        *(int *)self = func_020453e8(0x110);
        self = *(Obj **)self;
    }
    func_020a9950((void *)func_02055330());
    func_020aadf8(self->first, d);
    func_020aadf8(self->second, e);
    self->fc0 = c;
    self->fac = 0;
    self->fb0 = 0;
    self->id = b;
    self->fb8 = 1;
    self->f10c = n;
    self->f88 = h;
    self->f8c = i;
    self->f90 = j;
    self->f94 = k;
    self->f98 = l;
    self->f9c = m;
    self->fa0 = 0;
    self->fa4 = 0;
    self->fd4 = 0;
    self->fbc = f;
    self->fc4 = 0;
    self->fc8 = g;
    self->f104 = 0;
    self->f108 = 0;
    self->fa8 = 0;
    self->fb4 = 0;
    for (idx = 0; idx < 4; idx++) self->bytes[idx] = func_020a991c() % 255;
    for (idx = 0; idx < 10; idx++) self->slots[idx] = -1;
    self->f100 = 0;
    if (data_0219eb6c == 0) func_02067208();
    if (f != 0) {
        flag = data_0219eb84[0];
        if (flag == 0) func_020a978c(buf, data_021017d0, d);
        result = func_02067154((int)(flag ? (char *)data_0219eb84 : buf), 0x6cfc, &self->fcc, 0);
    } else result = 1;
    return result ? 0 : 3;
}


