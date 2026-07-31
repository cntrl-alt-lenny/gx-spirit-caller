/* func_ov006_021b6508: init sequence -- Fill32 a scratch buffer,
 * run several ov006 setup hooks, Copy32 in template data, then two
 * 5-iteration setup loops (func_ov006_021b843c and the
 * func_ov006_021b7c94/021b7cc0 x7/021b7bb0 chain), finally copies
 * self[0x8100+i*2+0x6a] to +0x74 for i=0..4. Always returns 1.
 */

extern void Fill32(int value, void *dest, int size);
extern void Copy32(void *src, void *dest, int size);
extern void func_ov006_021b8d30(void *self);
extern void func_ov006_021b8bf4(void *self);
extern void func_ov006_021b7cfc(void *self);
extern void func_ov006_021b7e80(void *self);
extern void func_ov006_021b843c(void *self, int a, int b);
extern void func_020124a4(int a, void *self);
extern void func_ov006_021b7c94(void *self, int a, int b);
extern void func_ov006_021b7cc0(void *self, int a, int b, int c);
extern void func_ov006_021b7bb0(void *self, int a);

extern char data_ov006_0224f448[];
extern char data_02105a4c[];

int func_ov006_021b6508(char *self) {
    int i, j;

    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(self);
    func_ov006_021b8bf4(self);
    Copy32(data_02105a4c, self, 0x124);
    func_ov006_021b7cfc(self);
    func_ov006_021b7e80(self);

    for (i = 0; i < 5; i++) {
        if (i != 0) func_ov006_021b843c(self, i, 0);
    }

    func_020124a4(0, self);
    func_ov006_021b7e80(self);

    for (i = 0; i < 5; i++) {
        func_ov006_021b7c94(self, i, 0);
        func_ov006_021b7cc0(self, i, 0, -1);
        func_ov006_021b7cc0(self, i, 1, -1);
        func_ov006_021b7cc0(self, i, 2, -1);
        func_ov006_021b7cc0(self, i, 3, -1);
        func_ov006_021b7cc0(self, i, 4, -1);
        func_ov006_021b7cc0(self, i, 5, -1);
        func_ov006_021b7cc0(self, i, 6, -1);
        func_ov006_021b7bb0(self, i);
    }

    for (j = 0; j < 5; j++) {
        ((unsigned short *)(self + 0x8100 + 0x74))[j] =
            ((unsigned short *)(self + 0x8100 + 0x6a))[j];
    }

    return 1;
}
