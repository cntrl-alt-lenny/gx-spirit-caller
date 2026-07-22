int Strlen(char *s) {
    int i = 0;
    if (s[0] != 0) {
        do {
            i++;
        } while (s[i] != 0);
    }
    return i;
}
