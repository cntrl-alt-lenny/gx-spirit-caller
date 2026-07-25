extern int func_0203c838(void);
extern void func_0203c8b0(int);
extern int func_0203d838(void);
extern int func_0203d974(void);

int func_0203da90(void) {
    int v = func_0203c838();
    func_0203c8b0(0x10);
    switch (v) {
        case 7:
            v = func_0203d974();
            break;
        case 8:
            v = func_0203d838();
            break;
    }
    return v;
}
