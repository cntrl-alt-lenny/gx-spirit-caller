typedef struct {
    int type;
    unsigned char data[0xfc - 4];
    unsigned int flags;
} Data_021a18b8;

extern Data_021a18b8 data_021a18b8;
extern void func_02084e0c(int, void *, int);

void func_020822f0(void) {
    int *p = (int *)&data_021a18b8;
    int type = *p++;

    func_02084e0c(type, p, 0x3e);
    data_021a18b8.flags &= ~1;
    data_021a18b8.flags &= ~2;
}
