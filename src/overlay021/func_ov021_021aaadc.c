/* func_ov021_021aaadc: build the layout object — seed its geometry fields, open
 * the render stream onto the 020c78f0 resource, claim its OAM slot, enable the
 * sub-engine BG, run the first sub-build, then bump the row/col cursors and emit
 * the opening segment. (ov021_core.h) */
extern int  func_020211c8(void *);
extern void func_0202147c(void);
extern void *func_02021660(int, int, int);
extern void func_020216b0(void *, int, int);
extern void func_ov021_021aad5c(void *, int);
extern void func_ov021_021aadbc(void *);
extern void func_ov021_021aae68(void *, int, int);
extern char data_020c78f0[];
int func_ov021_021aaadc(void *o) {
    *(int *)((char *)o + 0x44) = 0xce;
    *(int *)((char *)o + 0x48) = 0;
    *(int *)((char *)o + 0x4c) = 0;
    *(int *)((char *)o + 0x50) = 0xc0;
    *(int *)((char *)o + 0x54) = 0;
    *(int *)((char *)o + 0x58) = 0;
    *(int *)((char *)o + 0x5c) = 0;
    *(int *)((char *)o + 0x60) = 0;
    *(int *)o = func_020211c8(data_020c78f0);
    func_0202147c();
    func_020216b0(func_02021660(*(int *)o, 4, 0), 0, 1);
    func_ov021_021aad5c(o, 1);
    func_ov021_021aadbc(o);
    {
        int row = *(int *)((char *)o + 0x48);
        int col;
        *(int *)((char *)o + 0x48) = row + 1;
        col = *(int *)((char *)o + 0x4c);
        *(int *)((char *)o + 0x4c) = col + 1;
        func_ov021_021aae68(o, col, row);
    }
    return 1;
}
