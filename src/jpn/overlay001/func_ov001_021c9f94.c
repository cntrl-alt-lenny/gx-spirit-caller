extern char data_ov001_021ca340[];
extern void func_ov001_021c9e44(int);
extern void func_ov000_021ab3dc(int, int);
extern void func_0201d56c(int, int);
extern void func_0208c858(void);

int func_ov001_021c9f94(void) {
    *(unsigned short *)0x04000008 =
        (*(unsigned short *)0x04000008 & 0x43) | 0x84;
    *(unsigned short *)0x04001008 =
        (*(unsigned short *)0x04001008 & 0x43) | 0x84;

    func_ov001_021c9e44(
        (unsigned int)((unsigned int)(*(int *)data_ov001_021ca340) << 8) >> 24);

    func_ov000_021ab3dc(0, 1);
    func_ov000_021ab3dc(1, 1);

    *(unsigned int *)0x04000000 =
        (*(unsigned int *)0x04000000 & 0xffcfffef) | 0x10 | 0x200000;
    *(unsigned int *)0x04001000 =
        (*(unsigned int *)0x04001000 & 0xffcfffef) | 0x10 | 0x200000;

    func_0201d56c(4, 2);
    func_0201d56c(9, 2);
    func_0208c858();

    *(unsigned int *)0x04001000 |= 0x10000;

    return 1;
}
