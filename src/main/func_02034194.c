/* func_02034194: thunk — `Task_PostLocked` with r2 = 3. */

extern int Task_PostLocked(int a, int b, int c, int d);

int func_02034194(int a, int b, int _unused, int d) {
    return Task_PostLocked(a, b, 3, d);
}
