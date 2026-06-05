/* func_020340e0: inclusive range test [0x7918,0x7cff] on the 2nd param (wave-1
 * recipe: tested value in r1 => unused leading arg). */
int func_020340e0(int a0, int a1){
    if (a1 >= 0x7918 && a1 <= 0x7cff) return 1;
    return 0;
}
