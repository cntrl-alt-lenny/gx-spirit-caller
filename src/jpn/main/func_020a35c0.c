/* func_020a35c0: 2-deref read of u16 at offset 0xc. */

extern char *data_021a9818;
unsigned int func_020a35c0(void) {
    return *(unsigned short *)(data_021a9818 + 0xc);
}
