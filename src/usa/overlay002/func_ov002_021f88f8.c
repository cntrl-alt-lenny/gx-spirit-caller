/* func_ov002_021f88f8: return -1 if 021ff500(arg0, arg1) fails, else forward
 * to 021f4a84. */
extern int func_ov002_021ff410(void *arg0, int arg1);
extern int func_ov002_021f4994(void *arg0, int arg1);

int func_ov002_021f88f8(void *arg0, int arg1) {
    if (func_ov002_021ff410(arg0, arg1) == 0)
        return -1;
    return func_ov002_021f4994(arg0, arg1);
}
