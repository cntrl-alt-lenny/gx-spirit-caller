extern void func_020945f4(void *dst, int val, int n);
extern void func_02071028(int v);

void func_02041dbc(char *self) {
    func_020945f4(self + 0x1134, 0, 100);
    *(int *)(self + 0x1170) = 0xb68;
    *(int *)(self + 0x1174) = *(int *)(self + 0x19c8);
    *(int *)(self + 0x117c) = 0x5ea;
    *(int *)(self + 0x1180) = *(int *)(self + 0x19cc);
    func_02071028((int)(self + 0x1134));
}
