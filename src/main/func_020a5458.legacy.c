extern unsigned char *data_021a98f8;

int func_020a5458(void) {
    int result = 0;
    int ready = 0;
    int active = 0;
    unsigned char *p = data_021a98f8;
    if (*(unsigned short *)(p + 0x528) == 1 && p[0x50c] == 0)
        active = 1;
    if (active && *(unsigned short *)(p + 0x526) == 0)
        ready = 1;
    if (ready && *(unsigned short *)(p + 0x52a) != 0)
        result = 1;
    return result;
}
