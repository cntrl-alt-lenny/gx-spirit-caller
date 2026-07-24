/* func_ov006_021b6d00: region-selected u16 field, sibling shape to
 * func_ov006_021b6ca0's `*(short *)(base + idx * 2 + 24692)` case. */
unsigned short func_ov006_021b6d00(char *base, int idx, int flag) {
    if (flag)
        return *(unsigned short *)(base + idx * 2 + 0xc66c);
    return *(unsigned short *)(base + idx * 2 + 0xc662);
}
