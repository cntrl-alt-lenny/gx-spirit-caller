extern int func_020683ec(void *p);
extern void func_02068194(void *self, int v);

void func_02067c08(char *self) {
    char *p = self + 0x14;
    while (*(int *)(self + 0x10) < *(int *)(self + 0x4) && *(int *)(self + 0x1c) > 0) {
        int v = func_020683ec(p);
        func_02068194(self, v);
    }
}
