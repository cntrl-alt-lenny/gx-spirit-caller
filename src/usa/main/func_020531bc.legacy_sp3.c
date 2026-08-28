extern void func_02093a0c(unsigned int *buf);
extern void func_02044c10(int *buf);
extern void func_0205365c(void *self, int a, int b);
extern void func_02053654(void *self, int hi);
extern void func_0205358c(void *self, int flag);

void func_020531bc(void *self) {
    int buf2[5];
    unsigned int buf[8];
    unsigned int i;
    unsigned long long seed;
    unsigned long long result;

    func_02093a0c(buf);
    for (i = 1; i < 8; i++) {
        buf[i] ^= *(&buf[i] - 1);
    }
    seed = buf[7];

    func_02044c10(buf2);
    if (buf2[4] != 0) {
        func_0205365c(self, buf2[0], buf2[1]);
    } else {
        func_0205365c(self, buf2[2], buf2[3]);
    }

    result = seed * 0x5d588b656c078965ULL + 0x269ec3ULL;
    func_02053654(self, (int)(result >> 32));
    func_0205358c(self, 1);
}
