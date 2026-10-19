int func_02033de8(int unused, int x) {
    if (x == 0x4e84 || (x >= 0x4e86 && x <= 0x4e8b) ||
        x == 0x4e8d || (x >= 0x4e8f && x <= 0x5207) ||
        (x >= 0xcb24 && x <= 0xcb82) ||
        (x >= 0xcb88 && x <= 0xcbe6) ||
        (x >= 0xcbec && x <= 0xcc4a) ||
        (x >= 0xcc4c && x <= 0xccaf) ||
        (x >= 0xcf08 && x <= 0xcf6b) ||
        (x >= 0xcf6c && x <= 0xcfcf) ||
        (x >= 0xcfd0 && x <= 0xd033)) {
        return 1;
    }
    return 0;
}
