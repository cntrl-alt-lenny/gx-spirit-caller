extern void *data_021a63c8;
extern void func_020916c8(void *param0);
extern void func_02092700(void *param0);
extern void func_02092154(void *param0, void *param1);
extern void func_02092074(void *param0);
extern void func_02091a0c(void *param0);
extern void func_02091690(void);
extern void func_0209198c(void);
extern void func_02093bfc(void);

void func_02091be4(void) {
    void *p0 = data_021a63c8;
    void *r4 = *(void **)p0;
    func_020916c8(p0);
    func_02092700(r4);
    {
        void *field78 = *(void **)((char *)r4 + 0x78);
        if (field78 != 0) {
            func_02092154(field78, r4);
        }
    }
    func_02092074(r4);
    *(int *)((char *)r4 + 0x64) = 2;
    func_02091a0c((char *)r4 + 0x9c);
    func_02091690();
    func_0209198c();
    func_02093bfc();
}
