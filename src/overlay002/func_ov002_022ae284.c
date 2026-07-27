extern int func_ov002_0225929c(void);

int func_ov002_022ae284(int a) {
    int result = func_ov002_0225929c();
    switch (result) {
        case 2:
        case 3:
            return a;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
            return 1;
        case 0:
        case 1:
        case 9:
        case 10:
        default:
            return 0;
    }
}
