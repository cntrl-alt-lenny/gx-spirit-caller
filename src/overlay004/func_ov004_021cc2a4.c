typedef struct {
    char pad[0x54];
    int count;
    char pad58[0x1c];
    int state;
} State;
extern State data_ov004_0220b500;
extern int func_0201cd1c(int a, void *b, int c);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov004_021cc2a4(void) {
    unsigned short command = 0x13;
    func_0201cd1c(2, &command, 2);
    data_ov004_0220b500.state = 0;
    --data_ov004_0220b500.count;
    func_02037208(0x42, -1, 0, 1);
}
