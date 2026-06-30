extern char data_020fd960[];
extern int  func_02021174(void *);
extern void func_02021278(void);
extern void func_02021428(void);
extern void func_02022228(int a, void *p);
extern int  func_ov006_021c6d34(void *p, int a, int b);
extern int  func_ov006_021c6e94(void *p, int a);
extern int  func_ov006_021c6eec(void *p);
extern int  func_ov006_021c7004(void *p);
extern int  func_ov006_021c70d4(void *p, int a);
extern int  func_ov006_021c71bc(void *p);
extern int  func_ov006_021c73d4(void *p);

struct Ov006Obj6c80 {
    int  f_0;
    char pad4[0x38 - 0x4];
    int  f_38, f_3c;
    char pad40[0x58 - 0x40];
    int  f_58;
};

int func_ov006_021c6c80(struct Ov006Obj6c80 *obj, int arg1) {
    obj->f_3c = arg1;
    if (arg1 != 0) {
        func_ov006_021c6eec(obj);
        func_ov006_021c7004(obj);
        func_ov006_021c71bc(obj);
        func_ov006_021c70d4(obj, 0);
        func_ov006_021c6e94(obj, 1);
        func_ov006_021c73d4(obj);
        if (obj->f_0 == 0) {
            obj->f_0 = func_02021174(data_020fd960);
            func_02021428();
            func_ov006_021c6d34(obj, obj->f_38, 1);
        }
        func_02022228(0, &obj->f_58);
    } else {
        if (obj->f_0 != 0) {
            func_02021278();
            obj->f_0 = 0;
        }
        func_ov006_021c6e94(obj, 0);
    }
    return 1;
}
