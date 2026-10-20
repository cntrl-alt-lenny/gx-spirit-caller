void func_ov000_021ab850(int which) {
    switch (which) {
    case 0: {
        unsigned short *reg = (unsigned short *)0x04000050;
        if ((unsigned int)(((*reg & 0xc0) >> 6) - 2) <= 1) {
            *reg &= ~0xc0;
        }
        break;
    }
    case 1: {
        unsigned short *reg = (unsigned short *)0x04001050;
        if ((unsigned int)(((*reg & 0xc0) >> 6) - 2) <= 1) {
            *reg &= ~0xc0;
        }
        break;
    }
    }
}
