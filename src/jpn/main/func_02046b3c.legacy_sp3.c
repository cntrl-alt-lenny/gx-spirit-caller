extern void *data_0219da0c;
extern int func_02045230(void);
extern void func_02048fc4(int a, void *b, int c);
extern void func_02065dcc(void);
extern void func_0204664c(int a);
extern void func_020624bc(int a);
extern char data_020ff828[];

int func_02046b3c(void) {
    char *obj;
    int kind;

    if (data_0219da0c == 0) {
        goto fail;
    }
    if (func_02045230() != 0) {
        goto fail;
    }

    obj = (char *)data_0219da0c;
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

    func_02048fc4(1, data_020ff828, 0);
    func_02065dcc();
    func_0204664c(3);
    return 1;

has_flag:
    *(char *)(obj + 0x2d) = 1;
    func_020624bc(*(int *)data_0219da0c);
    *(char *)((char *)data_0219da0c + 0x2d) = 0;
    return 0;
}
