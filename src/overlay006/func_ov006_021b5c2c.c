extern void Fill32(unsigned int value, void *dest, int size);
extern void Copy32(void *src, void *dest, int size);
extern char data_ov006_0224f448[];
extern char data_02105a4c[];
/* Original caller passes base although the current callee C definition takes void. */
extern int func_ov006_021b8d30(char *base);
extern int func_ov006_021b8de0(char *base);
extern int func_ov006_021b8a88(char *base);
extern int func_ov006_021b8bf4(char *base);
extern int func_ov006_021b7c94(int unused, int idx, unsigned short value);
/* Original caller passes signed -1; callee stores its low halfword. */
extern int func_ov006_021b7cc0(int unused, int i, int j, int v);
extern int func_ov006_021b7b78(void *p);
int func_ov006_021b5c2c(char *base) {
    int i;
    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(base);
    func_ov006_021b8de0(base);
    func_ov006_021b8a88(base);
    func_ov006_021b8bf4(base);
    Copy32(data_02105a4c, base, 0x124);
    func_ov006_021b7c94((int)base, 0, 0);
    func_ov006_021b7c94((int)base, 1, 1);
    func_ov006_021b7c94((int)base, 2, 1);
    func_ov006_021b7c94((int)base, 3, 1);
    func_ov006_021b7c94((int)base, 4, 1);
    for (i = 0; i < 5; i++) {
        func_ov006_021b7cc0((int)base, i, 0, -1);
        func_ov006_021b7cc0((int)base, i, 1, -1);
        func_ov006_021b7cc0((int)base, i, 2, -1);
        func_ov006_021b7cc0((int)base, i, 3, -1);
        func_ov006_021b7cc0((int)base, i, 4, -1);
        func_ov006_021b7cc0((int)base, i, 5, -1);
        func_ov006_021b7cc0((int)base, i, 6, -1);
    }
    func_ov006_021b7b78(base);
    for (i = 0; i < 5; i++)
        ((unsigned short *)(base + 0x8174))[i] = ((unsigned short *)(base + 0x816a))[i];
    return 1;
}


