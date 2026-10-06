extern char data_02101554[];
extern int func_020aaddc(const char *s);

void func_02064db0(char **str, int *len) {
    if (*str == 0) {
        *str = data_02101554;
        *len = 0;
        return;
    }
    if (*len == -1) {
        *len = func_020aaddc(*str) + 1;
    }
}
