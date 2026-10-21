int func_02001e5c(void *p) {
    signed char *s = *(signed char **)((char *)p + 0x28);
    int active = 0;
    if (s != 0) {
        active = *s != 0;
    }
    return active == 0;
}
