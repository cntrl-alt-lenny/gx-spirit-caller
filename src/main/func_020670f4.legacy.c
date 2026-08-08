int func_020670f4(int c) {
    if ((unsigned int)c < 0x1a) {
        return (c + 0x41) & 0xff;
    }
    if ((unsigned int)c < 0x34) {
        return (c + 0x47) & 0xff;
    }
    if ((unsigned int)c < 0x3e) {
        return (c - 4) & 0xff;
    }
    if (c == 0x3e) {
        return 0x2b;
    }
    if (c == 0x3f) {
        return 0x2f;
    }
    return 0;
}
