/* func_ov002_0227dce4: membership test against 7 sparse ID values, compiled
 * by mwcc as a binary comparison tree (no stack frame, leaf). */
int func_ov002_0227dce4(int val) {
    switch (val) {
    case 0x1505:
    case 0x1644:
    case 0x186c:
    case 0x1958:
    case 0x19c1:
    case 0x1a4e:
    case 0x1a79:
        return 1;
    default:
        return 0;
    }
}
