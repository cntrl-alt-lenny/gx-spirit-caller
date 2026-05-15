/* func_02032d04: thunk — `func_02051d10(func_02032bd8, arg)` where func_02032bd8 is a function ptr arg.
 */

extern int func_02051d10(void *fn, int arg);
extern void func_02032bd8(void);

int func_02032d04(int arg) {
    return func_02051d10((void *)func_02032bd8, arg);
}
