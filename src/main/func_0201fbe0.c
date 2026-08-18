extern void func_0201f138(int mode);
extern void func_0201f19c(int arg);
extern int func_0201fc6c(void);
extern int func_0201fd24(void);

typedef struct {
    unsigned short hfield_0;
    char pad_2[0x18 - 0x2];
    int field_18;
    char pad_1c[0x38 - 0x1c];
    void (*field_38)(void *);
} D02191f40;

extern D02191f40 data_02191f40;
extern char data_020c6670[];

void func_0201fbe0(unsigned short *p0) {
    if (p0[1] != 0) {
        func_0201f19c(p0[1]);
        return;
    }
    func_0201f138(1);
    if (data_02191f40.hfield_0 == 0) return;
    if (data_02191f40.field_18 != 0) {
        if (func_0201fc6c() != 0) return;
        func_0201f138(9);
        return;
    }
    if (func_0201fd24() != 0) return;
    if (data_02191f40.field_38 != 0) {
        data_02191f40.field_38(data_020c6670);
    }
    func_0201f138(9);
}
