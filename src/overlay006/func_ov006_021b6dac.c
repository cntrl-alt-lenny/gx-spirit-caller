/* func_ov006_021b6dac: 5-way jump-table dispatch on sel (0-4, else no-op)
 * adding a per-case (and per-flag) offset pair to base, then reading a byte
 * from base[idx*4 + 2]. Leaf, no signal for tier — default tried first.
 *
 *     cmp   r1, #0x4
 *     addls pc, pc, r1, lsl #0x2
 *     b     .L_114
 *     b     .L_b0
 *     ...
 *     bx    lr
 */

int func_ov006_021b6dac(char *base, int sel, int idx, int flag) {
    switch (sel) {
    case 0:
        base += 0x198;
        base += 0x9800;
        break;
    case 1:
        if (flag != 0) {
            base += 0x158;
            base += 0xb400;
        } else {
            base += 0x358;
            base += 0xb000;
        }
        break;
    case 2:
        if (flag != 0) {
            base += 0x358;
        } else {
            base += 0x158;
        }
        base += 0xb800;
        break;
    case 3:
        if (flag != 0) {
            base += 0x158;
            base += 0xc000;
        } else {
            base += 0x358;
            base += 0xbc00;
        }
        break;
    case 4:
        if (flag != 0) {
            base += 0x158;
            base += 0xc400;
        } else {
            base += 0x58;
            base += 0xc400;
        }
        break;
    }
    return *(unsigned char *)(base + idx * 4 + 2);
}
