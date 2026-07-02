extern char *GetSystemWork(void);
extern int *func_0201b75c(void);

struct Bit02013aa0 {
    unsigned int b0 : 1;
};

void func_02013aa0(int *dst) {
    char *sw = GetSystemWork();
    int state;
    int sub;
    int *p;

    if (((struct Bit02013aa0 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }

    state = *(int *)(sw + 0x920);
    if (state == 1) {
        goto state1;
    }
    if (state == 2) {
        goto state2;
    }
    if (state == 3) {
        dst[2] = 0x00010300;
    }
    return;

state1:
    sub = *(int *)(sw + 0x924);
    if (sub == 1) {
        goto sub1;
    }
    if (sub == 2) {
        goto sub2;
    }
    if (sub == 3) {
        goto sub3;
    }
    return;

sub1:
    *(int *)(sw + 0x924) = 3;
sub3:
    dst[2] = 0x00010100;
    return;

sub2:
    dst[2] = 0x00010101;
    p = func_0201b75c();
    *p |= 0x2000;
    return;

state2:
    dst[2] = 0x00010200;
}
