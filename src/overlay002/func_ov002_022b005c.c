extern int func_02006c0c(void *ptr, int a, int b);
extern int func_0201d738(void);
extern void func_0208fd30(int dst, int a, int b);
extern void Task_Invoke(int task);
extern char data_ov002_022cd73c[];
extern char data_ov002_022cc7cc[];
extern char data_ov002_022cc7e8[];

void func_ov002_022b005c(void *obj, int newval, int mode) {
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
    void *ptr = (p[0] == *(int *)(data_ov002_022cd73c + 4)) ? (void *)data_ov002_022cc7cc : (void *)data_ov002_022cc7e8;
    int result = func_02006c0c(ptr, 4, 0);
    int base = func_0201d738();
    func_0208fd30(base + mode * 0x400, 0x2c00, 0x400);
    Task_Invoke(result);
}
