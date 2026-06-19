/* func_ov003_021ccd1c: gate a transition on progress — selector 1 is ready once
 * the global step counter (+0x928) reaches 8, selector 0x4b once it reaches 0x17;
 * anything else is never ready. Returns the ready flag. (ov003_core.h) */
extern char data_02104e6c[];
int func_ov003_021ccd1c(int dummy, int sel) {
    switch (sel) {
    case 1:
        if ((unsigned)*(int *)(data_02104e6c + 0x928) >= 8)
            return 1;
        break;
    case 0x4b:
        if ((unsigned)*(int *)(data_02104e6c + 0x928) >= 0x17)
            return 1;
        break;
    }
    return 0;
}
