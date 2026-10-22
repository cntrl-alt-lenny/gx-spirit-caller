typedef union { unsigned int w; unsigned short h[2]; } ent_t;
typedef struct {
    int f0, f4;
    char pad8[0x18];
    int f20, f24, f28;
    char pad2c[0x38];
    int f64;
    ent_t *f68, *f6c, *f70;
    char pad74[0x1c0];
    int f234;
} State;
struct S022abf88;
typedef struct { char pad[0x68]; ent_t *f_68, *f_6c; } state_ov002_022ac8f0_t;
extern int func_ov002_022abf88(struct S022abf88 *self, int idx);
extern void func_ov002_022ac8f0(state_ov002_022ac8f0_t *p, int lo, int hi);
extern unsigned short func_0202b33c(int id);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern unsigned int func_0202b8a8(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202b8f0(int unused0);
extern int func_0202b920(int unused0);
extern int func_0202de9c(int unused0);
extern int func_0202e234(int x);
extern void Task_InvokeLocked(void *p);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void func_ov002_022a10fc(State *, int);
extern void func_ov002_022ac67c(State *);
void func_ov002_022ac9ec(State *p, int mode) {
    int i, id, value;
    p->f64 = mode;
    switch (-p->f4) { case 0x4b: case 0x4c: case 0x4d:
        if (mode == 0) mode = 1;
        p->f68 = p->f70;
    }
    switch (mode) {
    case 0:
        for (i = 0; i < p->f24; i++) p->f68[i].h[1] = p->f68[i].w;
        break;
    case 1:
        for (i = 0; i < p->f24; i++) p->f68[i].h[1] = func_0202b33c(func_ov002_022abf88((struct S022abf88 *)p,i));
        break;
    case 2:
        for (i = 0; i < p->f24; i++) {
            id = func_ov002_022abf88((struct S022abf88 *)p,i);
            value = func_0202b8f0(id);
            p->f68[i].h[1] = 0xffff - value - func_0202e234(id);
        }
        break;
    case 3:
        for (i = 0; i < p->f24; i++) {
            id = func_ov002_022abf88((struct S022abf88 *)p,i);
            value = func_0202b920(id);
            p->f68[i].h[1] = 0xffff - value - func_0202e234(id);
        }
        break;
    case 4:
        for (i = 0; i < p->f24; i++) p->f68[i].h[1] = 0xffff - func_0202b8a8(func_ov002_022abf88((struct S022abf88 *)p,i));
        break;
    case 5:
        for (i = 0; i < p->f24; i++) p->f68[i].h[1] = func_0202de9c(func_ov002_022abf88((struct S022abf88 *)p,i));
        break;
    case 6:
        for (i = 0; i < p->f24; i++) p->f68[i].h[1] = func_0202b890(func_ov002_022abf88((struct S022abf88 *)p,i));
        break;
    case 7:
        for (i = 0; i < p->f24; i++) {
            id = func_ov002_022abf88((struct S022abf88 *)p,i);
            value = func_0202b878(id);
            p->f68[i].h[1] = (value << 4) + func_0202b8c0(id);
        }
        break;
    }
    p->f6c = (ent_t *)Task_PostLocked((void *)((p->f24 / 2 + 1) * 4),4,0);
    func_ov002_022ac8f0((state_ov002_022ac8f0_t *)p,0,p->f24-1);
    for (i = 0; i < p->f24; i++) p->f68[i].w = (unsigned short)p->f68[i].w;
    Task_InvokeLocked(p->f6c);
    switch (-p->f4) { case 0x4b: case 0x4c: case 0x4d: p->f68 = 0; break; }
    p->f28 = 0;
    p->f20 = 0;
    func_ov002_022a10fc(p,0);
    p->f234 = p->f28;
    func_ov002_022ac67c(p);
}


