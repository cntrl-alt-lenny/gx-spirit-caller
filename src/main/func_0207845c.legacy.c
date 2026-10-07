/* func_0207845c: func_0207850c(a, data_021020b4 + 1, 0x2c), then copy a's 0x14 bytes to b. */
extern char data_021020b4[];
extern void func_0207850c(void *buf, void *src, int n);
extern void func_02078d30(void *dst, void *src, int n);

void func_0207845c(void *a, void *b) {
    func_0207850c(a, data_021020b4 + 1, 0x2c);
    func_02078d30(b, a, 0x14);
}
