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

int func_02029458(Obj *o) {
    unsigned char *fp = (unsigned char *)o + 0x87;
    unsigned char *fq = fp + 0x100;
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
