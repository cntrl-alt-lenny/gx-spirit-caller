/* func_ov002_022aaf8c: if (arg1==0 || self->f8==arg1) return; self->f8=arg1;
 * task = func_02006c0c(&data_ov002_022cc4b4, 4, 0); base = func_0201d710(task);
 * func_0208f920(base + (arg1-1)<<8, 0x1f40, 0x100); Task_Invoke(task);
 * Same shape as the proven func_ov002_022aafe4 sibling. */
struct Self { char pad[8]; int f8; };
extern char data_ov002_022cc4b4[];
extern void *func_02006c0c(void *p, int n, int m);
extern void *func_0201d710(void *handle);
extern void func_0208f920(void *a, int b, unsigned int c);
extern void Task_Invoke(void *task);

void func_ov002_022aaf8c(struct Self *self, int arg1) {
    void *task;
    void *base;
    if (arg1 == 0 || self->f8 == arg1 + 21)
        return;
    self->f8 = arg1 + 21;
    task = func_02006c0c(data_ov002_022cc4b4, 4, 0);
    base = func_0201d710(task);
    func_0208f920((char *)base + ((arg1 - 1) << 8), 0x1f40, 0x100);
    Task_Invoke(task);
}
