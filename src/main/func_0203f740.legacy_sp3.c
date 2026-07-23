extern void func_0203f590(int, void *);
extern int func_020a7440(void *, void *, int);
extern char data_020fe550[];

int func_0203f740(int arg0) {
    char local[0x1c];
    func_0203f590(arg0, local);
    return func_020a7440(local, data_020fe550, 8) == 0;
}
