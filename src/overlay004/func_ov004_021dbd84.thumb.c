#pragma thumb on
unsigned func_ov004_021dbd84(unsigned x) {
    return ((x << 24) & 0xFF000000) | (((x << 8) & 0x00FF0000) |
           (((x >> 24) & 0xFF) | ((x >> 8) & 0x0000FF00)));
}
