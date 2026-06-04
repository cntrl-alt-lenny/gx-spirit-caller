/* func_ov019_021b4ed0: gate predicate keyed on a1. Mode 1 passes once the
 * system counter at data_02104f4c+0x928 reaches 8; mode 0x4b passes at 0x18.
 * Any other mode fails. Counter compares are unsigned.
 */

extern char data_02104f4c[];

int func_ov019_021b4ed0(int a0, int a1) {
    switch (a1) {
    case 1:
        if (*(unsigned int *)(data_02104f4c + 0x928) >= 8) {
            return 1;
        }
        break;
    case 0x4b:
        if (*(unsigned int *)(data_02104f4c + 0x928) >= 0x18) {
            return 1;
        }
        break;
    }
    return 0;
}
