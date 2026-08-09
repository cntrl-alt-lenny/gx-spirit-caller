extern void *data_0219daec;
extern int func_02045280(void);
extern void func_02049038(int a, void *b, int c);
extern void func_02065e40(void);
extern void func_020466f4(int a);
extern void func_02062530(int a);
extern char data_020ff908[];

int func_02046ba8(void) {
    char *obj;
    int kind;

    if (data_0219daec == 0) {
        goto fail;
    }
    if (func_02045280() != 0) {
        goto fail;
    }

    obj = (char *)data_0219daec;
    kind = *(int *)(obj + 0x24);
    if (kind == 5) {
        goto success;
    }
    if (kind == 6) {
        goto success;
    }

fail:
    return -1;

success:
    if (*(unsigned char *)(obj + 0x361) != 0) {
        goto has_flag;
    }

    func_02049038(1, data_020ff908, 0);
    func_02065e40();
    func_020466f4(3);
    return 1;

has_flag:
    *(char *)(obj + 0x2d) = 1;
    func_02062530(*(int *)data_0219daec);
    *(char *)((char *)data_0219daec + 0x2d) = 0;
    return 0;
}
