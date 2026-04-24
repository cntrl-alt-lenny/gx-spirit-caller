/* func_0202b80c: sentinel wrapper — idx==0 returns default string,
 * else call func_0202b7cc with (idx + 0x226). Sibling of
 * func_0202b7ec; the shape uses add-add pair (0x26 + 0x200) rather
 * than a single add because 0x226 doesn't fit a rot-8 ARM immediate.
 */

extern char *data_020c6a9c;
extern char *func_0202b7cc(int idx);

char *func_0202b80c(int idx) {
    if (idx == 0) return (char *)&data_020c6a9c;
    return func_0202b7cc(idx + 0x226);
}
