typedef struct {
    char pad0[0x184];
    short h184;
    char pad186[2];
    void *w188;
    char pad18c[0x19a - 0x18c];
    unsigned short h19a;
} Obj;

extern void func_02022580(int idx);
extern void Task_InvokeLocked(void *p);
extern void Task_Invoke(void *p);

int func_020298f8(Obj *o) {
    void **q = (void **)((char *)o + 0x98);
    unsigned char *fp;
    unsigned char *fq;
    int i;
    for (i = 0; i < 0x18; i++) {
        if (q[i + 2] != 0) {
            Task_InvokeLocked(q[i + 2]);
            q[i + 2] = 0;
        }
    }
    for (i = 0; i < 2; i++) {
        if (q[i + 0x1a] != 0) {
            Task_Invoke(q[i + 0x1a]);
            q[i + 0x1a] = 0;
        }
    }
    fp = (unsigned char *)o + 0x87;
    fq = fp + 0x100;
    if (o->h184 >= 0) {
        func_02022580(o->h184);
        o->h184 = -1;
        *fq &= ~1;
    }
    if (o->w188 != 0) {
        Task_InvokeLocked(o->w188);
        o->w188 = 0;
    }
    o->h19a &= ~1;
    return 1;
}
