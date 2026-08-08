extern char *func_020498f0(void);
extern void func_02050054(int a, int b);

int func_02049910(int a0) {
    char *p;
    if (a0 != 0) {
        return 1;
    }
    p = func_020498f0();
    if (*(unsigned char *)(p + 0x15) != 3) {
        p = func_020498f0();
        (*(unsigned char *)(p + 0x17d))++;
    }
    p = func_020498f0();
    if (*(unsigned char *)(p + 0x15) == 3) {
        goto tail;
    }
    p = func_020498f0();
    if (*(unsigned char *)(p + 0x17d) < 5) {
        goto ret1;
    }
tail:
    func_02050054(6, 0xfffeae6c);
    return 0;
ret1:
    return 1;
}
