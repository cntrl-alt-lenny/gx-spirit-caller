int func_0206f170(char *str, char **out) {
    int value;
    unsigned char digit;
    *out = str;
    value = 0;
    for (;;) {
        digit = *(unsigned char *)str - '0';
        if (digit > 9) break;
        value = 10 * value + digit;
        str++;
        *out = str;
    }
    return value;
}
