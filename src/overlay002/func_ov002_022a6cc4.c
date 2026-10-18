extern int func_ov002_022a6d1c(char *self);

int func_ov002_022a6cc4(char *self) {
    if (*(int *)(self + 0x578) != 0) {
        return 1;
    }
    if (*(int *)(self + 0x5c0) != 0) {
        return 1;
    }
    if (*(int *)(self + 0x5e8) != 0) {
        return 1;
    }
    if (*(int *)(self + 0x620) == 4 && *(int *)(self + 0x624) < 0x100) {
        return 1;
    }
    return func_ov002_022a6d1c(self);
}
