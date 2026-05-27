/* func_0202a2f8: C-42 — sibling of 02023574 (different helper). */

extern void func_0202ab04(void);

int func_0202a2f8(int *p) {
    if (*p == 0) return 0;
    *p = 0;
    func_0202ab04();
    return 1;
}
