extern void func_02093b00(unsigned int *buf);
extern void func_02044c60(int *buf);
extern void func_020536d0(void *self, int a, int b);
extern void func_020536c8(void *self, int hi);
extern void func_02053600(void *self, int flag);

void func_02053230(void *self) {
    int buf2[5];
    unsigned int buf[8];
    unsigned int i;
    unsigned long long seed;
    unsigned long long result;

    func_02093b00(buf);
    for (i = 1; i < 8; i++) {
        buf[i] ^= *(&buf[i] - 1);
    }
    seed = buf[7];

    func_02044c60(buf2);
    if (buf2[4] != 0) {
        func_020536d0(self, buf2[0], buf2[1]);
    } else {
        func_020536d0(self, buf2[2], buf2[3]);
    }

    result = seed * 0x5d588b656c078965ULL + 0x269ec3ULL;
    func_020536c8(self, (int)(result >> 32));
    func_02053600(self, 1);
}
