/* func_ov002_021c9c48: true iff func_ov002_021b3fd8(...,0x1679) is clear and
 * func_ov002_021b3ecc(...,0x1a1b) is also clear. */
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern int func_ov002_021b3ecc(int a, int b, int c);
int func_ov002_021c9c48(int arg0) {
    if (func_ov002_021b3fd8(arg0, 11, 0x1679, 2) != 0)
        return 0;
    return func_ov002_021b3ecc(arg0, 11, 0x1a1b) == 0;
}
