/* func_ov002_021ba108: sibling of func_ov002_021ba0c0 for the 928-list /
 * cf184 count; passes arg1 through to func_ov002_021b90e4. */
extern int data_ov002_022cf0a4[];
extern char data_ov002_022cf08c[];
extern void func_ov002_021b90e4(int *slot, int arg1);
void func_ov002_021ba108(int arg0, int arg1) {
    int idx = (arg0 & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf0a4 + idx);
    func_ov002_021b90e4((int *)(data_ov002_022cf08c + idx + 928) + count, arg1);
    *(int *)((char *)data_ov002_022cf0a4 + idx) =
        *(int *)((char *)data_ov002_022cf0a4 + idx) + 1;
}
