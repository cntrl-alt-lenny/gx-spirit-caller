/* func_ov002_022aae50: if (arg1==0 || self->f8==arg1) return; self->f8=arg1;
 * task = func_02006bf0(&data_ov002_022cc3c0, 4, 0); base = func_0201d6bc(task);
 * func_0208f838(base + (arg1-1)<<8, 0x1f40, 0x100); Task_Invoke(task);
 * Same shape as the proven func_ov002_022aaea8 sibling. */
struct Self { char pad[8]; int f8; };
extern char data_ov002_022cc3c0[];
extern void *func_02006bf0(void *p, int n, int m);
extern void *func_0201d6bc(void *handle);
extern void func_0208f838(void *a, int b, unsigned int c);
extern void Task_Invoke(void *task);

void func_ov002_022aae50(struct Self *self, int arg1) {
    void *task;
    void *base;
    if (arg1 == 0 || self->f8 == arg1 + 21)
        return;
    self->f8 = arg1 + 21;
    task = func_02006bf0(data_ov002_022cc3c0, 4, 0);
    base = func_0201d6bc(task);
    func_0208f838((char *)base + ((arg1 - 1) << 8), 0x1f40, 0x100);
    Task_Invoke(task);
}
