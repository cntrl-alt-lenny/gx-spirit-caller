/* func_ov002_021b9d68: sibling of func_ov002_021b9d20 with the func_0203124c
 * gate. */
extern int data_ov002_022cf0c8[];
extern int func_ov002_021b9dec(int a, int b);
extern int func_0203124c(int a);
int func_ov002_021b9d68(int arg0, int arg1) {
    if (func_0203124c(func_ov002_021b9dec(arg0, arg1)) == 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf0c8 + (arg0 & 1) * 0x868 + arg1 * 20);
}
