/* func_ov006_021bd864: clamp obj[19] to a range chosen by obj[16]; return 1 if
 * it was clamped. */
int func_ov006_021bd864(int *obj) {
    int changed = 0;
    int lo, hi;
    if (obj[16] == 0 || obj[16] == 3) { lo = 1; hi = 3; }
    else { lo = 0; hi = 2; }
    if (obj[19] < lo) { obj[19] = lo; changed = 1; }
    else if (obj[19] > hi) { obj[19] = hi; changed = 1; }
    return changed;
}
