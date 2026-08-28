extern void func_02048040(int a, int b);

int func_02047f44(int param) {
    int r0val;
    int r2val;
    if (param == 0) {
        return 0;
    }
    switch (param) {
        case 1:
            r0val = 9;
            r2val = -1;
            break;
        case 2:
            r0val = 9;
            r2val = -2;
            break;
        case 3:
            r0val = 6;
            r2val = -10;
            break;
        case 4:
            r0val = 6;
            r2val = -20;
            break;
    }
    func_02048040(r0val, r2val + (int)0xffff11b8);
    return param;
}
