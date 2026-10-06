typedef struct {
    unsigned short s[87];
} Tbl_0200a204;

extern char data_020b476c[];
extern int func_02019210(int a);
extern void func_0200a014(int a, int b);

void func_0200a204(int a0) {
    Tbl_0200a204 t = *(Tbl_0200a204 *)(data_020b476c + 0xee);

    func_0200a014(t.s[func_02019210(a0)], a0);
}
