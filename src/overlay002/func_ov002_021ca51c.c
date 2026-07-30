extern int func_ov002_021bb068(int a);
extern int func_ov002_021bae7c(int player, int code, int arg);

int func_ov002_021ca51c(int unused) {
    int flags = 0;
    if (func_ov002_021bb068(0x1332) != 0) {
        return 1;
    }
    if (func_ov002_021bb068(0x1a27) != 0) {
        return 1;
    }
    if (func_ov002_021bb068(0x1a1a) != 0) {
        return 1;
    }
    if (func_ov002_021bb068(0x1a33) != 0) {
        flags |= 2;
    }
    if (func_ov002_021bae7c(0, 0x1444, -1) != 0) {
        flags |= 4;
    }
    if (func_ov002_021bae7c(1, 0x1444, -1) != 0) {
        flags |= 8;
    }
    return flags;
}
