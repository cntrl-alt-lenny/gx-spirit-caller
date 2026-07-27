/* func_ov002_022ab038: guard on val!=0 && self->f0c!=val; record val,
 * spawn a task from the val<7 ? cc_4d0 : cc_498 table, patch its bitmap
 * with a per-band offset, then invoke it. */
extern void *func_02006c0c(void *a, int b, int c);
extern void *func_0201d710(void *task);
extern void func_0208f920(void *dst, int a, int b);
extern void Task_Invoke(void *task);
extern char data_ov002_022cc4d0[];
extern char data_ov002_022cc498[];

void func_ov002_022ab038(void *self, int val) {
    void *task;
    void *base;
    int idx;

    if (val == 0 || *(int *)((char *)self + 0xc) == val)
        return;

    *(int *)((char *)self + 0xc) = val;

    task = func_02006c0c(val < 7 ? data_ov002_022cc4d0 : data_ov002_022cc498, 4, 0);
    idx = (val < 7) ? (val - 1) : (val - 8);

    base = func_0201d710(task);
    func_0208f920((char *)base + idx * 256, 0x2140, 0x100);
    Task_Invoke(task);
}
