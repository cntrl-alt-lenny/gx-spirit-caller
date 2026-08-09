/* func_02074b90: drain/reset a connection's pending buffer via
 * func_02075d74, falling back to func_02075ae8 + a retry poll loop
 * via func_02075928 when nothing is pending yet. *a is an out-param
 * for the remaining byte count / buffer position; the function itself
 * also returns a computed int.
 */

struct Ctx02074b90 {
    unsigned char pad_000[0x456];
    unsigned char field_456; /* 0x456 */
    unsigned char pad_457[0x824 - 0x457];
    void *field_824;           /* 0x824 */
    int field_828;               /* 0x828 */
    int field_82c;                 /* 0x82c */
};

struct S02074b90 {
    unsigned char pad_00[0xc];
    struct Ctx02074b90 *field_c; /* 0xc */
};

extern void (*data_0219ef0c)(void *);
extern int func_02075d74(void *a, int b, struct S02074b90 *conn);
extern void func_02075ae8(struct Ctx02074b90 *ctx, void *a);
extern int func_02075928(struct S02074b90 *param0);

int func_02074b90(int *a, struct S02074b90 *b) {
    struct Ctx02074b90 *ctx = b->field_c;

    if (ctx->field_824 != 0 && ctx->field_456 == 0) {
        if (func_02075d74((char *)ctx->field_824 + ctx->field_82c,
                           ctx->field_828 - ctx->field_82c, b) != 0) {
            data_0219ef0c(ctx->field_824);
            ctx->field_824 = 0;
            *a = 0;
            return 0;
        }
        func_02075ae8(ctx, ctx->field_824);
        if (ctx->field_456 == 0) {
            ctx->field_824 = 0;
        }
    }

    while (ctx->field_824 == 0) {
        int result2 = func_02075928(b);
        if (result2 == 9) {
            *a = 0;
            return 0;
        }
    }

    *a = ctx->field_828 - ctx->field_82c;
    return (int)ctx->field_824 + ctx->field_82c;
}
