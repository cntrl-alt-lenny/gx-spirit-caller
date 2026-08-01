extern int func_02006bf0(void *ptr, int a, int b);
extern int func_0201d6e4(void);
extern void func_0208fc48(int dst, int a, int b);
extern void Task_Invoke(int task);
extern char data_ov002_022cd65c[];
extern char data_ov002_022cc6d8[];
extern char data_ov002_022cc6f4[];

void func_ov002_022aff20(void *obj, int newval, int mode) {
    int *p = (int *)obj;
    if (p[0] != newval) {
        int flag = (p[0] < 0) ? 1 : 0;
        *(int *)((char *)obj + 0x10) = 0x100 - (flag << 7);
        p[0] = newval;
        *(int *)((char *)obj + 4) = 7;
    }
    if (*(int *)((char *)obj + 4) == mode) {
        return;
    }
    *(int *)((char *)obj + 4) = mode;
    if (mode == 7) {
        return;
    }
    void *ptr = (p[0] == *(int *)(data_ov002_022cd65c + 4)) ? (void *)data_ov002_022cc6d8 : (void *)data_ov002_022cc6f4;
    int result = func_02006bf0(ptr, 4, 0);
    int base = func_0201d6e4();
    func_0208fc48(base + mode * 0x400, 0x2c00, 0x400);
    Task_Invoke(result);
}
