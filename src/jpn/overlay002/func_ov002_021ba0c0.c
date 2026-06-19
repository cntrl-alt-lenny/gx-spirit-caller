/* func_ov002_021ba0c0: push onto player (arg0&1)'s 608-list — hand the next
 * free slot (cf16c+608 + count*4) plus arg1 to func_ov002_021b90e4, then bump
 * the cf17c count (post-call re-read forced by aliasing). */
extern int data_ov002_022cf09c[];
extern char data_ov002_022cf08c[];
extern void func_ov002_021b90e4(int *slot, int arg1);
void func_ov002_021ba0c0(int arg0, int arg1) {
    int idx = (arg0 & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf09c + idx);
    func_ov002_021b90e4((int *)(data_ov002_022cf08c + idx + 608) + count, arg1);
    *(int *)((char *)data_ov002_022cf09c + idx) =
        *(int *)((char *)data_ov002_022cf09c + idx) + 1;
}
