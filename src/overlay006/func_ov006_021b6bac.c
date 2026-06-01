/* func_ov006_021b6bac: select one of two int fields by index (else 0). */
int func_ov006_021b6bac(char *base, int sel) {
    switch (sel) {
    case 0:
        return *(int *)(base + 0x6234);
    case 1:
        return *(int *)(base + 0x6238);
    default:
        return 0;
    }
}
