extern int func_ov002_021ca43c(int a, int b);

int func_ov002_021ca55c(int a, int b) {
    int flags = func_ov002_021ca43c(a, b);
    if (flags & 1) {
        return 0;
    }
    if ((flags & 2) && b != 0) {
        return 0;
    }
    if (flags & 4) {
        if (a == 0) {
            return 0;
        }
    }
    if (flags & 8) {
        if (a == 1) {
            return 0;
        }
    }
    return 1;
}
