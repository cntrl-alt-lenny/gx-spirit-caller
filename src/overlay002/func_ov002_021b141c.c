/* func_ov002_021b141c: if the f3412 latch is set, run func_ov002_021b12bc and
 * (when f3408 cleared) drop the latch; report whether it was set. */
struct g016c { char _a[3408]; int f3408; int f3412; };
extern struct g016c data_ov002_022d016c;
extern void func_ov002_021b12bc(void);
int func_ov002_021b141c(void) {
    if (data_ov002_022d016c.f3412 == 0)
        return 0;
    func_ov002_021b12bc();
    if (data_ov002_022d016c.f3408 == 0)
        data_ov002_022d016c.f3412 = 0;
    return 1;
}
