typedef struct {
    char pad[0x908];
    int field908;
    int field90c;
} SysWork;

typedef struct {
    int field0;
    int field4;
    char pad[0x18 - 8];
} Elem;

extern void *GetSystemWork(void);
extern int func_02019210(int);

void func_02018ecc(int arg0, int *out0, int *out1) {
    SysWork *sw = GetSystemWork();

    if (arg0 == 0) {
        *out0 = sw->field908;
        *out1 = sw->field90c;
    } else {
        Elem *e = (Elem *)sw + (func_02019210(arg0) - 1);
        *out0 = e->field0;
        *out1 = e->field4;
    }
}
