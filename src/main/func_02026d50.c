typedef struct {
    char pad0[0x80];
    void *w80;
    char pad84[4];
    void *w88;
} Sub;

typedef struct {
    void *w0;
    void *arr[3];
    Sub *w10;
    short h14;
    unsigned char b0 : 1;
} P;

typedef struct {
    char pad0[0x94];
    P p;
} Obj;

extern char *func_0202162c(void);
extern int func_02021660(char *a, int b, int c);
extern int func_0200af08(void *p);
extern int func_0200afc8(void *p);
extern void Task_Invoke(void *p);

int func_02026d50(Obj *o, int idx, unsigned int flags) {
    P *p = &o->p;
    idx = (signed char)idx;
    void *v;
    if (p->b0) {
        char *base = (char *)func_02021660(func_0202162c(), 3, p->h14);
        v = *(void **)(base + idx * 4 + 0x98);
    } else if (idx >= 0) {
        v = p->arr[idx];
    } else {
        v = p->w0;
    }
    if (v == 0) {
        return 1;
    }
    if ((flags & 1) && p->w10->w80 != 0) {
        func_0200af08(p->w10->w80);
        p->w10->w80 = 0;
    }
    if ((flags & 4) && p->w10->w88 != 0) {
        func_0200afc8(p->w10->w88);
        p->w10->w88 = 0;
    }
    if (!p->b0 && idx >= 0 && p->arr[idx] != 0) {
        Task_Invoke(p->arr[idx]);
        p->arr[idx] = 0;
    }
    return 1;
}
