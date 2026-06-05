/* func_0201f0f4: bounds-checked table lookup. Recipe: the orig mixes a SIGNED
 * low bound (cmp #0; blt) with an UNSIGNED high bound (ldrCC) -> express as
 * `a0 >= 0 && (unsigned)a0 < N`, not the all-signed `a0 >= 0 && a0 < N`. */
extern int data_020c63bc[];
extern char data_020c6484[];

int func_0201f0f4(int a0) {
    if (a0 >= 0 && (unsigned)a0 < 23) return data_020c63bc[a0];
    return (int)data_020c6484;
}
