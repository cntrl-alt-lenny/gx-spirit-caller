extern int data_0219dac0;
extern int data_0219dac4;

int func_020452c4(int *out0, int *out1) {
    if (out0 != 0) {
        *out0 = data_0219dac4;
    }
    if (out1 != 0) {
        switch (data_0219dac0) {
        case 2:
        case 3:
        case 4:
        case 5:
        case 8:
            *out1 = 6;
            break;
        case 6:
            *out1 = 3;
            break;
        case 7:
            *out1 = 4;
            break;
        case 10:
        case 11:
        case 12:
        case 13:
            *out1 = 1;
            break;
        case 1:
        case 9:
            *out1 = 7;
            break;
        case 14:
            *out1 = 5;
            break;
        case 15:
        case 17:
            *out1 = 6;
            break;
        case 16:
            *out1 = 2;
            break;
        case 0:
        default:
            *out1 = 0;
            break;
        }
    }

    return data_0219dac0;
}
