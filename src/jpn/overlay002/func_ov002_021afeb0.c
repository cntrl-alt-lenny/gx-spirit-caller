/* func_ov002_021afeb0: for each i in [0, data_ov002_022cdb98.count), look up
 * func_ov002_021afe98(i); if it equals arg0, clear the slot; if it's greater
 * than arg0, shift it down by one. */
extern char data_ov002_022cdb98[];
extern int func_ov002_021afe98(int idx);
extern void func_ov002_021afe6c(int index, int value);

void func_ov002_021afeb0(int arg0) {
    int i;
    for (i = 0; i < *(unsigned int *)(data_ov002_022cdb98 + 0xc); i++) {
        int v = func_ov002_021afe98(i);
        if (v == arg0) {
            func_ov002_021afe6c(i, 0);
        } else if (v > arg0) {
            func_ov002_021afe6c(i, v - 1);
        }
    }
}
