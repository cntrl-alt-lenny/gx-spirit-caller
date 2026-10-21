void func_ov006_021cab6c(char *self, int x, int y, int *out) {
    int i, count;
    out[0] = 0;
    out[1] = 0;
    count = *(int *)(self + 0x60);
    for (i = 0; i < count; i++) {
        int cx = *(int *)(self + 0x78) + (*(int *)(self + 0x58) * 8) / 2;
        int cy = *(int *)(self + 0x7c) + *(int *)(self + 0x5c) * 8 - 22;
        cx += ((1 - count + i * 2) * 64) / 2;
        if (x >= cx - 28 && y >= cy - 12 && x <= cx + 28 && y <= cy + 12) {
            out[0] = 1;
            out[1] = i;
            return;
        }
    }
    out[0] = 0;
}

