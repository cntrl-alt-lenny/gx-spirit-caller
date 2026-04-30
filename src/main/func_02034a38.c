/* func_02034a38: thunk — `Task_PostLocked` with r2 = 0. */

extern int Task_PostLocked(int a, int b, int c, int d);

int func_02034a38(int a, int b, int _unused, int d) {
    return Task_PostLocked(a, b, 0, d);
}
