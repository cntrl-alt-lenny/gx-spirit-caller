struct Arg {
    char _pad0[0x34];
    int field_34;
    int field_38;
    int field_3c;
    char field_40[1];
};

extern int  func_02032638(void);
extern int  func_020338a8(void);
extern int  func_02031e58(void);
extern int  func_0203215c(int a, void *buf40, int arg1);
extern int  func_020325f0(void);
extern int  func_02033808(void);
extern int  func_020338f4(int a, int field_3c, void *buf40, int f38);

int func_02034338(struct Arg *arg0, int arg1) {
    int chk;
    arg0->field_34 = 0;
    func_02032638();
    chk = func_020338a8();
    if (chk == 0) return chk;

    if (arg0->field_3c != 0) goto L_6c;
    {
        int a = func_02031e58();
        arg0->field_38 = func_0203215c(a, arg0->field_40, arg1);
    }
    if (arg0->field_38 == 0) goto L_6c;
    if (func_020325f0() != 0) {
        arg0->field_3c = 1;
        goto L_6c;
    }
    func_02032638();
    arg0->field_3c = func_02033808();

L_6c:
    {
        int f38 = arg0->field_38;
        if (f38 != 0) {
            int result;
            int a = func_02032638();
            result = func_020338f4(a, arg0->field_3c, arg0->field_40, f38);
            arg0->field_3c = arg0->field_3c & ~result;
        }
    }

    arg0->field_34 = 1;
    return 1;
}
