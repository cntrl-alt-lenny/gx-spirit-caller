extern void Fill32(unsigned int value, void *dst, int size);
extern char data_ov006_0224f448[];
/* The original caller passes an unused base argument to the void-parameter definition. */
extern int func_ov006_021b8d30();
extern int func_ov006_021b8a88(char *base);
extern int func_ov006_021b8bf4(char *base);
extern int func_ov006_021b7c94(char *base, int a, int b);
extern int func_ov006_021b7cc0(char *base, int a, int b, int c);
int func_ov006_021b5dec(char *base) {
    int i;
    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(base);
    func_ov006_021b8a88(base);
    func_ov006_021b8bf4(base);
    func_ov006_021b7c94(base, 0, 0);
    func_ov006_021b7c94(base, 1, 1);
    func_ov006_021b7c94(base, 2, 1);
    func_ov006_021b7c94(base, 3, 1);
    func_ov006_021b7c94(base, 4, 1);
    for (i = 0; i < 5; i++) {
        func_ov006_021b7cc0(base, i, 0, -1);
        func_ov006_021b7cc0(base, i, 1, -1);
        func_ov006_021b7cc0(base, i, 2, -1);
        func_ov006_021b7cc0(base, i, 3, -1);
        func_ov006_021b7cc0(base, i, 4, -1);
        func_ov006_021b7cc0(base, i, 5, -1);
        func_ov006_021b7cc0(base, i, 6, -1);
    }
    for (i = 0; i < 5; i++) {
        ((unsigned short *)(base + 0x8174))[i] = ((unsigned short *)(base + 0x816a))[i];
    }
    return 1;
}


