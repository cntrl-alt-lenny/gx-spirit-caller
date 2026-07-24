typedef struct {
    unsigned char pad[0xfc];
    unsigned int flags;
} Data_021a18b8_02082198;

extern Data_021a18b8_02082198 data_021a17d8;
extern int data_021a1824;
extern int data_021a18d8;
extern void func_0208b464(int *, int *);

int *func_020820b0(void) {
    if ((data_021a17d8.flags & 8) == 0) {
        func_0208b464(&data_021a1824, &data_021a18d8);
        data_021a17d8.flags |= 8;
    }
    return &data_021a18d8;
}
