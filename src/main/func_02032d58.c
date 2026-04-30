/* func_02032d58: thunk — `func_02051d84(func_02032c2c, arg)` where func_02032c2c is a function ptr arg.
 */

extern int func_02051d84(void *fn, int arg);
extern void func_02032c2c(void);

int func_02032d58(int arg) {
    return func_02051d84((void *)func_02032c2c, arg);
}
