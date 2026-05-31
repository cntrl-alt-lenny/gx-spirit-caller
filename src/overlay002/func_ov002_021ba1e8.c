/* func_ov002_021ba1e8: sibling of func_ov002_021ba1a0 for the 928-list /
 * cf184 count; passes arg1 through to func_ov002_021b91c4. */
extern int data_ov002_022cf184[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021b91c4(int *slot, int arg1);
void func_ov002_021ba1e8(int arg0, int arg1) {
    int idx = (arg0 & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf184 + idx);
    func_ov002_021b91c4((int *)(data_ov002_022cf16c + idx + 928) + count, arg1);
    *(int *)((char *)data_ov002_022cf184 + idx) =
        *(int *)((char *)data_ov002_022cf184 + idx) + 1;
}
