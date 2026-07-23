typedef struct {
    char pad[0x908];
    int field908;
    int field90c;
} SysWork02018e88;

typedef struct {
    int field0;
    int field4;
    char pad[0x18 - 8];
} Elem02018e88;

extern void *GetSystemWork(void);
extern int func_02019210(int);

void func_02018e88(int arg0, int arg1, int arg2) {
    SysWork02018e88 *sw = GetSystemWork();
    int idx = func_02019210(arg0) - 1;
    Elem02018e88 *e = (Elem02018e88 *)((char *)sw + idx * 0x18);
    if (arg0 == 0) {
        sw->field908 = arg1;
        sw->field90c = arg2;
    } else {
        e->field0 = arg1;
        e->field4 = arg2;
    }
}
