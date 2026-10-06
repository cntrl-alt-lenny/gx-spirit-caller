extern int func_02054c78(int a0, int a1, int a2, void *dst, int *countPtr);

int func_02055170(int sock) {
    int val;
    int len = 4;

    if (func_02054c78(sock, 0xffff, 0x1002, &val, &len) == -1) {
        return -1;
    }
    return val;
}
