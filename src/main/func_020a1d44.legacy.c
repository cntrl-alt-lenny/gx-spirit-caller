extern char *data_021a98fc;
extern int func_020a099c(unsigned int x);

int func_020a1d44(unsigned int x) {
    if (data_021a98fc && func_020a099c(x)) {
        char *row = data_021a98fc + (x - 1) * 4;
        row = row + 0x1000;
        if (*(int *)(row + 0x4e8) == 7) return 1;
    }
    return 0;
}
