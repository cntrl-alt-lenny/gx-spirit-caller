/* func_02082210: frameless-leaf pack -> global+152 (default tier). */
extern char data_021a18b8[];
void func_02082210(int a0, int a1, int a2) {
    *(int *)(data_021a18b8 + 152) = a0 | (a1 << 16) | ((a2 != 0) << 15);
}
