/* func_0202162c: C23-noMMIO — base + index*0x618 (default tier). */
extern char data_02194340[];
extern char data_02194374[];
char *func_0202162c(void) {
    return data_02194374 + *(int *)(data_02194340 + 4) * 0x618;
}
