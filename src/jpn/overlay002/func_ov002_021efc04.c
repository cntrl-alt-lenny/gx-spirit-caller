/* func_ov002_021efc04: require 021f1fe8, then report 021c2084(arg0, arg1,
 * arg2, 0) nonzero. */
extern int func_ov002_021f1ef8(void);
extern int func_ov002_021c1fa4(void *arg0, int arg1, int arg2, int flag);

int func_ov002_021efc04(void *arg0, int arg1, int arg2) {
    if (func_ov002_021f1ef8() == 0)
        return 0;
    return func_ov002_021c1fa4(arg0, arg1, arg2, 0) != 0;
}
