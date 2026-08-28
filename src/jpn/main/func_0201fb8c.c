extern void func_0201f0e4(int mode);
extern void func_0201f148(int arg);
extern int func_0201fc18(void);
extern int func_0201fcd0(void);

typedef struct {
    unsigned short hfield_0;
    char pad_2[0x18 - 0x2];
    int field_18;
    char pad_1c[0x38 - 0x1c];
    void (*field_38)(void *);
} D02191f40;

extern D02191f40 data_02191e60;
extern char data_020c6590[];

void func_0201fb8c(unsigned short *p0) {
    if (p0[1] != 0) {
        func_0201f148(p0[1]);
        return;
    }
    func_0201f0e4(1);
    if (data_02191e60.hfield_0 == 0) return;
    if (data_02191e60.field_18 != 0) {
        if (func_0201fc18() != 0) return;
        func_0201f0e4(9);
        return;
    }
    if (func_0201fcd0() != 0) return;
    if (data_02191e60.field_38 != 0) {
        data_02191e60.field_38(data_020c6590);
    }
    func_0201f0e4(9);
}
