/* func_0202cc8c: write `r0` to data->f_28, set data->f_2c = 1. */

extern char data_0219ad48[];

void func_0202cc8c(int v) {
    *(int *)(data_0219ad48 + 0x28) = v;
    *(int *)(data_0219ad48 + 0x2c) = 1;
}
