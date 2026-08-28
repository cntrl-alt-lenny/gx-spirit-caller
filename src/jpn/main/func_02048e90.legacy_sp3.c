/* func_02048e90: "has enough time elapsed since the stored tick" gate,
 * sibling of func_02055330.legacy_sp3.c / func_02054b9c.c (same
 * func_02092fc8 + func_020b3714(<<6, 0x82ea, 0) idiom, but this one also
 * diffs against a stored 64-bit field first and, on expiry, calls
 * func_02055f78 and restores the field).
 *
 *     r4 = data_0219dba0                    ; s
 *     D  = func_02092fc8()                    ; now
 *     field = *(s+0xc)  (64-bit)
 *     diff = (now - field) << 6
 *     result = func_020b3714(diff, 0x82ea, 0)   ; returns 64-bit here (r1 tested)
 *     if ((unsigned long long)result >= 300) {
 *         s->+0x8 += 1
 *         data_0219dba0->+0x4 -> func_02055f78()
 *         now = func_02092fc8()
 *         data_0219dba0->+0xc (64-bit) = now
 *     }
 *     return result_of_func_02055fec_or_0
 */

extern void *data_0219dba0;
extern long long func_02092fc8(void);
extern long long func_020b3714(int lo, int hi, unsigned int c, int d);
extern int func_02055f78(void **a0);

int func_02048e90(void) {
    int r5 = 0;
    void *s = data_0219dba0;
    long long now;
    long long field;
    long long diff;
    long long result;

    now = func_02092fc8();
    field = *(long long *)((char *)s + 0xc);
    diff = now - field;
    diff <<= 6;
    result = func_020b3714((int)diff, (int)(diff >> 32), 0x82ea, 0);

    if ((unsigned long long)result >= 300) {
        *(int *)((char *)s + 0x8) += 1;
        r5 = func_02055f78(*(void ***)((char *)data_0219dba0 + 4));
        now = func_02092fc8();
        *(long long *)((char *)data_0219dba0 + 0xc) = now;
    }
    return r5;
}
