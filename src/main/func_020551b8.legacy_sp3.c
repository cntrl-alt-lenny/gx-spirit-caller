extern int func_02054c64(int sock, int level, int name, void *val, int len);

int func_020551b8(int sock, int size) {
    return func_02054c64(sock, 0xffff, 0x1001, &size, 4) != -1;
}
