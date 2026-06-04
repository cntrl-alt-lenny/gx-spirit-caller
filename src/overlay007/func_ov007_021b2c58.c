/* func_ov007_021b2c58: open the cell at slot a1 with colour (a2,a3) and tag a4,
 * unless it is already open (a0+0x4). Load the cell's data file
 * (func_020211c8 on the [a1] row of data_021b30b8), bind its update callback
 * (func_02021650 with func_ov007_021b2ee4), draw it (func_ov007_021b2e00 with
 * the packed (a2|a3<<8) colour), and record the slot/colour/tag. Returns 1.
 */

extern int func_020211c8(void *a);
extern void func_0202147c(void);
extern void func_02021650(int a, void *b, void *c);
extern void func_ov007_021b2e00(char *a, int b, int c);
extern void func_ov007_021b2ee4(void);
extern char data_ov007_021b30b8[];

int func_ov007_021b2c58(char *a0, int a1, int a2, int a3, int a4) {
    if (*(int *)(a0 + 0x4) != 0) {
        return 1;
    }
    *(int *)(a0 + 0x4) = func_020211c8(*(int *)(data_ov007_021b30b8 + a1 * 0x20));
    func_0202147c();
    func_02021650(*(int *)(a0 + 0x4), func_ov007_021b2ee4, a0 + 0x4);
    func_ov007_021b2e00(a0, *(int *)(a0 + 0x4), (unsigned short)((a2 & 0xff) | ((unsigned char)a3 << 8)));
    *(int *)(a0 + 0x10) = a1;
    *(int *)(a0 + 0x14) = a2;
    *(int *)(a0 + 0x1c) = a4;
    *(int *)(a0 + 0x20) = 0;
    return 1;
}
