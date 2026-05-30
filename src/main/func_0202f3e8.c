/* func_0202f3e8: frameless-leaf const-compare -> switch defeats predication (gotcha/brief 266). */
int func_0202f3e8(int a0) {
    switch (a0) {
    case 0x1a53:
    case 0x1a5c:
        return 1;
    }
    return 0;
}
