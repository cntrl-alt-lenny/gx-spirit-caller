/* func_02045780: rebuild a 2-callback + 2-byte registration struct and
 * hand it to func_0203cce8; two distinct early-exit guards.
 *
 *   if (data_0219d9f0 == 0) goto null_case;      -- branches to a block
 *                                                     physically at the
 *                                                     function's END (C-72)
 *   if (data_0219d9f0->field_4 != 1) return;         -- trivial predicated
 *                                                        early return
 *   memset(&localBuf, 0, 0xc);
 *   localBuf = { func_0204547c, func_0204543c,
 *                (u8)data_0219d9f0->field_8, (u8)data_0219d9f0->field_a };
 *   data_0219d9f0->field_4 = 2;
 *   if (func_0203cce8(&localBuf, 2) != 0) func_0204520c(9, ~5);
 *   return;
 * null_case:
 *   func_0204520c(9, ~3);
 */

struct S0219dad0 {
    unsigned char pad_00[0x4];
    unsigned short field_4; /* 0x4 */
    unsigned char pad_06[0x8 - 0x6];
    unsigned short field_8; /* 0x8 */
    unsigned short field_a; /* 0xa */
};

struct LocalBuf02045828 {
    void (*cb1)(int, int);
    void (*cb2)(int, int, int);
    unsigned char b1;
    unsigned char b2;
    unsigned char pad[2];
};

extern struct S0219dad0 *data_0219d9f0;
extern void func_02094500(void *ptr, int val, int count);
extern void func_0204547c(int arg0, int arg1);
extern void func_0204543c(int a, int b, int c);
extern int func_0203cce8(void *buf, int flag);
extern void func_0204520c(int a0, int a1);

void func_02045780(void) {
    struct LocalBuf02045828 localBuf;

    if (data_0219d9f0 == 0) {
        goto null_case;
    }
    if (data_0219d9f0->field_4 != 1) {
        return;
    }

    func_02094500(&localBuf, 0, 0xc);
    localBuf.b1 = (unsigned char)data_0219d9f0->field_8;
    localBuf.b2 = (unsigned char)data_0219d9f0->field_a;
    localBuf.cb1 = func_0204547c;
    localBuf.cb2 = func_0204543c;
    data_0219d9f0->field_4 = 2;

    if (func_0203cce8(&localBuf, 2) != 0) {
        return;
    }
    func_0204520c(9, ~5);
    return;

null_case:
    func_0204520c(9, ~3);
}
