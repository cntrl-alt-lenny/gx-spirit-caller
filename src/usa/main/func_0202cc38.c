/* func_0202cc38: write `r0` to data->f_28, set data->f_2c = 1. */

extern char data_0219ac68[];

void func_0202cc38(int v) {
    *(int *)(data_0219ac68 + 0x28) = v;
    *(int *)(data_0219ac68 + 0x2c) = 1;
}
