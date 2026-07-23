#pragma thumb on

extern void (*data_ov004_022923d4)(void *);

int func_ov004_021de264(void *arg0) {
    if (data_ov004_022923d4 != 0) {
        data_ov004_022923d4(arg0);
    }
    return 0;
}
