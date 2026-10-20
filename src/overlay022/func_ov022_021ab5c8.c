unsigned short func_ov022_021ab5c8(int h, int s, int v) {
    int f = (h * 6) % 360;
    int a = s * f / 360;
    int b = s * (360 - f) / 360;
    int p = v * (255 - s) / 255;
    int q = v * (255 - a) / 255;
    int t = v * (255 - b) / 255;
    int r, g, blue;
    switch (((h << 8) / 60) >> 8) {
    case 0: r = v; g = t; blue = p; break;
    case 1: r = q; g = v; blue = p; break;
    case 2: r = p; g = v; blue = t; break;
    case 3: r = p; g = q; blue = v; break;
    case 4: r = t; g = p; blue = v; break;
    case 5: r = v; g = p; blue = q; break;
    default: blue = g = r = 0; break;
    }
    if (r > 255) r = 255;
    if (g > 255) g = 255;
    if (blue > 255) blue = 255;
    return ((r >> 3) & 31) | ((g << 2) & 0x3e0) | ((blue << 7) & 0x7c00);
}

