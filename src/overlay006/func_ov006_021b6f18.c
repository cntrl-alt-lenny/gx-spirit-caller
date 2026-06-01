/* func_ov006_021b6f18: signed-halfword lookup into one of two parallel
 * arrays (104-byte rows, 2-byte cols), chosen by (arg3 && r) nonzero. */
short func_ov006_021b6f18(char *base, int r, int c, int alt) {
    if (alt != 0 && r != 0)
        return *(short *)(base + r * 104 + c * 2 + 0xc800 + 0x7e);
    return *(short *)(base + r * 104 + c * 2 + 0xc600 + 0x76);
}
