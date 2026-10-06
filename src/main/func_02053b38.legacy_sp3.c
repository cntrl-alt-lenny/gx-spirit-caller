void *func_02053b38(void *key, char *base, int n, int size, int (*cmp)(void *, void *), int *found) {
    int lo = 0;
    int hi;
    int mid;
    int r;

    *found = 0;
    hi = n - 1;
    while (lo <= hi) {
        mid = (lo + hi) >> 1;
        r = cmp(base + mid * size, key);
        if (r == 0) {
            *found = 1;
        }
        if (r < 0) {
            lo = mid + 1;
        } else {
            hi = mid - 1;
        }
    }
    return base + lo * size;
}
