/* func_ov000_021ac508: frameless-leaf byte-insert (gotcha 16 + shift form). */
void func_ov000_021ac508(int *p, int a1, int a2) {
    unsigned char b1 = a1, b2 = a2;
    p[1] = (p[1] & ~0xff0000u) | (((unsigned)b1 << 24) >> 8);
    p[1] = (p[1] & ~0xff000000u) | ((unsigned)b2 << 24);
}
