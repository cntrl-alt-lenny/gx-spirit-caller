extern void *Task_PostLocked(int a, int b, int c);
extern void Task_InvokeLocked(void *p);
extern void func_02001cec(void *p, int a, int b);
extern void func_02094410(int a, void *b, int c);
extern int func_0200506c(void *p, int g, void *r, int x, int e, int f);
extern void func_0209281c(void *p, int a);
extern void func_0208fc48(int dst, int a, int b);
extern char data_02102bb0[];

int func_ov002_022b1358(int arg0, char *arg1, int arg2) {
    void *task;
    int c1;
    int i;
    char *p7;
    char *p8;
    int c2;

    task = Task_PostLocked(0x400, 4, 0);
    func_02001cec(data_02102bb0, 0x10, 2);
    func_02094410(0, task, 0x400);
    func_0200506c(data_02102bb0, arg0, task, 1, 2, arg2);
    func_0209281c(task, 0x400);

    c1 = 0x80;
    i = 0;
    p7 = arg1;
    p8 = (char *)task;
    c2 = c1;
    for (; i < 4; i++) {
        func_0208fc48((int)p8, (int)p7, c1);
        func_0208fc48((int)(p8 + 0x200), (int)(arg1 + (i * 2 + 1) * 0x80), c2);
        p7 += 0x100;
        p8 += 0x80;
    }

    Task_InvokeLocked(task);
    return *(int *)(data_02102bb0 + 8);
}
