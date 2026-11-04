extern void func_020944a4(int unused0, int unused1, int unused2);

void func_020a33a8(int state, int source, int flags, int value) {
    int i;
    unsigned char count = 1;
    func_020944a4(source, state + 0x35e, 0x14a);
    for (i = 0; i < 15; i++) {
        if (flags & (2 << i)) {
            count++;
        }
    }
    *(unsigned char *)(state + 0x358) = count;
    *(unsigned short *)(state + 0x35a) = flags | 1;
    *(unsigned short *)(state + 0x35c) = value;
    (*(unsigned char *)(state + 0x4b4))++;
}


