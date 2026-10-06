extern signed char *data_0219ecc4;

signed char *func_02068890(signed char *s, int delim) {
    signed char *start;
    int c;

    if (s != 0) {
        data_0219ecc4 = s;
    }
    start = data_0219ecc4;
    while ((c = *data_0219ecc4) != 0 && c != delim) {
        data_0219ecc4++;
    }
    if (data_0219ecc4 == start) {
        start = 0;
    }
    if (c == 0) {
        return start;
    }
    *data_0219ecc4++ = 0;
    return start;
}
