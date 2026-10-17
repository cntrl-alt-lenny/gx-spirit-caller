extern int func_0209b16c(int id, int a, int b);

int func_0209af84(int a0, int a1, int a2, int a3) {
    int id = 0;
    if (a0 == 0) {
        if (a1 == 1) {
            id = 6;
        }
        if (a1 == 0) {
            id = 7;
        }
    } else if (a0 == 1) {
        if (a1 == 1) {
            id = 4;
        }
        if (a1 == 0) {
            id = 5;
        }
    } else if (a0 == 2) {
        if (a1 == 1) {
            id = 8;
        }
        if (a1 == 0) {
            id = 9;
        }
    }
    if (id == 0) {
        return 0xffff;
    }
    return func_0209b16c(id, a2, a3);
}
