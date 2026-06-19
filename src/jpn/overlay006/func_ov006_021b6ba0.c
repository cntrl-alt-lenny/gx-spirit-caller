/* func_ov006_021b6ba0: guard via 021b6ad8, then return a region-selected field
 * (or -1). */
extern int func_ov006_021b69d8(void *a, int sel, int idx, int d);
int func_ov006_021b6ba0(char *base, int sel, int idx) {
    if (func_ov006_021b69d8(base, sel, idx, 0) == 0)
        return -1;
    switch (sel) {
    case 0: return idx;
    case 1: return *(short *)(base + idx * 2 + 24692);
    case 2:
    case 3:
    default: return -1;
    }
}
