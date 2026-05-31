/* func_ov002_021d1b2c: dispatch event 54 carrying the queue head, then clear
 * the queue tail. */
struct g950 { char _a[2]; unsigned short f2; char _b[2056]; int f2060; };
extern struct g950 data_ov002_022ce950;
extern int func_ov002_0229ade0(int a, int b, int c, int d);
void func_ov002_021d1b2c(void) {
    func_ov002_0229ade0(54, data_ov002_022ce950.f2, 0, 0);
    data_ov002_022ce950.f2060 = 0;
}
