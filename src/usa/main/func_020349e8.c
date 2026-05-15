/* func_020349e8: thunk — `Task_PostLocked` with r2 = 0. */

extern int Task_PostLocked(int a, int b, int c, int d);

int func_020349e8(int a, int b, int _unused, int d) {
    return Task_PostLocked(a, b, 0, d);
}
