/* func_ov002_021b1458: pack (arg0..arg3) into a 4-u16 record and fire
 * func_ov002_021b1570(arg0, -1, &rec[1], 6). */
extern int func_ov002_021b1570(int a, int b, unsigned short *c, int d);
void func_ov002_021b1458(int arg0, int arg1, int arg2, int arg3) {
    unsigned short rec[4];
    rec[0] = arg0;
    rec[1] = arg1;
    rec[2] = arg2;
    rec[3] = arg3;
    func_ov002_021b1570(arg0, -1, &rec[1], 6);
}
