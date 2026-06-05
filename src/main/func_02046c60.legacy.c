/* func_02046c60: guarded dual-store clone of func_02049634 (offsets
 * 0x90/0x94). Legacy mwcc 1.2/sp2p3; `if (!g) return 0;` form (see clone). */
extern char *data_0219daec;

int func_02046c60(int a0, int a1) {
    if (!data_0219daec) return 0;
    *(int *)(data_0219daec + 0x90) = a0;
    *(int *)(data_0219daec + 0x94) = a1;
    return 1;
}
