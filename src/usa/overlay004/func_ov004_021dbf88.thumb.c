#pragma thumb on
extern int func_ov004_021dbf40(void *ctx);
void func_ov004_021dbf88(void *ctx, unsigned char *dst, unsigned char *src, unsigned int len) {
    unsigned int i;
    for (i = 0; i < len; i++) {
        unsigned char k = func_ov004_021dbf40(ctx);
        dst[i] = k ^ src[i];
    }
}
