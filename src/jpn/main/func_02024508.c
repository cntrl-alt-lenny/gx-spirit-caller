/* func_02024508: clear u16 at data->f_34, return 1. */

extern char data_0219a80c[];

int func_02024508(void) {
    *(unsigned short *)(data_0219a80c + 0x34) = 0;
    return 1;
}
