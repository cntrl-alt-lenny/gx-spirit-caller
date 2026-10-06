extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern unsigned int func_0203c888(void);
extern int func_0203ec1c(void);
extern int func_0203eb48(void);
extern void func_0203c89c(int a);
extern int func_0203dae0(void);
extern int func_0203e2f0(void);
extern int func_0203f094(void);
extern int func_0203de80(void);
extern int func_0203c730(void);
extern void func_0203c7d0(void);

int func_0203cc58(void) {
    unsigned int state;
    int saved;
    int r;

    state = func_0203c888();
    if (state == 1) {
        state = func_0203ec1c();
    } else if (state < 7) {
        saved = OS_DisableIrq();
        state = func_0203eb48();
        func_0203c89c(state);
        OS_RestoreIrq(saved);
    } else if (state < 9) {
        state = func_0203dae0();
    } else if (state < 10) {
        state = func_0203e2f0();
    } else if (state < 0x10) {
        state = func_0203f094();
    } else if (state == 0x11) {
        state = func_0203de80();
    }
    func_0203c89c(state);
    if (state == 0x10) {
        r = func_0203c730();
        func_0203c7d0();
        return r;
    }
    if (state != 0x12) {
        return 0;
    }
    func_0203c7d0();
    return -1;
}
