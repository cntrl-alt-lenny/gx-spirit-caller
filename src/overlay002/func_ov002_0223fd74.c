/* func_ov002_0223fd74: require 022575c8, then report 0223e1b4(arg0, arg1,
 * arg2) clear. */
extern int func_ov002_022575c8(void);
extern int func_ov002_0223e1b4(void *arg0, int arg1, int arg2);

int func_ov002_0223fd74(void *arg0, int arg1, int arg2) {
    if (func_ov002_022575c8() == 0)
        return 0;
    return func_ov002_0223e1b4(arg0, arg1, arg2) == 0;
}
