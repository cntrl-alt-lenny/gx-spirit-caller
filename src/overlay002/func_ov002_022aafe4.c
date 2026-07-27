/* func_ov002_022aafe4: if (arg1==0 || obj->f4==arg1) return; obj->f4=arg1;
 * task = func_02006c0c(&data_022cc4d0, 4, 0); base = func_0201d710(task);
 * func_0208f920(base + (arg1-1)<<8, 0x2040, 0x100); Task_Invoke(task);
 *
 * The `arg1==0 || f4==arg1` short-circuit is the movs/ldrne/cmpne/ldmeqia
 * predicated-OR idiom (movs sets Z from arg1 itself; if arg1!=0 the field
 * load+compare overrides Z). func_0201d710 is called with r0 STILL holding
 * the func_02006c0c result (task), i.e. func_0201d710(task) -- not a bare
 * no-arg call. */
struct S022aafe4 { char pad[4]; int f4; };
extern char data_ov002_022cc4d0[];
extern void *func_02006c0c(void *p, int n, int m);
extern void *func_0201d710(void *handle);
extern void func_0208f920(void *a, int b, unsigned int c);
extern void Task_Invoke(void *task);

void func_ov002_022aafe4(struct S022aafe4 *arg0, int arg1) {
    void *task;
    void *base;
    if (arg1 == 0 || arg0->f4 == arg1)
        return;
    arg0->f4 = arg1;
    task = func_02006c0c(data_ov002_022cc4d0, 4, 0);
    base = func_0201d710(task);
    func_0208f920((char *)base + ((arg1 - 1) << 8), 0x2040, 0x100);
    Task_Invoke(task);
}
