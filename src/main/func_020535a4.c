/* func_020535a4: if func_02053688(a0)==3, clear bit2 via
 * func_0205362c(a0, func_020536a0(a0) & ~4). The `&~K` form keeps the orig's
 * `mov r1,r0; bic` (DIRECT, not a temp — inverse of the `|K` form, cf. 020535d4). */
extern int func_02053688(int);
extern int func_020536a0(int);
extern void func_0205362c(int, int);
void func_020535a4(int a0){
    if (func_02053688(a0) == 3)
        func_0205362c(a0, func_020536a0(a0) & ~4);
}
