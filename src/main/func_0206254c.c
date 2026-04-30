/* func_0206254c: tail-call func_0206255c with `*p` (deref 1st arg). */
extern int func_0206255c(int a);
int func_0206254c(int *p) {
    return func_0206255c(*p);
}
