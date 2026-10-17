int func_0209b55c(unsigned int bcd) {
    int result = 0;
    int i;
    int shift;
    int mul;
    int s2;
    int j;
    for (i = 0, shift = 0; i < 8; i++, shift += 4) {
        if (((bcd >> shift) & 0xf) >= 10) {
            return 0;
        }
    }
    mul = 1;
    for (j = 0, s2 = 0; j < 8; j++, s2 += 4) {
        result += mul * ((bcd >> s2) & 0xf);
        mul *= 10;
    }
    return result;
}