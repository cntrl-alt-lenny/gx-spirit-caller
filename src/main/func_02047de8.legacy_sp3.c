/* func_02047de8: register two sub-object addresses, stamp a 64-bit
 * timestamp + active flag, then hand the object off to func_02055e60;
 * on failure (func_02047fb8 result == 0) overwrite field_4 with d.
 *
 * func_02055e60's return value chains directly into func_02047fb8's
 * argument with no intervening reload -- write it as a nested call, not
 * through a temporary, to match.
 */

struct S0219dc78 {
    int field_0;                     /* 0x0 */
    int field_4;                     /* 0x4 */
    unsigned char pad_08[0x30 - 0x8];
    int field_30;                    /* 0x30 */
    long long field_34;              /* 0x34 */
};

extern struct S0219dc78 *data_0219dc78;
extern void func_020aadf8(void *self, int val);
extern long long func_020930b0(void);
extern int func_02055e60(int a, void *b, void *c, int d, int e, int f, int g);
extern int func_02047fb8(int param);

void func_02047de8(int a, int b, int c, int d) {
    func_020aadf8((char *)data_0219dc78 + 0x48, a);
    func_020aadf8((char *)data_0219dc78 + 0x148, b);

    data_0219dc78->field_34 = func_020930b0();
    data_0219dc78->field_30 = 1;

    if (func_02047fb8(func_02055e60(data_0219dc78->field_0,
                                     (char *)data_0219dc78 + 0x48,
                                     (char *)data_0219dc78 + 0x148,
                                     1, 0, c, 0)) == 0) {
        data_0219dc78->field_4 = d;
    }
}
