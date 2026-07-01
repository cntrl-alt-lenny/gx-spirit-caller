extern unsigned int data_02105ad0[];
extern int func_02008d44(int i, void *buf);

void func_02008bf8(void)
{
    unsigned int *base;
    int i;
    char buf[0x124];

    base = data_02105ad0;
    i = 0;
    base[1] = 0;
    base[0] = 0;
    for (; i < 50; i++) {
        if (func_02008d44(i, buf)) {
            base[i / 32] |= 1u << (i % 32);
        }
    }
}
