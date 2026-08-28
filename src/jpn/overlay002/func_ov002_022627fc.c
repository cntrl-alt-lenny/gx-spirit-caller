/* func_ov002_022627fc: chain of independent gate checks on player `a`,
 * then (if the func_ov002_021c3a04 fast-path fails) a fallback check on
 * the OTHER player (1 - a) via func_ov002_021bad9c.
 */
extern int func_ov002_021b3dec(int a, int b, int c);
extern int func_ov002_021bbe70(int a);
extern int func_ov002_021bce20(int a);
extern int func_ov002_021c3a04(int a, int b);
extern int func_ov002_021bad9c(int a, int b, int c);
extern char data_ov002_022cf098[];

int func_ov002_022627fc(int a) {
    int other;

    if (func_ov002_021b3dec(a, 11, 0x14ff) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf098 + (a & 1) * 0x868) != 0)
        return 0;
    if (func_ov002_021bbe70(a) != 0)
        return 0;
    if (func_ov002_021bce20(a) != 0)
        return 0;

    other = 1 - a;
    if (func_ov002_021c3a04(other, 0x14ff) != 0)
        goto success;
    if (func_ov002_021bad9c(other, 0x14ff, -1) == 0)
        return 0;
success:
    return 1;
}
