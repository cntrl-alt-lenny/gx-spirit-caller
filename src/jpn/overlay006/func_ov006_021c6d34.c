extern char data_02103fcc[];
extern char data_ov006_021ce07c[];
extern char data_ov006_021ce090[];

extern int  func_ov006_021c7004(void *p);
extern int  func_ov006_021c70d4(void *p, int a);
extern int  func_ov006_021c71bc(void *p);
extern int  func_0202160c(int a, int b, int c);
extern void func_0202165c(int a, int b, int c);
extern void func_020a9698(void *dst, void *fmt, int val);

int func_ov006_021c6d34(int *self, int arg1, int arg2) {
    char *s = (char *)self;

    if (arg1 == *(int *)(s + 0x38) && arg2 == 0) {
        goto done;
    }

    *(int *)(s + 0x38) = arg1;
    func_ov006_021c7004(self);
    func_ov006_021c71bc(self);
    func_ov006_021c70d4(self, 0);

    if (self[0] == 0) {
        return 1;
    }

    {
        int flag = (*(int *)(s + 0x38) != 0) ? 1 : 0;
        int h = func_0202160c(self[0], 3, 1);
        func_0202165c(h, 0, flag);
    }

    if (*(int *)(s + 0x38) == 0) {
        goto done;
    }

    {
        int h = func_0202160c(self[0], 3, 2);
        func_0202165c(h, 2, 0);
        func_0202165c(h, 0, 0x201);

        {
            void *chosen = (*(int *)(data_02103fcc + 0x34) == 0)
                ? (void *)data_ov006_021ce07c
                : (void *)data_ov006_021ce090;
            func_020a9698(s + 0x58, chosen, *(int *)(s + 0x38));
        }
    }

done:
    return 1;
}
