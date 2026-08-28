/* func_ov002_021ca310: func_ov002_021ca1e8(arg0, func_0202b824(arg1)) must
 * be nonzero, then return whether func_ov002_021ca1f0(arg0,
 * func_0202b83c(arg1)) is nonzero.
 */

extern unsigned int func_0202b824(int id);
extern unsigned int func_0202b83c(int id);
extern int func_ov002_021ca1e8(int a, int b);
extern int func_ov002_021ca1f0(int a, int b);

int func_ov002_021ca310(int arg0, int arg1) {
    unsigned int t;
    int a;
    unsigned int t2;
    int b;

    t = func_0202b824(arg1);
    a = func_ov002_021ca1e8(arg0, t);
    if (a == 0) return 0;
    t2 = func_0202b83c(arg1);
    b = func_ov002_021ca1f0(arg0, t2);
    return b != 0;
}
