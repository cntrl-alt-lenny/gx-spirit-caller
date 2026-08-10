/* func_02074938: call func_020749d4(a0) unless both ctx->f_824 and
 * ctx->f_456 are set; if both are set, return f_828-f_82c. Otherwise fall
 * into a secondary state check returning -1 or 0.
 */

typedef struct {
    char _pad0[0x455];
    unsigned char f_455;
    unsigned char f_456;
    char _pad457[0x824 - 0x457];
    int f_824;
    int f_828;
    int f_82c;
} ctx_t;

typedef struct {
    char _pad0[8];
    unsigned char f_8;
    char _pad9[3];
    ctx_t *f_c;
} a0_t;

extern void func_020749d4(a0_t *a0);

int func_02074938(a0_t *a0) {
    ctx_t *ctx = a0->f_c;
    if (ctx->f_824 == 0 || ctx->f_456 == 0) {
        func_020749d4(a0);
    }
    if (ctx->f_824 != 0) {
        if (ctx->f_456 != 0) {
            return ctx->f_828 - ctx->f_82c;
        }
    }
    if (ctx->f_824 != 0) {
        goto ret0;
    }
    if (a0->f_8 != 4) {
        goto retm1;
    }
    if (ctx->f_455 != 9) {
        goto ret0;
    }
retm1:
    return -1;
ret0:
    return 0;
}
