struct Arg {
    char _pad0[0x34];
    int field_34;
    int field_38;
    int field_3c;
    char field_40[1];
};

extern int  func_0203268c(void);
extern int  func_020338f8(void);
extern int  func_02031eac(void);
extern int  func_020321b0(int a, void *buf40, int arg1);
extern int  func_02032644(void);
extern int  func_02033858(void);
extern int  func_02033944(int a, int field_3c, void *buf40, int f38);

int func_02034388(struct Arg *arg0, int arg1) {
    int chk;
    arg0->field_34 = 0;
    func_0203268c();
    chk = func_020338f8();
    if (chk == 0) return chk;

    if (arg0->field_3c != 0) goto L_6c;
    {
        int a = func_02031eac();
        arg0->field_38 = func_020321b0(a, arg0->field_40, arg1);
    }
    if (arg0->field_38 == 0) goto L_6c;
    if (func_02032644() != 0) {
        arg0->field_3c = 1;
        goto L_6c;
    }
    func_0203268c();
    arg0->field_3c = func_02033858();

L_6c:
    {
        int f38 = arg0->field_38;
        if (f38 != 0) {
            int result;
            int a = func_0203268c();
            result = func_02033944(a, arg0->field_3c, arg0->field_40, f38);
            arg0->field_3c = arg0->field_3c & ~result;
        }
    }

    arg0->field_34 = 1;
    return 1;
}
