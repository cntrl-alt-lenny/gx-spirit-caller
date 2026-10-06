extern char data_020ff980[];
extern char data_020ff9a0[];
extern char data_020ff9ac[];
extern char data_020ff9b8[];
extern char data_020ff9ec[];
extern int OS_SNPrintf(signed char *buffer, int bufsz, const signed char *format, ...);

void func_0204f040(char *buf, int pid, int players, int type) {
    OS_SNPrintf((signed char *)buf, 0x100, (const signed char *)data_020ff9ec,
                data_020ff9b8, 3, data_020ff980, pid, players, players,
                data_020ff9a0, type, data_020ff9ac, data_020ff980);
}
