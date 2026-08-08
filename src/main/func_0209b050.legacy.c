extern int func_0209b16c(int x);

int func_0209b050(int mode) {
    int val;
    switch (mode) {
    case 1:
        val = 1;
        break;
    case 3:
        val = 2;
        break;
    case 2:
        val = 3;
        break;
    default:
        val = 0;
        break;
    }
    if (val == 0) {
        return 0xffff;
    }
    return func_0209b16c(val);
}
