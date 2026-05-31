/* func_ov002_021cb23c: enter request state 9 — reset the duel-command block and
 * the queue tail. */
struct g016c { char _a[3372]; int f3372; int f3376; };
struct g950 { char _a[2060]; int f2060; };
extern struct g016c data_ov002_022d016c;
extern struct g950 data_ov002_022ce950;
extern int func_ov002_021ab864(int a);
void func_ov002_021cb23c(void) {
    func_ov002_021ab864(0);
    data_ov002_022d016c.f3372 = 9;
    data_ov002_022d016c.f3376 = 0;
    data_ov002_022ce950.f2060 = 0;
}
