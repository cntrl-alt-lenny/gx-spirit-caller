/* func_ov002_021d1a44: dispatch event 54 carrying the queue head, then clear
 * the queue tail. */
struct g950 { char _a[2]; unsigned short f2; char _b[2056]; int f2060; };
extern struct g950 data_ov002_022ce870;
extern int func_ov002_0229acd0(int a, int b, int c, int d);
void func_ov002_021d1a44(void) {
    func_ov002_0229acd0(54, data_ov002_022ce870.f2, 0, 0);
    data_ov002_022ce870.f2060 = 0;
}
