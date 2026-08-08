extern char *data_0219dc78;
extern void func_0204037c(void);
extern void func_020403d4(void);
extern void func_0204548c(int a, int b, int c);

void func_02048050(void) {
    if (*(int *)(data_0219dc78 + 0x24) != 0) {
        func_020403d4();
        func_0204037c();
        func_0204548c(0, *(int *)(data_0219dc78 + 0x24), 0);
        *(int *)(data_0219dc78 + 0x24) = 0;
    }
    data_0219dc78 = 0;
}
