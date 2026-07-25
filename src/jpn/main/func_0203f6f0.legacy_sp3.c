extern void func_0203f540(int, void *);
extern int func_020a734c(void *, void *, int);
extern char data_020fe470[];

int func_0203f6f0(int arg0) {
    char local[0x1c];
    func_0203f540(arg0, local);
    return func_020a734c(local, data_020fe470, 8) == 0;
}
