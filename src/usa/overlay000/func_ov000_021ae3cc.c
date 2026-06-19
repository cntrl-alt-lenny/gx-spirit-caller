/* func_ov000_021ae3cc: two field copies + masked OR-init. */
extern char data_ov000_021c74ac[];
void func_ov000_021ae3cc(void) {
    char *g = data_ov000_021c74ac;
    *(int *)(g + 0x17c) = *(int *)(g + 0x184);
    *(int *)(g + 0x180) = *(int *)(g + 0x188);
    *(int *)(g + 0x2a4) = (*(int *)(g + 0x2a4) & 0xffe01fffu) | 0xfe000 | 0x100000;
}
