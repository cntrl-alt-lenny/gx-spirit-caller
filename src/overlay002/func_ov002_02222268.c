struct ce288 {
    char pad[0x5a8];
    int f5a8;
    int f5ac;
};
extern struct ce288 data_ov002_022ce288;
extern int func_ov002_021e104c();

int func_ov002_02222268(int *p) {
    switch (data_ov002_022ce288.f5a8) {
    case 0x80:
        data_ov002_022ce288.f5ac = p[5];
    case 0x7f:
        if (data_ov002_022ce288.f5ac == 0) {
            return 0;
        }
        func_ov002_021e104c((unsigned)(*(unsigned short *)((char *)p + 2) << 31) >> 31, 1);
        data_ov002_022ce288.f5ac -= 1;
        return 0x7f;
    default:
        return 0;
    }
}
