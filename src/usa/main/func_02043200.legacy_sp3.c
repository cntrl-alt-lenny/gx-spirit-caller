extern char *data_0219d910;
extern void *data_0219d91c;
extern void func_02041e50(void);
extern void func_02040384(void);
extern void func_02091a0c(void *p);

void func_02043200(void) {
    if (data_0219d910 == 0) {
        return;
    }
    if (data_0219d91c != 0) {
        func_02041e50();
    }
    func_02040384();
    if (*(int *)(data_0219d910 + 0x1188) != 0) {
        func_02091a0c(data_0219d910 + 0x111c);
    }
    *(int *)(data_0219d910 + 0x1004) = -7;
}
