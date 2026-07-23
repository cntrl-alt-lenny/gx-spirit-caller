extern int *data_021a981c;
extern int func_020a3a2c(int a0);

int func_020a3a08(int a0) {
    *(int *)((char *)data_021a981c + 0x1000 + 0x320) = 1;
    return func_020a3a2c(a0);
}
