/* func_ov002_022aaea8: if (arg1==0 || obj->f4==arg1) return; obj->f4=arg1;
 * task = func_02006bf0(&data_022cc4b4, 4, 0); base = func_0201d6bc(task);
 * func_0208f838(base + (arg1-1)<<8, 0x2040, 0x100); Task_Invoke(task);
 *
 * The `arg1==0 || f4==arg1` short-circuit is the movs/ldrne/cmpne/ldmeqia
 * predicated-OR idiom (movs sets Z from arg1 itself; if arg1!=0 the field
 * load+compare overrides Z). func_0201d6bc is called with r0 STILL holding
 * the func_02006bf0 result (task), i.e. func_0201d6bc(task) -- not a bare
 * no-arg call. */
struct S022aafe4 { char pad[4]; int f4; };
extern char data_ov002_022cc3dc[];
extern void *func_02006bf0(void *p, int n, int m);
extern void *func_0201d6bc(void *handle);
extern void func_0208f838(void *a, int b, unsigned int c);
extern void Task_Invoke(void *task);

void func_ov002_022aaea8(struct S022aafe4 *arg0, int arg1) {
    void *task;
    void *base;
    if (arg1 == 0 || arg0->f4 == arg1)
        return;
    arg0->f4 = arg1;
    task = func_02006bf0(data_ov002_022cc3dc, 4, 0);
    base = func_0201d6bc(task);
    func_0208f838((char *)base + ((arg1 - 1) << 8), 0x2040, 0x100);
    Task_Invoke(task);
}
