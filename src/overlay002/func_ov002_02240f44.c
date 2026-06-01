/* func_ov002_02240f44: bail if idx is in range and 021b8fcc fails, else
 * forward to 022018cc(arg0, arg1, arg2). */
extern int func_ov002_021b8fcc(int player, int idx);
extern int func_ov002_022018cc(void *arg0, int player, int idx);

int func_ov002_02240f44(void *arg0, int arg1, int arg2) {
    if (arg2 < 5 && func_ov002_021b8fcc(arg1, arg2) == 0)
        return 0;
    return func_ov002_022018cc(arg0, arg1, arg2);
}
