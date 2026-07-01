extern unsigned int data_02105bb0[];
extern int func_02008d60(int i, void *buf);

void func_02008c14(void)
{
    unsigned int *base;
    int i;
    char buf[0x124];

    base = data_02105bb0;
    i = 0;
    base[1] = 0;
    base[0] = 0;
    for (; i < 50; i++) {
        if (func_02008d60(i, buf)) {
            base[i / 32] |= 1u << (i % 32);
        }
    }
}
