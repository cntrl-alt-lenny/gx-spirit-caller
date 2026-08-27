/* func_020644d0: calls func_020552bc() into a stack temp, then calls
 * func_020542c4(obj->f_c, &func_0206450c, &temp). Returns 1 if that
 * call returned 0, else 0.
 */
extern int func_020552bc(void);
extern int func_020542c4(int a0, void *fn, void *out);
extern void func_0206450c(void);

int func_020644d0(char *obj) {
    int local;
    int result;

    local = func_020552bc();
    result = func_020542c4(*(int *)(obj + 0xc), (void *)func_0206450c, &local);

    return (result == 0) ? 1 : 0;
}
