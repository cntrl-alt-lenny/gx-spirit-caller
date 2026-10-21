typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8 : 8; unsigned int : 24; };
    unsigned char _pad20[4];
    struct { unsigned int : 17; unsigned int mid4 : 4; unsigned int : 11; };
} state_t;
typedef struct { unsigned int f_0, f_4; } Dims02001e94;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001e94(Dims02001e94 *p, unsigned short *dst, int val, int shift);
extern void *func_0208dd9c(void);
extern int func_0208df94(void);
extern void func_02094504(int a, void *b, int c);
extern void func_0208ff84(void *a, int b, unsigned int n);
extern short data_ov006_021cde2c[];
extern unsigned char data_ov006_021cb718[], data_ov006_021cb738[], data_ov006_021cb798[], data_ov006_021cb6d8[], data_ov006_021cb758[];
int func_ov006_021c48e0(char *self) {
    *(volatile unsigned short *)0x0400100e = (*(volatile unsigned short *)0x0400100e & ~3) | 2;
    *(volatile unsigned short *)0x0400100e = (*(volatile unsigned short *)0x0400100e & 0x43) | 0x618;
    *(volatile unsigned int *)0x0400101c = 0;
    func_02094504(0, (void *)func_0208df94(), 0x800);
    func_02001d0c((state_t *)(self + 0x10), 0x20, 3);
    func_02001e94((Dims02001e94 *)(self + 0x10), (unsigned short *)func_0208df94(), 2, 4);
    func_02001d0c((state_t *)(self + 0x10), 0x20, 0x12);
    func_02001e94((Dims02001e94 *)(self + 0x10), (unsigned short *)(func_0208df94() + 0xc0), 0x62, 5);
    func_02001d0c((state_t *)(self + 0x10), 0x20, 3);
    func_02001e94((Dims02001e94 *)(self + 0x10), (unsigned short *)(func_0208df94() + 0x540), 0x2a2, 6);
    if ((data_ov006_021cde2c[*(int *)(self + 0x58) * 2] == 2 ? 2 : 1) == 2) {
        func_02001d0c((state_t *)(self + 0x10), 0x10, 3);
        func_02001e94((Dims02001e94 *)(self + 0x10), (unsigned short *)(func_0208df94() + 0x480), 0x302, 7);
        func_02001d0c((state_t *)(self + 0x10), 0x10, 3);
        func_02001e94((Dims02001e94 *)(self + 0x10), (unsigned short *)(func_0208df94() + 0x4a0), 0x332, 8);
    } else {
        func_02001d0c((state_t *)(self + 0x10), 0x20, 3);
        func_02001e94((Dims02001e94 *)(self + 0x10), (unsigned short *)(func_0208df94() + 0x480), 0x302, 7);
    }
    func_02094504(0, (char *)func_0208dd9c() + 0x40, 0xc00);
    func_02094504(0, (char *)func_0208dd9c() + 0xc40, 0x4800);
    func_02094504(0, (char *)func_0208dd9c() + 0x5440, 0xc00);
    func_02094504(0, (char *)func_0208dd9c() + 0x6040, 0xc00);
    func_0208ff84(data_ov006_021cb718, 0x80, 0x20);
    func_0208ff84(data_ov006_021cb738, 0xa0, 0x20);
    func_0208ff84(data_ov006_021cb798, 0xc0, 0x20);
    func_0208ff84(data_ov006_021cb6d8, 0xe0, 0x20);
    func_0208ff84(data_ov006_021cb758, 0x100, 0x20);
    return 1;
}
