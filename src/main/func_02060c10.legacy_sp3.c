signed char *func_02060c10(signed char *s, int len) {
    signed char *p;
    int limit = len - 6;

    for (p = s; p - s < limit; p++) {
        if (p[0] == '\\' && p[1] == 'f' && p[2] == 'i' && p[3] == 'n' && p[4] == 'a' && p[5] == 'l' &&
            p[6] == '\\') {
            return p;
        }
    }
    return 0;
}
