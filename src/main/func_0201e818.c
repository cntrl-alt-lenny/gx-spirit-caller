/* func_0201e818: build a 2x2 scale-rotate matrix (Q12 fixed point) from an
 * angle-table index and two independent magnitudes.
 *
 * func_0208bf8c is shipped elsewhere as `void func_0208bf8c(void)` (it just
 * calls two sub-helpers for side effects), but this caller clearly treats
 * it as returning an int derived from its int argument (sets r0 before the
 * call, consumes r0 -- really r4/r0 -- after). Each TU is free to declare
 * its own extern prototype for a symbol; only the symbol name is shared at
 * link time, so this local prototype does not conflict with the other
 * file's void(void) one.
 *
 * data_020bef80 is already retyped elsewhere as an array of {short, short}
 * records; field0 grows from 0 (sin-like), field1 stays near 4096
 * (cos-like) -- both read via ldrsh (signed) here.
 */

extern const short data_020bef80[];
extern int func_0208bf8c(int x);

void func_0201e818(int a0, int a1, int a2, int *out) {
    int idx = a2 >> 4;
    int mag0 = func_0208bf8c(a0);
    int mag1 = func_0208bf8c(a1);
    int i2 = idx * 2;
    int sinv = data_020bef80[i2];
    int cosv = data_020bef80[i2 + 1];

    out[0] = (int)(((long long)cosv * mag0 + 0x800) >> 12);
    out[1] = (int)(((long long)sinv * mag0 + 0x800) >> 12);
    out[2] = -(int)(((long long)sinv * mag1 + 0x800) >> 12);
    out[3] = (int)(((long long)cosv * mag1 + 0x800) >> 12);
}
