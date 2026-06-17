/* func_0201f0a0: bounds-checked table lookup. Recipe: the orig mixes a SIGNED
 * low bound (cmp #0; blt) with an UNSIGNED high bound (ldrCC) -> express as
 * `a0 >= 0 && (unsigned)a0 < N`, not the all-signed `a0 >= 0 && a0 < N`. */
extern int data_020c62dc[];
extern char data_020c63a4[];

int func_0201f0a0(int a0) {
    if (a0 >= 0 && (unsigned)a0 < 23) return data_020c62dc[a0];
    return (int)data_020c63a4;
}
