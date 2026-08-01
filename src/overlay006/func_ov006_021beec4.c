typedef unsigned short u16;
typedef unsigned int u32;

struct Hw100e {
    volatile u16 ctrl;
    char _pad[0xc];
};
#define HW_100E (*(struct Hw100e *)0x0400100e)
#define HW_100E_FIELD_E (*(volatile u32 *)((char *)0x0400100e + 0xe))

extern int func_0208df94(void);
extern void func_02094504(int a, int b, int c);
extern void func_02001d0c(char *a, int b, int c);
extern void func_02001e94(char *a, int b, int c, int d);
extern int func_0208dd9c(void);
extern void func_0208ff84(char *a, int b, int c);
extern char data_020b4728[];

int func_ov006_021beec4(char *arg0) {
    HW_100E.ctrl = (HW_100E.ctrl & ~3) | 2;
    HW_100E.ctrl = (HW_100E.ctrl & 0x43) | 0x218 | 0x400;
    HW_100E_FIELD_E = 0x30000;

    func_02094504(0, func_0208df94(), 0x640);
    func_02001d0c(arg0 + 4, 0x20, 0x19);
    func_02001e94(arg0 + 4, func_0208df94(), 2, 1);
    func_02094504(0, func_0208dd9c() + 0x40, 0x6400);
    func_0208ff84(data_020b4728, 0x20, 0x20);
    return 1;
}
