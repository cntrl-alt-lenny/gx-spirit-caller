/* func_02048300: 2-deref read of word at offset 0x20. */

extern char *data_0219dc80;
int func_02048300(void) {
    return *(int *)(data_0219dc80 + 0x20);
}
