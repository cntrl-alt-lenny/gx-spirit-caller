/* func_02053530: if func_02053614(a0)==3, clear bit2 via
 * func_020535b8(a0, func_0205362c(a0) & ~4). The `&~K` form keeps the orig's
 * `mov r1,r0; bic` (DIRECT, not a temp — inverse of the `|K` form, cf. 020535d4). */
extern int func_02053614(int);
extern int func_0205362c(int);
extern void func_020535b8(int, int);
void func_02053530(int a0){
    if (func_02053614(a0) == 3)
        func_020535b8(a0, func_0205362c(a0) & ~4);
}
