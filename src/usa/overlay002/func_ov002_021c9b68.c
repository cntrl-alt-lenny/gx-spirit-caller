/* func_ov002_021c9b68: true iff func_ov002_021b3ef8(...,0x1679) is clear and
 * func_ov002_021b3dec(...,0x1a1b) is also clear. */
extern int func_ov002_021b3ef8(int a, int b, int c, int d);
extern int func_ov002_021b3dec(int a, int b, int c);
int func_ov002_021c9b68(int arg0) {
    if (func_ov002_021b3ef8(arg0, 11, 0x1679, 2) != 0)
        return 0;
    return func_ov002_021b3dec(arg0, 11, 0x1a1b) == 0;
}
