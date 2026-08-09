/* func_02064544: calls func_02055330() into a stack temp, then calls
 * func_02054338(obj->f_c, &func_02064580, &temp). Returns 1 if that
 * call returned 0, else 0.
 */
extern int func_02055330(void);
extern int func_02054338(int a0, void *fn, void *out);
extern void func_02064580(void);

int func_02064544(char *obj) {
    int local;
    int result;

    local = func_02055330();
    result = func_02054338(*(int *)(obj + 0xc), (void *)func_02064580, &local);

    return (result == 0) ? 1 : 0;
}
