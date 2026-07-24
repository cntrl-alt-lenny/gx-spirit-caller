int func_020465b0(unsigned char *arr, int count) {
    int mask = 0;
    int i;

    for (i = 0; i < count; i++) {
        mask |= 1 << arr[i];
    }
    return mask;
}
