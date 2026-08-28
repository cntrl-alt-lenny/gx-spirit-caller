extern void *data_021a62e8;
extern void func_020915e0(void *param0);
extern void func_02092618(void *param0);
extern void func_0209206c(void *param0, void *param1);
extern void func_02091f8c(void *param0);
extern void func_02091924(void *param0);
extern void func_020915a8(void);
extern void func_020918a4(void);
extern void func_02093b08(void);

void func_02091afc(void) {
    void *p0 = data_021a62e8;
    void *r4 = *(void **)p0;
    func_020915e0(p0);
    func_02092618(r4);
    {
        void *field78 = *(void **)((char *)r4 + 0x78);
        if (field78 != 0) {
            func_0209206c(field78, r4);
        }
    }
    func_02091f8c(r4);
    *(int *)((char *)r4 + 0x64) = 2;
    func_02091924((char *)r4 + 0x9c);
    func_020915a8();
    func_020918a4();
    func_02093b08();
}
