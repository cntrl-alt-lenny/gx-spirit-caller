/* func_ov000_021ae4d8: two field copies + masked OR-init. */
extern char data_ov000_021c758c[];
void func_ov000_021ae4d8(void) {
    char *g = data_ov000_021c758c;
    *(int *)(g + 0x17c) = *(int *)(g + 0x184);
    *(int *)(g + 0x180) = *(int *)(g + 0x188);
    *(int *)(g + 0x2a4) = (*(int *)(g + 0x2a4) & 0xffe01fffu) | 0xfe000 | 0x100000;
}
