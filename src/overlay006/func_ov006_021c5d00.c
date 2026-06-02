/* func_ov006_021c5d00: configure a display register, then build+submit a
 * command record and release the handle; return 1. (0201e5b8 command-record
 * family, with a leading 0x0400000a config.) */
extern int  func_02006c0c(void *p, int b, int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void func_02006e1c(int h);
extern char data_ov006_021ce16c[];
int func_ov006_021c5d00(void) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400000a;
    char cmd[40];
    int h;
    *reg = (*reg & ~3) | 3;
    *reg = (*reg & 0x43) | 0xd00;
    h = func_02006c0c(data_ov006_021ce16c, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 1;
    *(int *)(cmd + 8) = 0x6800;
    *(int *)(cmd + 12) = 0x66e0;
    *(short *)(cmd + 16) = 480;
    func_0201e5b8(cmd);
    func_02006e1c(h);
    return 1;
}
