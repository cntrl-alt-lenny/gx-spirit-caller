/* func_02049634: guarded dual-store through a pointer global (re-read between
 * stores). Clone of func_02046c60 (offsets 0x54/0x58). Legacy mwcc 1.2/sp2p3
 * predicates the stores; 2.0 branches. Keep the `if (!g) return 0;` form so
 * the `moveq r0,#0` schedules right after the compare. */
extern char *data_0219dc80;

int func_02049634(int a0, int a1) {
    if (!data_0219dc80) return 0;
    *(int *)(data_0219dc80 + 0x54) = a0;
    *(int *)(data_0219dc80 + 0x58) = a1;
    return 1;
}
