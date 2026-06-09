#pragma thumb on
extern int func_ov004_021dc154(void *ctx);
void func_ov004_021dc19c(void *ctx, unsigned char *dst, unsigned char *src, unsigned int len) {
    unsigned int i;
    for (i = 0; i < len; i++) {
        unsigned char k = func_ov004_021dc154(ctx);
        dst[i] = k ^ src[i];
    }
}
