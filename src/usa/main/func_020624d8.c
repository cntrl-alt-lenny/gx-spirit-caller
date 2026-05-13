/* func_020624d8: tail-call func_020624e8 with `*p` (deref 1st arg). */
extern int func_020624e8(int a);
int func_020624d8(int *p) {
    return func_020624e8(*p);
}
