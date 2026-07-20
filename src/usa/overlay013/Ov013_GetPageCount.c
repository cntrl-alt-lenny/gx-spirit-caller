/* Ov013_GetPageCount: after refreshing the counter (func_0201aaec), return the
 * number of pages needed to show func_ov000_021ab0d0 items at 3 per page —
 * i.e. ceil-ish (count + 2) / 3. (ov013_core.h) */
extern void func_0201aaec(void);
extern int func_ov000_021ab0d0(void);
int Ov013_GetPageCount(void) {
    int n;
    func_0201aaec();
    n = func_ov000_021ab0d0();
    return (n + 2) / 3;
}
