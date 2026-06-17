/* func_02065f04: if *a0 != -1 free it (func_02054dfc); reset *a0 = -1, a0->f16 = 4. */
extern void func_02054dfc(int);
int func_02065f04(int *a0){
    if (*a0 != -1) func_02054dfc(*a0);
    *a0 = -1;
    a0[4] = 4;
    return 4;
}
