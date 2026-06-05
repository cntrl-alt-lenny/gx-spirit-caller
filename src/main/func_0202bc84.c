/* func_0202bc84: test bit a1 of the byte table indexed by func_0202b0b4(a0). */
extern unsigned char data_02105eb8[];
extern int func_0202b0b4(int);
int func_0202bc84(int a0, int a1){
    return (data_02105eb8[func_0202b0b4(a0)] & (1 << a1)) ? 1 : 0;
}
