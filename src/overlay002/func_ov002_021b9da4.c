/* func_ov002_021b9da4: list-walk callback — if the node is type 0x1130, clamp
 * the accumulator *b down to the node's field-2 value. Always returns 0
 * (continue the walk). Paired with func_ov002_021b9dd4. */
int func_ov002_021b9da4(unsigned short *a, int *b) {
    if (*a == 0x1130) {
        unsigned short x = a[2];
        int v = *b;
        if (v >= x)
            v = x;
        *b = v;
    }
    return 0;
}
