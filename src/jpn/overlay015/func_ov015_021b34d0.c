/* func_ov015_021b34d0: resolve a cell index to its absolute address — bail to 0
 * unless both the companion guard (+0xa94) and the table base (+0xa7c) are live,
 * then return base + table[idx*4]. (ov015_core.h) */
extern char data_ov015_021b5d08[];
extern char data_ov015_021b5d24[];
int func_ov015_021b34d0(int idx) {
    char *cell = data_ov015_021b5d24;
    int base;
    int *table;
    if (*(int *)(data_ov015_021b5d08 + 0xa94) == 0)
        return 0;
    base = *(int *)(cell + 0xa7c);
    if (base == 0)
        return 0;
    table = *(int **)(cell + 0xa78);
    return base + table[idx * 4];
}
