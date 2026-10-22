char *func_020a6a28(char *text, const char *pattern) {
    int i = 0;
    int j;
    while (text[i] != 0) {
        for (j = 0; pattern[j] != 0 && text[i + j] == pattern[j]; j++) {
        }
        if (pattern[j] == 0) {
            return text + i;
        }
        i++;
    }
    return 0;
}
