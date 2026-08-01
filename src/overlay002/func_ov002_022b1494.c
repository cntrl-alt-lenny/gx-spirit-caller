extern void *Task_PostLocked(int a, int b, int c);
extern void Task_InvokeLocked(void *p);
extern void func_02001d0c(void *p, int a, int b);
extern void func_02094504(int a, void *b, int c);
extern int func_02005088(void *p, int g, void *r, int x, int e, int f);
extern void func_02092904(void *p, int a);
extern void func_0208fd30(int dst, int a, int b);
extern char data_02102c90[];

int func_ov002_022b1494(int arg0, char *arg1, int arg2) {
    void *task;
    int c1;
    int i;
    char *p7;
    char *p8;
    int c2;

    task = Task_PostLocked(0x400, 4, 0);
    func_02001d0c(data_02102c90, 0x10, 2);
    func_02094504(0, task, 0x400);
    func_02005088(data_02102c90, arg0, task, 1, 2, arg2);
    func_02092904(task, 0x400);

    c1 = 0x80;
    i = 0;
    p7 = arg1;
    p8 = (char *)task;
    c2 = c1;
    for (; i < 4; i++) {
        func_0208fd30((int)p8, (int)p7, c1);
        func_0208fd30((int)(p8 + 0x200), (int)(arg1 + (i * 2 + 1) * 0x80), c2);
        p7 += 0x100;
        p8 += 0x80;
    }

    Task_InvokeLocked(task);
    return *(int *)(data_02102c90 + 8);
}
