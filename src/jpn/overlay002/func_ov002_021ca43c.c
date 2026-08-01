extern int func_ov002_021baf88(int a);
extern int func_ov002_021bad9c(int player, int code, int arg);

int func_ov002_021ca43c(int unused) {
    int flags = 0;
    if (func_ov002_021baf88(0x1332) != 0) {
        return 1;
    }
    if (func_ov002_021baf88(0x1a27) != 0) {
        return 1;
    }
    if (func_ov002_021baf88(0x1a1a) != 0) {
        return 1;
    }
    if (func_ov002_021baf88(0x1a33) != 0) {
        flags |= 2;
    }
    if (func_ov002_021bad9c(0, 0x1444, -1) != 0) {
        flags |= 4;
    }
    if (func_ov002_021bad9c(1, 0x1444, -1) != 0) {
        flags |= 8;
    }
    return flags;
}
