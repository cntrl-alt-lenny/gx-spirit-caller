/* func_02047d74: register two sub-object addresses, stamp a 64-bit
 * timestamp + active flag, then hand the object off to func_02055dec;
 * on failure (func_02047f44 result == 0) overwrite field_4 with d.
 *
 * func_02055dec's return value chains directly into func_02047f44's
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

extern struct S0219dc78 *data_0219db98;
extern void func_020aad04(void *self, int val);
extern long long func_02092fc8(void);
extern int func_02055dec(int a, void *b, void *c, int d, int e, int f, int g);
extern int func_02047f44(int param);

void func_02047d74(int a, int b, int c, int d) {
    func_020aad04((char *)data_0219db98 + 0x48, a);
    func_020aad04((char *)data_0219db98 + 0x148, b);

    data_0219db98->field_34 = func_02092fc8();
    data_0219db98->field_30 = 1;

    if (func_02047f44(func_02055dec(data_0219db98->field_0,
                                     (char *)data_0219db98 + 0x48,
                                     (char *)data_0219db98 + 0x148,
                                     1, 0, c, 0)) == 0) {
        data_0219db98->field_4 = d;
    }
}
