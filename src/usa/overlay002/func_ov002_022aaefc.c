/* func_ov002_022aaefc: guard on val!=0 && self->f0c!=val; record val,
 * spawn a task from the val<7 ? cc_4d0 : cc_498 table, patch its bitmap
 * with a per-band offset, then invoke it. */
extern void *func_02006bf0(void *a, int b, int c);
extern void *func_0201d6bc(void *task);
extern void func_0208f838(void *dst, int a, int b);
extern void Task_Invoke(void *task);
extern char data_ov002_022cc3dc[];
extern char data_ov002_022cc3a4[];

void func_ov002_022aaefc(void *self, int val) {
    void *task;
    void *base;
    int idx;

    if (val == 0 || *(int *)((char *)self + 0xc) == val)
        return;

    *(int *)((char *)self + 0xc) = val;

    task = func_02006bf0(val < 7 ? data_ov002_022cc3dc : data_ov002_022cc3a4, 4, 0);
    idx = (val < 7) ? (val - 1) : (val - 8);

    base = func_0201d6bc(task);
    func_0208f838((char *)base + idx * 256, 0x2140, 0x100);
    Task_Invoke(task);
}
