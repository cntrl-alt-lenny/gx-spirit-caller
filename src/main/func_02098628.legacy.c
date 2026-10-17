extern int data_021a831c;
extern void func_0209bff4(unsigned short v);
extern void func_0209c014(unsigned short v);

int func_02098628(int unused, int cmd) {
    switch (cmd) {
    case 9:
        func_0209c014(data_021a831c);
        return 0;
    case 10:
        func_0209bff4(data_021a831c);
        return 0;
    case 1:
        return 4;
    default:
        return 8;
    }
}
