extern void func_02094c94(int cmd, int packed, int b, int param, int value);

void func_02094e90(int a0, int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9) {
    func_02094c94(14, a0 | (a8 << 16), a2, a5 | ((a6 << 24) | (a7 << 22)), a4 | ((a3 << 26) | (a1 << 24) | (a9 << 16)));
}
