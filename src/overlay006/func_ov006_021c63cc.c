int func_ov006_021c63cc(char *self) {
    int *row = (int *)((self + 0x6c) + *(int *)(self + 0x4c) * 0x10);
    int changed = 0;
    if (row[0] < 0) {
        changed = 1;
        while (row[0] < 0) {
            row[0]++;
            row[1]--;
        }
    }
    if (row[0] >= 6) {
        changed = 1;
        while (row[0] >= 6) {
            row[0]--;
            row[1]++;
        }
    }
    return changed;
}
