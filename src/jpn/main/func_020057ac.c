/* func_020057ac: write 2 bytes to global+0xb5e/0xb5f. */

extern char data_02103fcc[];
void func_020057ac(int a, int b) {
    data_02103fcc[0xb5e] = (char)a;
    data_02103fcc[0xb5f] = (char)b;
}
