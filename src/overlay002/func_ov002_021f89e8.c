/* func_ov002_021f89e8: return -1 if 021ff500(arg0, arg1) fails, else forward
 * to 021f4a84. */
extern int func_ov002_021ff500(void *arg0, int arg1);
extern int func_ov002_021f4a84(void *arg0, int arg1);

int func_ov002_021f89e8(void *arg0, int arg1) {
    if (func_ov002_021ff500(arg0, arg1) == 0)
        return -1;
    return func_ov002_021f4a84(arg0, arg1);
}
