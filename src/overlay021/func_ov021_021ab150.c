typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern void *func_020211c8(unsigned int *a0);
extern int func_0202147c(int *p);
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_0202227c(int idx, int b);
extern int func_020a978c(char *, const char *, ...);
extern int func_ov021_021aba18(int *s);
extern int func_ov021_021abaa0(int *s);
extern int func_ov021_021abb6c(void *o, int on);
extern int func_ov021_021abbc8(void *o);
extern unsigned int data_020c72f0[];
extern char data_ov021_021ace58[];
typedef struct {
    Obj *handle;
    char pad04[0x40];
    int column, row;
    int pad4c;
    int timer;
    char pad54[0xc];
    int chosen[5];
    int tiles[10];
    int clear[10];
    char text[6][0x20];
    int pad184[2];
    int f18c, f190;
} State;
int func_ov021_021ab150(int *s) {
    State *o = (State *)s;
    int i;
    void *p;
    char *text;
    if (o->handle == 0) {
        o->handle = func_020211c8(data_020c72f0);
        func_0202147c((int *)o->handle);
    }
    for (i = 0; i < 10; i++) o->clear[i] = 0;
    o->f18c = 0;
    o->f190 = 0;
    func_ov021_021aba18(s);
    func_ov021_021abaa0(s);
    p = (void *)func_02021660(o->handle, 3, 2);
    func_020216b0(p, 3, (o->column - 2) * 0x48);
    func_020216b0(p, 4, o->row == 0 ? 0x38 : -0x38);
    func_020216b0(p, 5, 2);
    func_020216b0(p, 0, 0x11);
    func_020216b0((void *)func_02021660(o->handle, 3, 2), 11, 0);
    for (i = 0; i < 10; i++) {
        p = (void *)func_02021660(o->handle, 3, i + 5);
        func_020216b0(p, 2, o->tiles[i]);
        func_020216b0(p, 3, (i % 5 - 2) * 0x48);
        func_020216b0(p, 4, i / 5 == 0 ? 0x38 : -0x38);
        func_020216b0(p, 5, 0);
        func_020216b0(p, 12, i * 3);
        func_020216b0(p, 0, 0x15);
        func_020216b0((void *)func_02021660(o->handle, 3, i + 5), 11, 0x1f);
    }
    for (i = 0; i < 6; i++) {
        p = (void *)func_02021660(o->handle, 3, i + 15);
        func_020216b0(p, 2, i);
        func_020216b0(p, 0, 0x101);
        func_020216b0((void *)func_02021660(o->handle, 3, i + 15), 11, 0);
    }
    for (i = 0, text = o->text[0]; i < 6; i++, text += 0x20) {
        func_0202227c(i, (int)text);
        text[0] = 0;
        func_020a978c(text, data_ov021_021ace58, i == 0 ? 0 : o->chosen[i - 1]);
    }
    o->timer = 0x3c;
    func_ov021_021abb6c(o, 1);
    func_ov021_021abbc8(o);
    return 1;
}

