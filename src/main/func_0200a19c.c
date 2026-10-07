typedef struct {
    unsigned short s[87];
} Tbl_0200a19c;

extern char data_020b47ac[];
extern int func_02019210(int a);
extern void func_0200a014(int a, int b);

void func_0200a19c(int a0) {
    Tbl_0200a19c t = *(Tbl_0200a19c *)data_020b47ac;

    func_0200a014(t.s[func_02019210(a0)], a0);
}
