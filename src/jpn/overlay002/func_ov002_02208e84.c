/* func_ov002_02208e84: if either player has 021bbd04(player, 6), forward to
 * 0220736c(arg0, arg1); else 0. */
extern int func_ov002_021bbc24(int player, int code);
extern int func_ov002_0220727c(void *arg0, int arg1);

int func_ov002_02208e84(void *arg0, int arg1) {
    if (func_ov002_021bbc24(0, 6) != 0 || func_ov002_021bbc24(1, 6) != 0)
        return func_ov002_0220727c(arg0, arg1);
    return 0;
}
