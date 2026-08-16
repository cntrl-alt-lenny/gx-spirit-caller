/* func_ov006_021b6d1c: leaf jump-table dispatcher (0-4) computing a
 * (base,row) pointer pair from `p` and `flag`, then returns
 * *(unsigned short *)(row + idx*4). No default case in source -- an
 * out-of-range `sel` falls through with `row` left as the raw `sel`
 * value reinterpreted as a pointer (matches target's register reuse). */
unsigned short func_ov006_021b6d1c(char *p, int sel, int idx, int flag) {
    char *row;
    switch (sel) {
    case 0:
        p = p + 0x198;
        row = p + 0x9800;
        break;
    case 1:
        if (flag != 0) { p = p + 0x158; row = p + 0xb400; }
        else { p = p + 0x358; row = p + 0xb000; }
        break;
    case 2:
        if (flag != 0) p = p + 0x358;
        else p = p + 0x158;
        row = p + 0xb800;
        break;
    case 3:
        if (flag != 0) { p = p + 0x158; row = p + 0xc000; }
        else { p = p + 0x358; row = p + 0xbc00; }
        break;
    case 4:
        if (flag != 0) { p = p + 0x158; row = p + 0xc400; }
        else { p = p + 0x58; row = p + 0xc400; }
        break;
    default:
        row = (char *)sel;
        break;
    }
    return *(unsigned short *)(row + idx * 4);
}
