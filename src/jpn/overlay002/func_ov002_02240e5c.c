/* func_ov002_02240e5c: bail if idx is in range and 021b8fcc fails, else
 * forward to 022018cc(arg0, arg1, arg2). */
extern int func_ov002_021b8eec(int player, int idx);
extern int func_ov002_022017dc(void *arg0, int player, int idx);

int func_ov002_02240e5c(void *arg0, int arg1, int arg2) {
    if (arg2 < 5 && func_ov002_021b8eec(arg1, arg2) == 0)
        return 0;
    return func_ov002_022017dc(arg0, arg1, arg2);
}
