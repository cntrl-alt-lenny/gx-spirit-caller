/* func_02052b50: thunk — `func_02052ac0` with r1 = 1. */

extern int func_02052ac0(int a, int b, int c, int d);

int func_02052b50(int a, int _unused, int c, int d) {
    return func_02052ac0(a, 1, c, d);
}
