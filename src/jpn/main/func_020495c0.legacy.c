/* func_020495c0: guarded dual-store through a pointer global (re-read between
 * stores). Clone of func_02046bf4 (offsets 0x54/0x58). Legacy mwcc 1.2/sp2p3
 * predicates the stores; 2.0 branches. Keep the `if (!g) return 0;` form so
 * the `moveq r0,#0` schedules right after the compare. */
extern char *data_0219dba0;

int func_020495c0(int a0, int a1) {
    if (!data_0219dba0) return 0;
    *(int *)(data_0219dba0 + 0x54) = a0;
    *(int *)(data_0219dba0 + 0x58) = a1;
    return 1;
}
