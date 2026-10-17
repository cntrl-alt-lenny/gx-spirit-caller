extern int func_020070dc(char *);
int func_02007104(char *a, char *b) {
    int lb, i;
    int j; int bad; char c0; int n; char *p;
    lb = func_020070dc(b);
    n = func_020070dc(a) - lb + 1;
    i = 0;
    if (n > 0) {
        c0 = *b;
        do {
            p = a + i;
            if (c0 == a[i]) {
                bad = 0;
                j = 0;
                if (lb > 0) {
                    do {
                        if (*p != b[j]) { bad = 1; break; }
                        j++;
                        p++;
                    } while (j < lb);
                }
                if (bad == 0) return i;
            }
            i++;
        } while (i < n);
    }
    return -1;
}
