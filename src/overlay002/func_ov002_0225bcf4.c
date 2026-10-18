struct G {
    int f0;
    char pad[0x18];
    int f1c;
};
extern struct G data_ov002_022cd3f4;
extern int func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_0225bcf4(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    if (sum <= 4 && func_ov002_021bc8c8(data_ov002_022cd3f4.f0, arg0, sum) != 0) {
        if (arg0 != data_ov002_022cd3f4.f0 || data_ov002_022cd3f4.f1c != sum)
            return 0x800;
    }
    return 0;
}
