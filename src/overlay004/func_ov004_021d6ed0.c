typedef struct {
    char padding[0xb6c];
    int index;
} CallbackState;
extern CallbackState data_021040ac;
extern int (*data_ov004_0220a0ac[])(void);

int func_ov004_021d6ed0(void) {
    int (*callback)(void);
    callback = data_ov004_0220a0ac[data_021040ac.index];
    if (callback != 0) {
        if (callback() != 0) {
            data_021040ac.index++;
        }
        return 0;
    }
    return 1;
}
