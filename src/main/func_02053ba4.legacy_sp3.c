void *func_02053ba4(void *key, char *base, int n, int size, int (*cmp)(void *, void *)) {
    int i;

    for (i = 0; i < n; i++) {
        if (cmp(key, base + i * size) == 0) {
            return base + size * i;
        }
    }
    return 0;
}
