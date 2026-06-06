/* func_020a69d0: append at the NUL — func_020a6afc(a0 + strlen(a0), a1); return a0.
 * Legacy 1.2/sp2p3. */
extern int func_020a6a00(char *);
extern void func_020a6afc(char *, int);
char *func_020a69d0(char *a0, int a1){
    int len = func_020a6a00(a0);
    func_020a6afc(a0 + len, a1);
    return a0;
}
