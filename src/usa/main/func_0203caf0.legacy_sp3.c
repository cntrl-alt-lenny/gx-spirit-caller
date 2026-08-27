/* func_0203caf0: snapshot func_0203c838's byte state; 0 or 0x12 just
 * resets it (func_0203c918) and returns 1; otherwise runs the state
 * machine step (func_0203dbc0, my own func_0203dbc0.c) and reports the
 * (possibly updated) byte via func_0203c84c, returning 0. */
extern int  func_0203c838(void);
extern void func_0203c918(void);
extern int  func_0203dbc0(unsigned char *p);
extern void func_0203c84c(int a);

int func_0203caf0(void) {
    unsigned char b = (unsigned char)func_0203c838();
    if (b == 0 || b == 0x12) {
        func_0203c918();
        return 1;
    }
    func_0203dbc0(&b);
    func_0203c84c(b);
    return 0;
}
