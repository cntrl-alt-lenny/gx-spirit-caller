extern int data_020b4768;
extern unsigned char data_02104f4c[];

void func_0202bb88(void) {
    int i;
    int n = data_020b4768;
    for (i = 0; i < n; i++) {
        data_02104f4c[0xf6c + i] &= ~8;
    }
}
