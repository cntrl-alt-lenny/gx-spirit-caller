/* func_ov002_022628e4: chain of independent gate checks on player `a`,
 * then (if the func_ov002_021c3ae4 fast-path fails) a fallback check on
 * the OTHER player (1 - a) via func_ov002_021bae7c.
 */
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021bbf50(int a);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_021c3ae4(int a, int b);
extern int func_ov002_021bae7c(int a, int b, int c);
extern char data_ov002_022cf178[];

int func_ov002_022628e4(int a) {
    int other;

    if (func_ov002_021b3ecc(a, 11, 0x14ff) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf178 + (a & 1) * 0x868) != 0)
        return 0;
    if (func_ov002_021bbf50(a) != 0)
        return 0;
    if (func_ov002_021bcf00(a) != 0)
        return 0;

    other = 1 - a;
    if (func_ov002_021c3ae4(other, 0x14ff) != 0)
        goto success;
    if (func_ov002_021bae7c(other, 0x14ff, -1) == 0)
        return 0;
success:
    return 1;
}
