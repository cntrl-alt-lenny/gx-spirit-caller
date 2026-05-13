/* func_0202b800: sentinel wrapper — idx==0 returns default string,
 * else call func_0202b778 with (idx + 0x23a). Sibling of
 * func_0202b798.
 */

extern char *data_020c69bc;
extern char *func_0202b778(int idx);

char *func_0202b800(int idx) {
    if (idx == 0) return (char *)&data_020c69bc;
    return func_0202b778(idx + 0x23a);
}
