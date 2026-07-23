extern int *data_021a98fc;
extern int func_020a3b20(int a0);

int func_020a3afc(int a0) {
    *(int *)((char *)data_021a98fc + 0x1000 + 0x320) = 1;
    return func_020a3b20(a0);
}
