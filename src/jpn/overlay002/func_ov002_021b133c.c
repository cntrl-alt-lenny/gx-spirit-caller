/* func_ov002_021b133c: if the f3412 latch is set, run func_ov002_021b11dc and
 * (when f3408 cleared) drop the latch; report whether it was set. */
struct g016c { char _a[3408]; int f3408; int f3412; };
extern struct g016c data_ov002_022d008c;
extern void func_ov002_021b11dc(void);
int func_ov002_021b133c(void) {
    if (data_ov002_022d008c.f3412 == 0)
        return 0;
    func_ov002_021b11dc();
    if (data_ov002_022d008c.f3408 == 0)
        data_ov002_022d008c.f3412 = 0;
    return 1;
}
