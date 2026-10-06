typedef struct {
    unsigned short s[12];
} Tbl_0200a26c;

extern char data_020b4794[];
extern char data_020b477c[];
extern void func_0200a014(int a, int b);

void func_0200a26c(int a0) {
    Tbl_0200a26c hi = *(Tbl_0200a26c *)data_020b4794;
    Tbl_0200a26c lo = *(Tbl_0200a26c *)data_020b477c;

    func_0200a014(hi.s[a0], lo.s[a0]);
}
