typedef struct { char _0[0x18]; int table; } rec_02068b54_t;
extern signed char *func_02068890(signed char *s, int delim);
extern int func_020688fc(char *str);
extern void func_02068b54(rec_02068b54_t *rec, int name, int value);
extern signed char data_02101d5c[];

void func_0206880c(rec_02068b54_t *rec, signed char *s) {
    signed char *name;
    signed char *value;
    name = func_02068890(s + 1, 0x5c);
    if (name == 0) return;
    do {
        value = func_02068890(0, 0x5c);
        if (value == 0) value = data_02101d5c;
        if (func_020688fc((char *)name) != 0) {
            func_02068b54(rec, (int)name, (int)value);
        }
        name = func_02068890(0, 0x5c);
    } while (name != 0);
}
