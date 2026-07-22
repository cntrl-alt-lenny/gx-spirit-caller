char *Strchr(char *s, int c) {
    char ch = (char)c;
    char cur = *s++;
    while (cur != 0) {
        if (cur == ch) {
            return s - 1;
        }
        cur = *s++;
    }
    if (ch != 0) {
        return 0;
    }
    return s - 1;
}
