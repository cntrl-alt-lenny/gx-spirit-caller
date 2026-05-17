/* func_02052bc4: thunk — `func_02052b34` with r1 = 1. */

extern int func_02052b34(int a, int b, int c, int d);

int func_02052bc4(int a, int _unused, int c, int d) {
    return func_02052b34(a, 1, c, d);
}
