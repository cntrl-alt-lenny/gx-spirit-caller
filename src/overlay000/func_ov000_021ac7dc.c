/* func_ov000_021ac7dc: strlen (signed char, NULL-safe). */
int func_ov000_021ac7dc(signed char *s) {
    int n = 0;
    if (s == 0)
        return n;
    if (*s++ != 0) {
        signed char c;
        do {
            c = *s++;
            n++;
        } while (c != 0);
    }
    return n;
}
