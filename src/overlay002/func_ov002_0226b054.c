/* func_ov002_0226b054: C-39f 0x868-table guard + dispatch (16 band-callers).
 * If the per-player slot at data_ov002_022cf17c[(1-arg0)*0x868] is set, fire
 * func_ov002_0226acf8(arg0, 8, 0, 0); otherwise no-op. The (1-arg0)&1 index
 * carries the explicit & 1 (gotcha 14) and the 0x868 player stride is a mul.
 */

extern int func_ov002_0226acf8(int a, int b, int c, int d);
extern int data_ov002_022cf17c[];

void func_ov002_0226b054(int arg0) {
    if (*(int *)((char *)data_ov002_022cf17c + ((1 - arg0) & 1) * 0x868) == 0)
        return;
    func_ov002_0226acf8(arg0, 8, 0, 0);
}
