extern char data_02104f4c[];

int func_ov019_021b4f1c(char *a0) {
    int result = *(int *)(a0 + 0xc0);
    switch (result) {
    case 2:
        if (*(unsigned int *)(data_02104f4c + 0x928) >= 0x24)
            result = 0x4a;
        break;
    case 3:
        if (*(unsigned int *)(data_02104f4c + 0x928) >= 0x29)
            result = 0x5e;
        break;
    case 5:
        if (*(unsigned int *)(data_02104f4c + 0x928) > 0x17)
            result = 0x4b;
        else if (*(unsigned int *)(data_02104f4c + 0x928) == 0x17) {
            if (*(unsigned int *)(data_02104f4c + 0x92c) >= 4)
                result = 0x4b;
        }
        break;
    case 7:
        if (*(unsigned int *)(data_02104f4c + 0x928) > 0x2b)
            result = 0x3f;
        else if (*(unsigned int *)(data_02104f4c + 0x928) == 0x2b) {
            if (*(unsigned int *)(data_02104f4c + 0x92c) >= 3)
                result = 0x3f;
        }
        break;
    case 0x2d:
        result = 0x49;
        break;
    }
    return result;
}
