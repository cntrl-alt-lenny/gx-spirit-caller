/* func_02044328: popcount over 4 bytes of p, masked to 8 bits.
 * Inner (b >> j) & 1 with b promoted from unsigned char (positive) -> asr;
 * `if(... &1) count++` -> ands;addne. Return count & 0xff -> and r0,r4,#0xff. */

int func_02044328(unsigned char *p) {
    int count, i;

    for (count = i = 0; i < 4; i++) {
        unsigned char b = p[i];
        int j;
        for (j = 0; j < 8; j++) {
            if ((b >> j) & 1) count++;
        }
    }
    return count & 0xff;
}
