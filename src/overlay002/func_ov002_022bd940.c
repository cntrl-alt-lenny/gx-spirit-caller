/* func_ov002_022bd940: small state machine over self's +0xc60 state
 * field and +0xc64 counter; state 2 resets +0xcc8/+0xc54 and returns 0
 * immediately, everything else falls to a shared counter++/return 1
 * tail. */
int func_ov002_022bd940(char *self) {
    int state = *(int *)(self + 0xc60);
    switch (state) {
    case 0:
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1:
        if (*(int *)(self + 0xc64) < 0x96) {
            break;
        }
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    case 2:
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    default:
        break;
    }
    *(int *)(self + 0xc64) = *(int *)(self + 0xc64) + 1;
    return 1;
}
