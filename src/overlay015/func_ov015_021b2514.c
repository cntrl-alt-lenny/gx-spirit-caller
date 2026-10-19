static inline void set_rect(short *p, int x1, int y1, int x2, int y2) {
    p[0] = x1;
    p[1] = y1;
    p[2] = x2;
    p[3] = y2;
}
void func_ov015_021b2514(void *arg0, int mode, int x, int y) {
    char *p = arg0;
    switch (mode) {
    case 0:
        set_rect((short *)(p + 0x3c), x, y, x + 0x18, y + 0x14);
        break;
    case 1:
        set_rect((short *)(p + 0x44), x, y, x + 0x18, y + 0x14);
        break;
    case 2: {
        int top, right, bottom, left;
        top = *(short *)(p + 0x42);
        right = *(short *)(p + 0x48);
        bottom = *(short *)(p + 0x46) + 4;
        left = *(short *)(p + 0x3c);
        set_rect((short *)(p + 0x34), left, top, right, bottom);
        left = *(short *)(p + 0x3c);
        top = *(short *)(p + 0x42);
        set_rect((short *)(p + 0x4c), left, top, left + 0x18, top + 0x15);
        left = *(short *)(p + 0x44);
        top = *(short *)(p + 0x46);
        set_rect((short *)(p + 0x54), left, top - 0x11, left + 0x18, top + 4);
        *(int *)(p + 4) = 0;
        *(int *)(p + 8) = *(short *)(p + 0x56) - *(short *)(p + 0x4e);
        *(int *)(p + 0x10) = *(short *)(p + 0x4e);
        break;
    }
    }
}



