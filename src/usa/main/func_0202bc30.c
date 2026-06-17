/* func_0202bc30: test bit a1 of the byte table indexed by func_0202b060(a0). */
extern unsigned char data_02105dd8[];
extern int func_0202b060(int);
int func_0202bc30(int a0, int a1){
    return (data_02105dd8[func_0202b060(a0)] & (1 << a1)) ? 1 : 0;
}
