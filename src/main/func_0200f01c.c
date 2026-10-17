typedef struct { int pad[24]; unsigned int z0 : 2; unsigned int a : 1; unsigned int b : 1; unsigned int z1 : 17; unsigned int c : 4; unsigned int z2 : 7; } S;
int func_0200f01c(S *s) {
    if (s == 0) return 0;
    s->a = 0;
    s->b = 1;
    s->c = 0;
    return 1;
}
