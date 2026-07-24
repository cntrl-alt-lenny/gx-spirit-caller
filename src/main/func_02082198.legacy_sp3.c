typedef struct {
    unsigned char pad[0xfc];
    unsigned int flags;
} Data_021a18b8_02082198;

extern Data_021a18b8_02082198 data_021a18b8;
extern int data_021a1904;
extern int data_021a19b8;
extern void func_0208b54c(int *, int *);

int *func_02082198(void) {
    if ((data_021a18b8.flags & 8) == 0) {
        func_0208b54c(&data_021a1904, &data_021a19b8);
        data_021a18b8.flags |= 8;
    }
    return &data_021a19b8;
}
