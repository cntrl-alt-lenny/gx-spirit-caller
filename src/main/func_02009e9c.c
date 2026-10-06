typedef struct {
    char pad[0xa74];
    unsigned int flags;
} Mode_02009e9c;

typedef struct {
    char pad[0xa0];
    unsigned short level;
} Level_02009e9c;

extern Mode_02009e9c data_02104f3c;
extern unsigned char data_02104f4c[];
extern Level_02009e9c data_0210593c;
extern void func_02009ab0(int n);

void func_02009e9c(void) {
    int i;
    int x = 0;
    unsigned char *p;

    if (((data_02104f3c.flags & 0x1f00000) >> 20) - 1 == 2) {
        switch (data_0210593c.level) {
        case 0:
            x = 5;
            break;
        case 1:
            x = 10;
            break;
        case 2:
            x = 20;
            break;
        }
    }
    p = data_02104f4c;
    for (i = 0; i < 26; i++, p += 0x1c) {
        p[0x156d] = p[0x156d] + (x + p[0x156e]);
        p[0x156e] = 0;
        if (p[0x156d] > 0x32) {
            p[0x156d] = 0x32;
        }
        func_02009ab0(i + 1);
    }
}
