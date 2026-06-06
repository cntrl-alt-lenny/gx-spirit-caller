/* func_02065f78: if *a0 != -1 free it (func_02054e70); reset *a0 = -1, a0->f16 = 4. */
extern void func_02054e70(int);
int func_02065f78(int *a0){
    if (*a0 != -1) func_02054e70(*a0);
    *a0 = -1;
    a0[4] = 4;
    return 4;
}
