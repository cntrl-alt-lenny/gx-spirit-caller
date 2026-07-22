extern int func_02032634(void);
extern void func_02031e80(void);
extern int func_02031e90(void);
extern int func_02046ac4(void);

int func_02032644(void) {
    switch (func_02032634()) {
    case 1:
        func_02031e80();
        return func_02031e90();
    case 2:
        return func_02046ac4();
    default:
        return 0;
    }
}
