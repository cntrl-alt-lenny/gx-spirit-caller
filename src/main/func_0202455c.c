/* func_0202455c: clear u16 at data->f_34, return 1. */

extern char data_0219a8ec[];

int func_0202455c(void) {
    *(unsigned short *)(data_0219a8ec + 0x34) = 0;
    return 1;
}
