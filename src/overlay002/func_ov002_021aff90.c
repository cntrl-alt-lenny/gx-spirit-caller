/* func_ov002_021aff90: for each i in [0, data_ov002_022cdc78.count), look up
 * func_ov002_021aff78(i); if it equals arg0, clear the slot; if it's greater
 * than arg0, shift it down by one. */
extern char data_ov002_022cdc78[];
extern int func_ov002_021aff78(int idx);
extern void func_ov002_021aff4c(int index, int value);

void func_ov002_021aff90(int arg0) {
    int i;
    for (i = 0; i < *(unsigned int *)(data_ov002_022cdc78 + 0xc); i++) {
        int v = func_ov002_021aff78(i);
        if (v == arg0) {
            func_ov002_021aff4c(i, 0);
        } else if (v > arg0) {
            func_ov002_021aff4c(i, v - 1);
        }
    }
}
