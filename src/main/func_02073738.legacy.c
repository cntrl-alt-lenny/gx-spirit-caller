/* func_02073738: broadcast an ARP request (42-byte frame) for ip. */
extern void func_020945f4(void *dst, int val, int size);
extern void func_02094688(void *a, void *b, int n);
extern void func_02073d30(char *a0, int a1, char *a2, int a3);
extern unsigned char data_0219ef2c[];
extern unsigned int data_0219ef1c;

static inline unsigned short Swap16(int value) { return (value >> 8) | (value << 8); }

void func_02073738(unsigned int ip) {
    unsigned char buf[0x2a];
    unsigned int own;

    func_020945f4(buf, 0, 0x2a);
    func_020945f4(buf, 0xff, 6);
    func_02094688(data_0219ef2c, buf + 6, 6);
    *(unsigned short *)(buf + 0xc) = 0x608;
    buf[0xf] = 1;
    buf[0x15] = 1;
    buf[0x10] = 8;
    *(unsigned short *)(buf + 0x12) = 0x406;
    func_02094688(data_0219ef2c, buf + 0x16, 6);
    own = data_0219ef1c;
    *(unsigned short *)(buf + 0x1c) = Swap16((unsigned short)(own >> 16));
    *(unsigned short *)(buf + 0x1e) = Swap16((unsigned short)own);
    *(unsigned short *)(buf + 0x26) = Swap16((unsigned short)(ip >> 16));
    *(unsigned short *)(buf + 0x28) = Swap16((unsigned short)ip);
    func_02073d30((char *)buf, 0x2a, 0, 0);
}
