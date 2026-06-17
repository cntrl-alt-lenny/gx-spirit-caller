/* func_02046bf4: guarded dual-store clone of func_020495c0 (offsets
 * 0x90/0x94). Legacy mwcc 1.2/sp2p3; `if (!g) return 0;` form (see clone). */
extern char *data_0219da0c;

int func_02046bf4(int a0, int a1) {
    if (!data_0219da0c) return 0;
    *(int *)(data_0219da0c + 0x90) = a0;
    *(int *)(data_0219da0c + 0x94) = a1;
    return 1;
}
