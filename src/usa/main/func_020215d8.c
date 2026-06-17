/* func_020215d8: C23-noMMIO — base + index*0x618 (default tier). */
extern char data_02194260[];
extern char data_02194294[];
char *func_020215d8(void) {
    return data_02194294 + *(int *)(data_02194260 + 4) * 0x618;
}
