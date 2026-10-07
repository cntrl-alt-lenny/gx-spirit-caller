typedef struct {
    char pad[0x38];
    int seed;
} State_02009f50;

extern State_02009f50 data_021040ac;
extern unsigned char data_02104f4c[];
extern void func_020a9950(int seed);
extern int func_020a991c(void);

void func_02009f50(void) {
    int i;
    int dec;
    unsigned char *p;

    func_020a9950(data_021040ac.seed);
    p = data_02104f4c;
    for (i = 0; i < 26; i++, p += 0x1c) {
        switch (p[0x156c]) {
        case 0:
            continue;
        case 1:
            dec = func_020a991c() % 4;
            break;
        case 2:
            dec = func_020a991c() % 4 + 1;
            break;
        case 3:
        case 4:
            dec = func_020a991c() % 4 + 2;
            break;
        default:
            dec = 0;
            break;
        }
        if (p[0x156d] < dec) {
            p[0x156d] = 0;
        } else {
            p[0x156d] = p[0x156d] - dec;
        }
    }
}
