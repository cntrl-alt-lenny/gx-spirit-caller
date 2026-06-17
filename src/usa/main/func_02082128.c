/* func_02082128: frameless-leaf pack -> global+152 (default tier). */
extern char data_021a17d8[];
void func_02082128(int a0, int a1, int a2) {
    *(int *)(data_021a17d8 + 152) = a0 | (a1 << 16) | ((a2 != 0) << 15);
}
