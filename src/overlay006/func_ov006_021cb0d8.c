/* func_ov006_021cb0d8: copy a 13-word record into dst+0x14 and stash a scalar
 * at dst+0x48; return 1. */
int func_ov006_021cb0d8(int *dst, int *src, int v) {
    dst[5]  = src[0];
    dst[6]  = src[1];
    dst[7]  = src[2];
    dst[8]  = src[3];
    dst[9]  = src[4];
    dst[10] = src[5];
    dst[11] = src[6];
    dst[12] = src[7];
    dst[13] = src[8];
    dst[14] = src[9];
    dst[15] = src[10];
    dst[16] = src[11];
    dst[17] = src[12];
    dst[18] = v;
    return 1;
}
