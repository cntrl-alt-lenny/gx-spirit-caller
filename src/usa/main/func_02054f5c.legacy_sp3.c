/* func_02054f5c: out-param query — func_02054fbc(a0,0,&out,0); return out on
 * success (==1) else 0. SP3 tier (1.2/sp3). */
extern int func_02054fbc(int, int, int *, int);
int func_02054f5c(int a0){
    int local = 0;
    if (func_02054fbc(a0, 0, &local, 0) == 1) return local;
    return 0;
}
