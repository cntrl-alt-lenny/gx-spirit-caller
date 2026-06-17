/* func_0202a2a4: C-42 — sibling of 02023574 (different helper). */

extern void func_0202aab0(void);

int func_0202a2a4(int *p) {
    if (*p == 0) return 0;
    *p = 0;
    func_0202aab0();
    return 1;
}
