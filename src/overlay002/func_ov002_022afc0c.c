struct F022afb8c_Self {
    int f0, f4, f8, fc, f10, f14, f18, f1c, f20;
    unsigned char f24; char pad25[3];
    int f28, f2c, f30, f34;
    unsigned char f38; char pad39[3];
    int f3c, f40, f44, f48;
};
extern int func_020b3870(int a, int b);
int func_ov002_022afc0c(struct F022afb8c_Self *s, int x, int y) {
    int result;
    int pos;
    int span;
    int border;
    x -= s->f4;
    y -= s->f8;
    if (s->f38) { int t = x; x = y; y = t; }
    result = 0;
    if (x >= 0) {
    if (x < s->f28) {
    if (y >= 0) {
    border = s->f2c;
    span = s->f34;
    if (y < span + border * 2) {
    if (s->f14 == 3) pos = s->f18;
    else pos = func_020b3870((span - s->f30) * (s->f3c - s->f40) + (s->f44 - s->f40) / 2, s->f44 - s->f40);
    if (y < border) result = -1;
    else if (y >= span + border) result = 1;
    else if (y < border + pos) result = -2;
    else if (y >= border + pos + s->f30) result = 2;
    else result = 3;
    } } } }
    return result;
}



