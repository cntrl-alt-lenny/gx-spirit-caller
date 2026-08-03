/* func_ov006_021c1bb4: lazily allocate two resources (fields 0x8 / 0x0),
 * release two others (fields 0xc / 0x4), clear two fields (0x68 / 0x6c),
 * then run five module setup passes; return 1. */
extern void *func_02021174(void *p);
extern void func_02021428(void);
extern void func_02021278(void *p);
extern void func_ov006_021c30c4(char *obj);
extern void func_ov006_021c3278(char *obj);
extern void func_ov006_021c4468(char *obj);
extern void func_ov006_021c45b4(char *obj);
extern void func_ov006_021c465c(char *obj);
extern char data_020fb4e0[];
extern char data_020fbd80[];

int func_ov006_021c1bb4(char *obj) {
    *(void **)(obj + 0x68) = 0;
    *(void **)(obj + 0x6c) = 0;
    if (*(void **)(obj + 0x8) == 0) {
        *(void **)(obj + 0x8) = func_02021174(data_020fb4e0);
        func_02021428();
    }
    if (*(void **)(obj + 0xc) != 0) {
        func_02021278(*(void **)(obj + 0xc));
        *(void **)(obj + 0xc) = 0;
    }
    if (*(void **)(obj + 0x4) != 0) {
        func_02021278(*(void **)(obj + 0x4));
        *(void **)(obj + 0x4) = 0;
    }
    if (*(void **)(obj + 0x0) == 0) {
        *(void **)(obj + 0x0) = func_02021174(data_020fbd80);
        func_02021428();
    }
    func_ov006_021c30c4(obj);
    func_ov006_021c3278(obj);
    func_ov006_021c4468(obj);
    func_ov006_021c45b4(obj);
    func_ov006_021c465c(obj);
    return 1;
}
