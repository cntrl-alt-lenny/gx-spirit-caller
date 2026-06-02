/* func_ov006_021b6c30: guard via 021b6ad8, then return a region-selected field
 * (or 0). (021b6ca0 guard+switch shape.) */
extern int func_ov006_021b6ad8(void *a, int sel, int idx, int d);
int func_ov006_021b6c30(char *base, int sel, int idx) {
    if (func_ov006_021b6ad8(base, sel, idx, 0) == 0)
        return 0;
    switch (sel) {
    case 0: return *(short *)(base + idx * 2 + 24528);
    case 1: return *(short *)(base + idx * 2 + 24628);
    case 2: return 100;
    case 3:
    default: return 0;
    }
}
