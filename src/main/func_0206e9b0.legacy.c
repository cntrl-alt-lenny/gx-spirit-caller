int func_0206e9b0(void *p, int action, int flags) {
    if (p == 0) return -1;
    switch (action) {
    case 3:
        return *(signed char *)((char *)p + 0x72) == 1 ? 0 : 4;
    case 4:
        if (flags & 4)
            *(signed char *)((char *)p + 0x72) = 0;
        else
            *(signed char *)((char *)p + 0x72) = 1;
        break;
    }
    return 0;
}
