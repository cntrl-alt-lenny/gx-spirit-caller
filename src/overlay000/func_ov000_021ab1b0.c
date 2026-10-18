unsigned func_ov000_021ab1b0(unsigned x) {
    x = ((x & 0xaaaaaaaa) >> 1) + (x & 0x55555555);
    x = ((x & 0xcccccccc) >> 2) + (x & 0x33333333);
    x = ((x & 0xf0f0f0f0) >> 4) + (x & 0x0f0f0f0f);
    x = ((x & 0xff00ff00) >> 8) + (x & 0x00ff00ff);
    return ((x & 0xffff0000) >> 16) + (x & 0x0000ffff);
}

