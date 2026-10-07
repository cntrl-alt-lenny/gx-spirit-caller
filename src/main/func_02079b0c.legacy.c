/* func_02079b0c: compare two arrays of n halfwords from the last element
 * down; 1, -1 or 0. */
int func_02079b0c(unsigned short *a, unsigned short *b, int n) {
    int i;
    for (i = n - 1; i >= 0; i--) {
        if (a[i] > b[i]) {
            return 1;
        }
        if (a[i] < b[i]) {
            return -1;
        }
    }
    return 0;
}
