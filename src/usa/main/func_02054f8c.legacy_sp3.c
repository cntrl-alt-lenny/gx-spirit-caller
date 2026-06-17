/* func_02054f8c: out-param sibling of func_02054f5c (out is the 2nd arg). SP3
 * tier (1.2/sp3). */
extern int func_02054fbc(int, int *, int, int);
int func_02054f8c(int a0){
    int local = 0;
    if (func_02054fbc(a0, &local, 0, 0) == 1) return local;
    return 0;
}
