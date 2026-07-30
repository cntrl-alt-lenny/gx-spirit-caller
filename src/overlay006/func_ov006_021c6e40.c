extern char data_021040ac[];
extern char data_ov006_021ce19c[];
extern char data_ov006_021ce1b0[];

extern int  func_ov006_021c7110(void *p);
extern int  func_ov006_021c71e0(void *p, int a);
extern int  func_ov006_021c72c8(void *p);
extern int  func_02021660(int a, int b, int c);
extern void func_020216b0(int a, int b, int c);
extern void func_020a978c(void *dst, void *fmt, int val);

int func_ov006_021c6e40(int *self, int arg1, int arg2) {
    char *s = (char *)self;

    if (arg1 == *(int *)(s + 0x38) && arg2 == 0) {
        goto done;
    }

    *(int *)(s + 0x38) = arg1;
    func_ov006_021c7110(self);
    func_ov006_021c72c8(self);
    func_ov006_021c71e0(self, 0);

    if (self[0] == 0) {
        return 1;
    }

    {
        int flag = (*(int *)(s + 0x38) != 0) ? 1 : 0;
        int h = func_02021660(self[0], 3, 1);
        func_020216b0(h, 0, flag);
    }

    if (*(int *)(s + 0x38) == 0) {
        goto done;
    }

    {
        int h = func_02021660(self[0], 3, 2);
        func_020216b0(h, 2, 0);
        func_020216b0(h, 0, 0x201);

        {
            void *chosen = (*(int *)(data_021040ac + 0x34) == 0)
                ? (void *)data_ov006_021ce19c
                : (void *)data_ov006_021ce1b0;
            func_020a978c(s + 0x58, chosen, *(int *)(s + 0x38));
        }
    }

done:
    return 1;
}
