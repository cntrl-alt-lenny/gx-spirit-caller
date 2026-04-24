/* func_0202b854: sentinel wrapper — idx==0 returns default string,
 * else call func_0202b7cc with (idx + 0x23a). Sibling of
 * func_0202b7ec.
 */

extern char *data_020c6a9c;
extern char *func_0202b7cc(int idx);

char *func_0202b854(int idx) {
    if (idx == 0) return (char *)&data_020c6a9c;
    return func_0202b7cc(idx + 0x23a);
}
