/* func_ov013_021ca294: after refreshing the counter (func_0201ab2c), return the
 * number of pages needed to show func_ov000_021ab1b0 items at 3 per page —
 * i.e. ceil-ish (count + 2) / 3. (ov013_core.h) */
extern void func_0201ab2c(void);
extern int func_ov000_021ab1b0(void);
int func_ov013_021ca294(void) {
    int n;
    func_0201ab2c();
    n = func_ov000_021ab1b0();
    return (n + 2) / 3;
}
