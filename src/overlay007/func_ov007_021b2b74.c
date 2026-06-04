/* func_ov007_021b2b74: load the cell descriptor for value a1 into the OBJ at a0.
 * Resolve the descriptor row (func_ov007_021b2ef0), open an OAM cell
 * (func_02021660), and push its fields (geometry shorts at +2..+0xa/+0x12, flag
 * byte at +0x17) into the cell via func_020216b0. Returns 1.
 */

extern void func_020a978c(void *a, void *b, int c);
extern int func_0202224c(int a);
extern void func_02022234(int a, int b);
extern int func_02021660(int a, int b, int c);
extern short *func_ov007_021b2ef0(void *a, int b);
extern void func_020216b0(int a, int b, int c);
extern char data_ov007_021b346c[];

int func_ov007_021b2b74(char *a0, int a1) {
    short *cfg;
    int h;
    func_020a978c(a0 + 0x24, data_ov007_021b346c, a1);
    func_02022234(0, func_0202224c(0) | 0x2000);
    h = func_02021660(*(int *)a0, 3, 2);
    cfg = func_ov007_021b2ef0(a0, a1);
    func_020216b0(h, 0xe, cfg[1]);
    func_020216b0(h, 0xf, cfg[2]);
    func_020216b0(h, 0x3, cfg[3]);
    func_020216b0(h, 0x4, cfg[4]);
    func_020216b0(h, 0x5, cfg[5]);
    func_020216b0(h, 0xa, *(short *)((char *)cfg + 0x12));
    func_020216b0(h, 0xd, *(unsigned char *)((char *)cfg + 0x17));
    return 1;
}
