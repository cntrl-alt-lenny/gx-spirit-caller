


extern void func_ov006_021b7cb0(void *p);
extern int  func_ov006_021b7b94(int unused, int idx, unsigned short value);
extern int  func_ov006_021b7bc0(int unused, int i, int j, int v);
extern void func_ov006_021b7ab0(void *p, int i);

int func_ov006_021b6150(char *p, int flag) {
    int i;

    func_ov006_021b7cb0(p);
    *(int *)(p + 0x629c) = (flag != 0);

    for (i = 0; i < 5; i++) {
        if (i != 0)
            continue;
        func_ov006_021b7b94((int)p, i, 1);
        func_ov006_021b7bc0((int)p, i, 0, -1);
        func_ov006_021b7bc0((int)p, i, 1, -1);
        func_ov006_021b7bc0((int)p, i, 2, -1);
        func_ov006_021b7bc0((int)p, i, 3, -1);
        func_ov006_021b7bc0((int)p, i, 4, -1);
        func_ov006_021b7bc0((int)p, i, 5, -1);
        func_ov006_021b7bc0((int)p, i, 6, -1);
        func_ov006_021b7ab0(p, i);
    }

    *(int *)(p + 0x6240) = flag;
    return 1;
}
