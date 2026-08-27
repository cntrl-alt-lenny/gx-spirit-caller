/* func_0206c43c: lock a sub-object's embedded mutex (obj+0xe0), reset
 * some state, fetch a pair of values via func_02070bf8, stash them into
 * a's out-pointers, set a status flag bit, then unlock.
 */

struct S0206c4b0_obj {
    unsigned char pad_00[0xf8];
    int field_f8; /* 0xf8 */
};

struct S0206c4b0_ctx {
    unsigned char pad_00[0x64];
    struct S0206c4b0_obj *field_64; /* 0x64 */
    unsigned char pad_68[0x70 - 0x68];
    short field_70;                   /* 0x70 */
};

struct S0206c4b0 {
    unsigned char pad_00[0x4];
    struct S0206c4b0_ctx *field_4; /* 0x4 */
    unsigned char pad_08[0x10 - 0x08];
    unsigned short field_10;         /* 0x10 */
    unsigned char pad_12[0x14 - 0x12];
    unsigned short *field_14;          /* 0x14 */
    int *field_18;                       /* 0x18 */
};

extern void func_020926d0(void *mutex);
extern void func_02070e90(int a0, int a1, int a2);
extern void func_02070d6c(void);
extern int func_02070bf8(unsigned short *out1, int *out2);
extern void func_02092660(void *mutex);

int func_0206c43c(struct S0206c4b0 *a) {
    struct S0206c4b0_ctx *ctx = a->field_4;
    struct S0206c4b0_obj *obj = ctx->field_64;
    unsigned short local1;
    int local2;
    int result;

    func_020926d0((char *)obj + 0xe0);
    func_02070e90(a->field_10, 0, 0);
    func_02070d6c();
    obj->field_f8 = 0;
    result = func_02070bf8(&local1, &local2);
    *a->field_14 = local1;
    *a->field_18 = result;
    ctx->field_70 |= 4;
    func_02092660((char *)obj + 0xe0);
    return 0;
}
