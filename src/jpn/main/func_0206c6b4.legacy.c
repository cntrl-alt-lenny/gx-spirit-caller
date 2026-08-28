extern int func_0206e430(int a0);

int func_0206c6b4(char *a0) {
    if (func_0206e430((int)a0) != 0) {
        return -0x1c;
    }

    int flag = 0;
    if (a0 != 0) {
        flag = (*(short *)(a0 + 0x70) & 0x1) != 0;
    }
    if (!flag) {
        return -0x27;
    }

    if (*(short *)(a0 + 0x70) & 0x2) {
        return -0x1c;
    }

    signed char b = *(signed char *)(a0 + 0x73);
    int flag2 = 1;
    if (b != 0) {
        if (b != 4) {
            flag2 = 0;
        }
    }
    if (!flag2) {
        return -0x1c;
    }

    if (*(signed char *)(a0 + 0x72) == 1) {
        return 0;
    }
    return -0x6;
}
