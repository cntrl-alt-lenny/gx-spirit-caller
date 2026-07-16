typedef unsigned short u16;

u16 func_ov020_021adaac(int h, int s, int v) {
    int hh = h * 6;
    int F = hh % 360;
    int sector = ((h << 8) / 60) >> 8;

    int VAL1 = (v * (255 - s)) / 255;
    int VAL4 = (v * (255 - (s * F) / 360)) / 255;
    int VAL7 = (v * (255 - (s * (360 - F)) / 360)) / 255;

    int r0, r1, r3;
    r1 = VAL1;

    switch (sector) {
    case 0: r0 = v;    r3 = VAL7; break;
    case 1: r0 = VAL4; r3 = v;    break;
    case 2: r0 = VAL1; r3 = v;    r1 = VAL7; break;
    case 3: r0 = VAL1; r3 = VAL4; r1 = v;    break;
    case 4: r0 = VAL7; r3 = VAL1; r1 = v;    break;
    case 5: r0 = v;    r3 = VAL1; r1 = VAL4; break;
    default: r0 = 0; r3 = 0; r1 = 0; break;
    }

    if (r0 > 255) r0 = 255;
    if (r3 > 255) r3 = 255;
    if (r1 > 255) r1 = 255;

    return (u16)(((r0 >> 3) & 0x1f) | ((r3 << 2) & 0x3e0) | ((r1 << 7) & 0x7c00));
}
