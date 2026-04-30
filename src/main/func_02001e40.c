/* func_02001e40: copy struct's f_8/f_c to *out1/*out2. */

void func_02001e40(void *p, int *out1, int *out2) {
    *out1 = *(int *)((char *)p + 0x8);
    *out2 = *(int *)((char *)p + 0xc);
}
