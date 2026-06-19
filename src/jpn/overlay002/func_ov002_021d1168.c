/* func_ov002_021d1168: unless func_ov002_0229c6e8(5) is busy, run step 10 and
 * clear the queue tail. */
struct g950 { char _a[2060]; int f2060; };
extern struct g950 data_ov002_022ce870;
extern int func_ov002_0229c6e8(int a);
extern int func_ov002_021b0a74(int a, int b);
void func_ov002_021d1168(void) {
    if (func_ov002_0229c6e8(5) != 0)
        return;
    func_ov002_021b0a74(10, 0);
    data_ov002_022ce870.f2060 = 0;
}
