char *func_ov000_021adf18(char *str, int n, char *out) {
    int i;
    for (i = 0; i < n; i++) {
        int found = 0;
        while (str != 0 && !found) {
            char ch = *str;
            if (ch == 0) goto ret_empty;
            if (ch == 0xa) {
                found = 1;
            }
            goto p1_cont;
        ret_empty:
            *out = 0;
            return 0;
        p1_cont:
            str++;
        }
    }

    {
        int done = 0;
        while (str != 0 && !done) {
            char ch = *str;
            switch (ch) {
            case 0:
            case 0xa:
                *out = 0;
                done = 1;
                break;
            default:
                str++;
                *out++ = ch;
                break;
            }
        }
    }
    return str;
}
