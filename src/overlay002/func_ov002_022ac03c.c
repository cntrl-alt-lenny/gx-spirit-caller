typedef struct {
    void *task;
    int f4;
    int f8;
    int fc;
    short f10;
    short f12;
    unsigned short flags;
    char pad16[6];
    unsigned int a : 8;
    unsigned int b : 8;
    char tail[8];
} Obj;
typedef struct { int resource; int value; } Entry;
extern Entry data_ov002_022cc658[];
extern int func_0201d47c(Obj *o);
extern void *func_02006c0c(int resource, int heap, int flag);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
void func_ov002_022ac03c(void) {
    Obj obj;
    unsigned int i;
    for (i = 0; i < 14; i++) {
        func_0201d47c(&obj);
        obj.task = func_02006c0c(data_ov002_022cc658[i].resource, 4, 0);
        obj.flags = (obj.flags & ~0xf) | 9;
        obj.fc = data_ov002_022cc658[i].value;
        obj.f10 = -1;
        func_0201e5b8(&obj);
        Task_Invoke(obj.task);
    }
}
