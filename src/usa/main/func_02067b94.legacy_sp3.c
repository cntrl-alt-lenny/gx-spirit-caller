extern int func_02068378(void *p);
extern void func_02068120(void *self, int v);

void func_02067b94(char *self) {
    char *p = self + 0x14;
    while (*(int *)(self + 0x10) < *(int *)(self + 0x4) && *(int *)(self + 0x1c) > 0) {
        int v = func_02068378(p);
        func_02068120(self, v);
    }
}
