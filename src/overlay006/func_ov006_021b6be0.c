/* func_ov006_021b6be0: select a sub-buffer pointer by region index. */
char *func_ov006_021b6be0(char *base, int sel, int idx) {
    switch (sel) {
    case 0: return base + 584 + idx * 292;
    case 1: return base + 15184 + idx * 292;
    case 2: return base;
    case 3: return base + 292;
    default: return 0;
    }
}
