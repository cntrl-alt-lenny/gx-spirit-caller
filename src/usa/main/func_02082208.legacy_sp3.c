typedef struct {
    int type;
    unsigned char data[0xfc - 4];
    unsigned int flags;
} Data_021a18b8;

extern Data_021a18b8 data_021a17d8;
extern void func_02084d24(int, void *, int);

void func_02082208(void) {
    int *p = (int *)&data_021a17d8;
    int type = *p++;

    func_02084d24(type, p, 0x3e);
    data_021a17d8.flags &= ~1;
    data_021a17d8.flags &= ~2;
}
