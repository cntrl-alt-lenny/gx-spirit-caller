/* func_0202b7b8: sentinel wrapper — idx==0 returns default string,
 * else call func_0202b778 with (idx + 0x226). Sibling of
 * func_0202b798; the shape uses add-add pair (0x26 + 0x200) rather
 * than a single add because 0x226 doesn't fit a rot-8 ARM immediate.
 */

extern char *data_020c69bc;
extern char *func_0202b778(int idx);

char *func_0202b7b8(int idx) {
    if (idx == 0) return (char *)&data_020c69bc;
    return func_0202b778(idx + 0x226);
}
