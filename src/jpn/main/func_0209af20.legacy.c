/* func_0209af20: StyleA dispatch -> r=helperA(.., cb, &out); if r return r;
 * tail func_0209b3b0(); return out. cb = func_0209b3a8. */
extern void func_0209b3a8(void);
extern void func_0209b3b0(void);
extern int func_0209af5c(int a0, void (*cb)(void), int *out);
int func_0209af20(int a0) {
    int out;
    int r = func_0209af5c(a0, func_0209b3a8, &out);
    if (r != 0) return r;
    func_0209b3b0();
    return out;
}
