extern unsigned short data_020c3094[];
extern int data_021a6264;
extern int data_021a6260;
extern int func_0208cdec(void);

void func_0209002c(void) {
    int result = func_0208cdec();
    int idx = result >> 4;

    data_021a6264 = result;
    data_021a6260 = data_020c3094[idx] << 12;
}
