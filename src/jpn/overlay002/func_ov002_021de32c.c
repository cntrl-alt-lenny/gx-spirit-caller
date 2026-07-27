typedef struct {
    unsigned short b;
    unsigned short bit0 : 1;
    unsigned short : 15;
    int zero1, zero2, zero3, zero4, zero5;
} arg_struct_t;

extern void func_ov002_021de044(arg_struct_t *s, int c, int p3, int p4);

void func_ov002_021de32c(int a, int b, int c) {
    arg_struct_t s = {0};
    s.b = (unsigned short)b;
    s.bit0 = (unsigned short)a;
    func_ov002_021de044(&s, c, 0xe, 2);
}
