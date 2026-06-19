/* func_ov006_021b555c: notify four subsystems of the current 3-bit mode and
 * seed a state word; return 1. */
extern void func_0202ada4(void *p);
extern void func_0202adc8(int mode);
extern void func_0202c01c(int mode);
extern void func_0200195c(int a, void *p, int c);
extern void func_02001d48(int mode);
extern char data_ov006_0224f284[];
struct Ov006Mode { int pad; unsigned mode : 3; };
extern struct Ov006Mode data_02104e6c;
extern char data_ov006_021cf090[];
extern int  data_ov006_0224f26c[];
int func_ov006_021b555c(void) {
    func_0202ada4(data_ov006_0224f284);
    func_0202adc8(data_02104e6c.mode);
    func_0202c01c(data_02104e6c.mode);
    func_0200195c(4, data_ov006_021cf090, 0x80000);
    func_02001d48(data_02104e6c.mode);
    data_ov006_0224f26c[0] = 2;
    return 1;
}
