/* func_0200bf4c: byte-identical clone of func_0200bef4 (separate TU). See
 * that file for the shape comment. Returns the index 0..6 of the set bit
 * in {0x8, 0x10, 0x20, 0x40, 0x80, 0x100, 0x200}, or 7 if no match.
 */

int func_0200bf4c(int x) {
    if (x == 0x008) return 0;
    if (x == 0x010) return 1;
    if (x == 0x020) return 2;
    if (x == 0x040) return 3;
    if (x == 0x080) return 4;
    if (x == 0x100) return 5;
    if (x == 0x200) return 6;
    return 7;
}
