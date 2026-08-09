extern char data_020ffb5c[];
extern char data_020ffb04[];
extern void func_020a6d54(char *file, char *fmt, int a2, int a3);
extern void func_02054314(void *p, int i);
extern void func_020453b4(void *p);

void func_02054148(void *p) {
    int i;

    if (!p) {
        func_020a6d54(data_020ffb5c, data_020ffb04, 0, 0x69);
    }
    for (i = 0; i < *(int *)p; i++) {
        func_02054314(p, i);
    }
    func_020453b4(*(void **)((char *)p + 0x14));
    func_020453b4(p);
}
