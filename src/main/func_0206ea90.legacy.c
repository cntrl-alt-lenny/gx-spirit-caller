extern int func_0206e1e8(int a, int b);

int func_0206ea90(unsigned int *pa, unsigned int *pb) {
    unsigned int b = *pb;
    unsigned int a = *pa;

    return func_0206e1e8(((a >> 24) & 0xff) | ((a >> 8) & 0xff00) | ((a << 8) & 0xff0000) | ((a << 24) & 0xff000000),
                         ((b >> 24) & 0xff) | ((b >> 8) & 0xff00) | ((b << 8) & 0xff0000) | ((b << 24) & 0xff000000));
}
