/* func_ov002_021b9e48: sibling of func_ov002_021b9e00 with the func_020312a0
 * gate. */
extern int data_ov002_022cf1a8[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_020312a0(int a);
int func_ov002_021b9e48(int arg0, int arg1) {
    if (func_020312a0(func_ov002_021b9ecc(arg0, arg1)) == 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf1a8 + (arg0 & 1) * 0x868 + arg1 * 20);
}
