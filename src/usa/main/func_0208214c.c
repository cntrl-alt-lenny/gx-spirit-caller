/* func_0208214c: frameless-leaf pack -> global+148 (default tier). */
extern char data_021a17d8[];
void func_0208214c(int a0, int a1, int a2) {
    *(int *)(data_021a17d8 + 148) = a0 | (a1 << 16) | ((a2 != 0) << 15);
}
