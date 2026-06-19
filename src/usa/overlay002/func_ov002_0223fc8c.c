/* func_ov002_0223fc8c: require 022575c8, then report 0223e1b4(arg0, arg1,
 * arg2) clear. */
extern int func_ov002_022574e0(void);
extern int func_ov002_0223e0c4(void *arg0, int arg1, int arg2);

int func_ov002_0223fc8c(void *arg0, int arg1, int arg2) {
    if (func_ov002_022574e0() == 0)
        return 0;
    return func_ov002_0223e0c4(arg0, arg1, arg2) == 0;
}
