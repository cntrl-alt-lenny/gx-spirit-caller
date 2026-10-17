unsigned int func_02097d60(const unsigned char *s, int n) {
    unsigned int result = 0;
    if (n <= 3) {
        int i = 0;
        if (n > 0) {
            int shift = 0;
            do {
                unsigned int c = s[i];
                unsigned int t;
                if (c == 0) {
                    break;
                }
                t = c - 'A';
                if (t <= 'Z' - 'A') {
                    c = t + 'a';
                } else {
                    c = t + 'A';
                }
                i++;
                result |= c << shift;
                shift += 8;
            } while (i < n);
        }
    }
    return result;
}
