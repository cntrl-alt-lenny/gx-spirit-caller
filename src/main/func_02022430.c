extern int func_020224c0(int a, int mode, int c);

int func_02022430(int a, unsigned flags, int c, int b) {
    int v = func_020224c0(a, 1, c);
    if (flags & 1) {
        if (v == b) {
            return 1;
        }
    }
    if (flags & 2) {
        if (v != b) {
            return 1;
        }
    }
    if (flags & 4) {
        if (v > b) {
            return 1;
        }
    }
    if (flags & 8) {
        if (v < b) {
            return 1;
        }
    }
    if (flags & 0x10) {
        if (v & b) {
            return 1;
        }
    }
    if (flags & 0x20) {
        if (!(v & b)) {
            return 1;
        }
    }
    return 0;
}
