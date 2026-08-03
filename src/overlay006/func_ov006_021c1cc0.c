/* func_ov006_021c1cc0: lazily allocate two resources (fields 0x8 / 0x0),
 * release two others (fields 0xc / 0x4), clear two fields (0x68 / 0x6c),
 * then run five module setup passes; return 1. */
extern void *func_020211c8(void *p);
extern void func_0202147c(void);
extern void func_020212cc(void *p);
extern void func_ov006_021c31d0(char *obj);
extern void func_ov006_021c3384(char *obj);
extern void func_ov006_021c4574(char *obj);
extern void func_ov006_021c46c0(char *obj);
extern void func_ov006_021c4768(char *obj);
extern char data_020fb5c0[];
extern char data_020fbe60[];

int func_ov006_021c1cc0(char *obj) {
    *(void **)(obj + 0x68) = 0;
    *(void **)(obj + 0x6c) = 0;
    if (*(void **)(obj + 0x8) == 0) {
        *(void **)(obj + 0x8) = func_020211c8(data_020fb5c0);
        func_0202147c();
    }
    if (*(void **)(obj + 0xc) != 0) {
        func_020212cc(*(void **)(obj + 0xc));
        *(void **)(obj + 0xc) = 0;
    }
    if (*(void **)(obj + 0x4) != 0) {
        func_020212cc(*(void **)(obj + 0x4));
        *(void **)(obj + 0x4) = 0;
    }
    if (*(void **)(obj + 0x0) == 0) {
        *(void **)(obj + 0x0) = func_020211c8(data_020fbe60);
        func_0202147c();
    }
    func_ov006_021c31d0(obj);
    func_ov006_021c3384(obj);
    func_ov006_021c4574(obj);
    func_ov006_021c46c0(obj);
    func_ov006_021c4768(obj);
    return 1;
}
