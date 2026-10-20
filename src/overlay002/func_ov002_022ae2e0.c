typedef signed char s8;
typedef int s32;
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct {
    void *task;
    int f4, f8, fc;
    short f10;
    unsigned short f12, flags, f16;
    unsigned int f18;
    char tail[0xc];
} Desc;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Desc *o);
extern void *func_02006c0c(void *entry, int a, int b);
extern void Task_Invoke(void *p);
extern s32 OS_SPrintf(s8 *buffer, const s8 *format, ...);
extern s8 *data_ov002_022ca4e4[];
extern s8 data_ov002_022cc764[];
void func_ov002_022ae2e0(void *arr, int idx, int target) {
    s8 buf[0x20];
    Desc d;
    void *task;
    if (target > 10) return;
    OS_SPrintf(buf, data_ov002_022cc764, data_ov002_022ca4e4[target]);
    task = func_02006c0c(buf, 4, 0);
    func_0201d47c((Obj *)&d);
    d.task = task;
    d.flags = (d.flags & ~0xf) | 9;
    d.fc = (idx << 11) + 0x80 + 0x4000;
    d.f10 = -1;
    func_0201e5b8(&d);
    Task_Invoke(task);
}
