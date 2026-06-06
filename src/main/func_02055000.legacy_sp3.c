/* func_02055000: out-param sibling of func_02054fd0 (out is the 2nd arg). SP3
 * tier (1.2/sp3). */
extern int func_02055030(int, int *, int, int);
int func_02055000(int a0){
    int local = 0;
    if (func_02055030(a0, &local, 0, 0) == 1) return local;
    return 0;
}
