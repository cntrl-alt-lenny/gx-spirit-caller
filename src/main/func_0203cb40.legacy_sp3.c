/* func_0203cb40: snapshot func_0203c888's byte state; 0 or 0x12 just
 * resets it (func_0203c968) and returns 1; otherwise runs the state
 * machine step (func_0203dc10, my own func_0203dc10.c) and reports the
 * (possibly updated) byte via func_0203c89c, returning 0. */
extern int  func_0203c888(void);
extern void func_0203c968(void);
extern int  func_0203dc10(unsigned char *p);
extern void func_0203c89c(int a);

int func_0203cb40(void) {
    unsigned char b = (unsigned char)func_0203c888();
    if (b == 0 || b == 0x12) {
        func_0203c968();
        return 1;
    }
    func_0203dc10(&b);
    func_0203c89c(b);
    return 0;
}
