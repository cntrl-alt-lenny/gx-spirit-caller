/* func_0208c884: sign-magnitude encode into the u16 at *a0 — 0 -> 0, positive ->
 * v|0x4000, negative -> (-v)|0x8000. Legacy 1.2/sp2p3 (predicated strh chain). */
void func_0208c884(unsigned short *a0, int a1){
    if (a1 == 0) { *a0 = 0; return; }
    if (a1 > 0) { *a0 = a1 | 0x4000; return; }
    *a0 = (-a1) | 0x8000;
}
