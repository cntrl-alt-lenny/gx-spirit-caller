/* func_020a68dc: append at the NUL — func_020a6a08(a0 + strlen(a0), a1); return a0.
 * Legacy 1.2/sp2p3. */
extern int func_020a690c(char *);
extern void func_020a6a08(char *, int);
char *func_020a68dc(char *a0, int a1){
    int len = func_020a690c(a0);
    func_020a6a08(a0 + len, a1);
    return a0;
}
