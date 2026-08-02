struct Arg {
    unsigned char field_0;
    signed char field_1;
    signed char field_2;
    char _pad3;
    int field_4;
    int field_8;
};

extern void func_02033b10(struct Arg *arg0, int arg1, int arg2, int idx, int arg3);

void func_02033c24(struct Arg *arg0, int arg1, int arg2, int arg3) {
    if (arg0->field_0 == 0) return;

    if (arg0->field_4 != 0) goto L_a4;

    {
        signed char count = arg0->field_2;
        signed char i = 0;
        signed char idx = arg0->field_1;

        if (count > 0) {
            do {
                func_02033b10(arg0, arg1, arg2, idx, arg3);
                idx = (signed char)(idx + 1);
                if (arg2 <= idx) {
                    idx = 0;
                    arg0->field_4 = arg0->field_8;
                }
                i = (signed char)(i + 1);
            } while (arg0->field_2 > i);
        }

        arg0->field_1 = idx;
        return;
    }

L_a4:
    arg0->field_4 = arg0->field_4 - 1;
}
