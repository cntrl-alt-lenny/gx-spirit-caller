/* func_ov002_021c3be8: indexed-table bit read (unsigned >> for lsr). */
extern char data_ov002_022cf1a8[];
int func_ov002_021c3be8(int a0) {
    return (*(unsigned int *)(data_ov002_022cf1a8 + (a0 & 1) * 0x868) >> 1) & 1;
}
