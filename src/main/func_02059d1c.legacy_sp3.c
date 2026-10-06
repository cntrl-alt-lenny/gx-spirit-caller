extern int func_020a991c(void);
extern char data_02100740[];

void func_02059d1c(char *out, int n) {
    int i;

    for (i = 0; i < n; i++) {
        out[i] = data_02100740[(unsigned int)func_020a991c() % 62];
    }
    out[i] = 0;
}
