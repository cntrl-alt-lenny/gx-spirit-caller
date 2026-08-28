/* func_02046e14: guard on func_02045230()==0 and data_0219da0c->f24==3,
 * then write 3 fields into *data_0219da0c (each a fresh reload of the
 * global — see func_0204664c.c's documented convention: writing
 * `data_0219da0c->field` as separate statements, not cached in a
 * local, reproduces one fresh load per statement), then dispatch via
 * func_02051310.
 *
 *     mov r7,r0; mov r6,r1; mov r5,r2; mov r4,r3
 *     if (func_02045230() != 0) return 0;
 *     if (data_0219da0c->f24 != 3) return 0;
 *     func_02046788();
 *     data_0219da0c->f88 = a1;
 *     data_0219da0c->f8c = a2;
 *     data_0219da0c->f2c = 0;
 *     func_0204664c();
 *     func_02051310((a0-1)&0xff, func_020461ac, 0, a3, a4);
 *     return 1;
 */

typedef struct {
    char _pad0[0x24];
    int f24;
    char _pad1[4];
    unsigned char f2c;
    char _pad2[0x88 - 0x2d];
    int f88;
    int f8c;
} Ctx02046e80;

extern Ctx02046e80 *data_0219da0c;
extern int func_02045230(void);
extern void func_02046788(void);
extern void func_0204664c(int arg);
extern void func_020461ac(void);
extern int func_02051310(int a, void (*cb)(void), int c, int d, int e);

int func_02046e14(int a0, int a1, int a2, int a3, int a4) {
    if (func_02045230() != 0) goto fail;
    if (data_0219da0c->f24 == 3) goto success;

fail:
    return 0;

success:
    func_02046788();
    data_0219da0c->f88 = a1;
    data_0219da0c->f8c = a2;
    data_0219da0c->f2c = 0;
    func_0204664c(5);

    func_02051310((a0 - 1) & 0xff, func_020461ac, 0, a3, a4);
    return 1;
}
