/* func_ov002_021cb15c: enter request state 9 — reset the duel-command block and
 * the queue tail. */
struct g016c { char _a[3372]; int f3372; int f3376; };
struct g950 { char _a[2060]; int f2060; };
extern struct g016c data_ov002_022d008c;
extern struct g950 data_ov002_022ce870;
extern int func_ov002_021ab784(int a);
void func_ov002_021cb15c(void) {
    func_ov002_021ab784(0);
    data_ov002_022d008c.f3372 = 9;
    data_ov002_022d008c.f3376 = 0;
    data_ov002_022ce870.f2060 = 0;
}
