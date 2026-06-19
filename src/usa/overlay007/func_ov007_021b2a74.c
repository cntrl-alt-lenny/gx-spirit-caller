/* func_ov007_021b2a74: load the cell descriptor for value a1 into the OBJ at a0.
 * Resolve the descriptor row (func_ov007_021b2df0), open an OAM cell
 * (func_0202160c), and push its fields (geometry shorts at +2..+0xa/+0x12, flag
 * byte at +0x17) into the cell via func_0202165c. Returns 1.
 */

extern void func_020a9698(void *a, void *b, int c);
extern int func_020221f8(int a);
extern void func_020221e0(int a, int b);
extern int func_0202160c(int a, int b, int c);
extern short *func_ov007_021b2df0(void *a, int b);
extern void func_0202165c(int a, int b, int c);
extern char data_ov007_021b336c[];

int func_ov007_021b2a74(char *a0, int a1) {
    short *cfg;
    int h;
    func_020a9698(a0 + 0x24, data_ov007_021b336c, a1);
    func_020221e0(0, func_020221f8(0) | 0x2000);
    h = func_0202160c(*(int *)a0, 3, 2);
    cfg = func_ov007_021b2df0(a0, a1);
    func_0202165c(h, 0xe, cfg[1]);
    func_0202165c(h, 0xf, cfg[2]);
    func_0202165c(h, 0x3, cfg[3]);
    func_0202165c(h, 0x4, cfg[4]);
    func_0202165c(h, 0x5, cfg[5]);
    func_0202165c(h, 0xa, *(short *)((char *)cfg + 0x12));
    func_0202165c(h, 0xd, *(unsigned char *)((char *)cfg + 0x17));
    return 1;
}
