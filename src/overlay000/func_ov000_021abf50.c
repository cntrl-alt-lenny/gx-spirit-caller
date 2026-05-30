/* func_ov000_021abf50: frameless-leaf 16-bit insert (gotcha 16 + shift form). */
void func_ov000_021abf50(int *p, int a1) {
    unsigned t = (unsigned short)a1;
    p[2] = (p[2] & 0xffff0000u) | ((t << 16) >> 16);
}
