/* func_020057c8: write 2 bytes to global+0xb5e/0xb5f. */

extern char data_021040ac[];
void func_020057c8(int a, int b) {
    data_021040ac[0xb5e] = (char)a;
    data_021040ac[0xb5f] = (char)b;
}
