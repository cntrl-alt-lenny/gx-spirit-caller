/* func_0201e7c4: build a 2x2 scale-rotate matrix (Q12 fixed point) from an
 * angle-table index and two independent magnitudes.
 *
 * func_0208bea4 is shipped elsewhere as `void func_0208bea4(void)` (it just
 * calls two sub-helpers for side effects), but this caller clearly treats
 * it as returning an int derived from its int argument (sets r0 before the
 * call, consumes r0 -- really r4/r0 -- after). Each TU is free to declare
 * its own extern prototype for a symbol; only the symbol name is shared at
 * link time, so this local prototype does not conflict with the other
 * file's void(void) one.
 *
 * data_020bee8c is already retyped elsewhere as an array of {short, short}
 * records; field0 grows from 0 (sin-like), field1 stays near 4096
 * (cos-like) -- both read via ldrsh (signed) here.
 */

extern const short data_020bee8c[];
extern int func_0208bea4(int x);

void func_0201e7c4(int a0, int a1, int a2, int *out) {
    int idx = a2 >> 4;
    int mag0 = func_0208bea4(a0);
    int mag1 = func_0208bea4(a1);
    int i2 = idx * 2;
    int sinv = data_020bee8c[i2];
    int cosv = data_020bee8c[i2 + 1];

    out[0] = (int)(((long long)cosv * mag0 + 0x800) >> 12);
    out[1] = (int)(((long long)sinv * mag0 + 0x800) >> 12);
    out[2] = -(int)(((long long)sinv * mag1 + 0x800) >> 12);
    out[3] = (int)(((long long)cosv * mag1 + 0x800) >> 12);
}
