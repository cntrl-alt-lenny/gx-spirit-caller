extern char data_020ffa7c[];
extern char data_020ffa24[];
extern void func_020a6c60(char *file, char *fmt, int a2, int a3);
extern void func_020542a0(void *p, int i);
extern void func_02045364(void *p);

void func_020540d4(void *p) {
    int i;

    if (!p) {
        func_020a6c60(data_020ffa7c, data_020ffa24, 0, 0x69);
    }
    for (i = 0; i < *(int *)p; i++) {
        func_020542a0(p, i);
    }
    func_02045364(*(void **)((char *)p + 0x14));
    func_02045364(p);
}
