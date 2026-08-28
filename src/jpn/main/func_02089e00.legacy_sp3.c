/* func_02089e00: identical cluster-33 shape to its siblings, differing
 * only in the pooled function pointer (func_02089b5c).
 *   r = func_02088f3c(p0); if (r != 0) return r;
 *   arg2 = p2 ? func_02089308() : 0;
 *   r = func_02089e78(p0, &func_02089b5c, arg2, p0, p1);
 *   if (p2 != 0 && r != 0) func_02088f20(p0, r);
 *   return r;
 */
extern int  func_02088f3c(int a);
extern int  func_02089308(void);
extern int  func_02089e78(int a, void *b, int c, int d, int e);
extern void func_02088f20(int a, int b);
extern void func_02089b5c(void);

int func_02089e00(int p0, int p1, int p2) {
    int r;
    int arg2;

    r = func_02088f3c(p0);
    if (r != 0) goto tail;

    if (p2 == 0) {
        arg2 = 0;
    } else {
        arg2 = func_02089308();
    }

    r = func_02089e78(p0, (void *)&func_02089b5c, arg2, p0, p1);
    if (p2 != 0 && r != 0) {
        func_02088f20(p0, r);
    }
tail:
    return r;
}
