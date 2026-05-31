/* func_ov002_021b9144: event-code -> required-phase predicate (Cluster A
 * dispatcher). Switches on the event code arg0 (a dense 5772..5778 block, so
 * mwcc emits a jump table) and tests arg1 (the current phase) against the set
 * each code allows. */

int func_ov002_021b9144(int arg0, int arg1) {
    switch (arg0) {
    case 5772:
    case 5773:
    case 5775:
        return arg1 == 3;
    case 5776:
    case 5777:
        return arg1 == 2 || arg1 == 5;
    case 5774:
    case 5778: {
        unsigned int b = arg1 - 1;
        int r = 0;
        if (b > 5)
            return r;
        if ((1 << b) & 37)
            r = 1;
        return r;
    }
    default:
        return 0;
    }
}
