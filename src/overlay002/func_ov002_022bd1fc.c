extern int func_02037208(int a, int b, int c, int d);

int func_ov002_022bd1fc(char *self) {
    int state = *(int *)(self + 0xc60);
    switch (state) {
    case 0:
        func_02037208(0x33, -1, 0, 1);
        *(int *)(self + 0xce0) = *(int *)(self + 0xc58);
        *(int *)(self + 0xcdc) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1: {
        int v = *(int *)(self + 0xc64);
        if (v > 8) {
            v = 0x10 - v;
        }
        *(int *)(self + 0xcdc) = (v << 8) / 8;
        if (*(int *)(self + 0xc64) >= 0x10) {
            *(int *)(self + 0xc60) = 2;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    }
    case 2:
        *(int *)(self + 0xcdc) = 0;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    default:
        break;
    }
    *(int *)(self + 0xc64) = *(int *)(self + 0xc64) + 1;
    return 1;
}
