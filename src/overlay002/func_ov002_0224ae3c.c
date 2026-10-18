struct ce288 {
    char pad[0x494];
    int idx;
    unsigned short tbl[128];
};
extern struct ce288 data_ov002_022ce288;

int func_ov002_0224ae3c(int n, int target) {
    unsigned short v;

    for (; n >= 0; n--) {
        v = data_ov002_022ce288.tbl[(data_ov002_022ce288.idx + n) & 0x7f];
        if (v < target) {
            if (n != 0 && func_ov002_0224ae3c(n - 1, target - v) != 0) {
                return 1;
            }
        } else if (v == target) {
            return 1;
        }
    }
    return target == 0;
}
