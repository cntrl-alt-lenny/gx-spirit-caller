void func_ov000_021ab01c(int *r, int *g, int *b, int h, int s, int v)
{
    int f, p, q, t;

    if (s < 0) s = 0;
    if (s > 0x1000) s = 0x1000;
    if (v < 0) v = 0;
    if (v > 0x1000) v = 0x1000;
    h %= 0x168000;
    if (h < 0) h += 0x168000;
    h /= 60;
    f = h & 0xfff;
    p = (int)((((long long)v * (0x1000 - s) + 0x800) >> 12) << 8);

    t = (int)(((long long)v * (0x1000 - (int)(((long long)s * f + 0x800) >> 12)) + 0x800) >> 12);
    t <<= 8;
    q = (int)(((long long)v * (0x1000 - (int)(((long long)s * (0x1000 - f) + 0x800) >> 12)) + 0x800) >> 12);



    q <<= 8;
    v *= 255;
    switch ((h & 0x7ffff000) >> 12) {
    case 0: *r = v; *g = q; *b = p; break;
    case 1: *r = t; *g = v; *b = p; break;
    case 2: *r = p; *g = v; *b = q; break;
    case 3: *r = p; *g = t; *b = v; break;
    case 4: *r = q; *g = p; *b = v; break;
    case 5: *r = v; *g = p; *b = t; break;
    }
}







