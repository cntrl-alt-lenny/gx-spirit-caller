typedef struct { int m[12]; } Mtx;
#define MUL(a,b) ((int)(((long long)(a) * (b)) >> 12))
void func_020111e4(Mtx *a, Mtx *b, Mtx *dst) {
    Mtx tmp;
    Mtx *out = (dst == a || dst == b) ? &tmp : dst;
    out->m[0] = MUL(a->m[0], b->m[0]) + MUL(a->m[3], b->m[1]) + MUL(a->m[6], b->m[2]);
    out->m[1] = MUL(a->m[1], b->m[0]) + MUL(a->m[4], b->m[1]) + MUL(a->m[7], b->m[2]);
    out->m[2] = MUL(a->m[2], b->m[0]) + MUL(a->m[5], b->m[1]) + MUL(a->m[8], b->m[2]);
    out->m[3] = MUL(a->m[0], b->m[3]) + MUL(a->m[3], b->m[4]) + MUL(a->m[6], b->m[5]);
    out->m[4] = MUL(a->m[1], b->m[3]) + MUL(a->m[4], b->m[4]) + MUL(a->m[7], b->m[5]);
    out->m[5] = MUL(a->m[2], b->m[3]) + MUL(a->m[5], b->m[4]) + MUL(a->m[8], b->m[5]);
    out->m[6] = MUL(a->m[0], b->m[6]) + MUL(a->m[3], b->m[7]) + MUL(a->m[6], b->m[8]);
    out->m[7] = MUL(a->m[1], b->m[6]) + MUL(a->m[4], b->m[7]) + MUL(a->m[7], b->m[8]);
    out->m[8] = MUL(a->m[2], b->m[6]) + MUL(a->m[5], b->m[7]) + MUL(a->m[8], b->m[8]);
    out->m[9] = MUL(a->m[0], b->m[9]) + MUL(a->m[3], b->m[10]) + MUL(a->m[6], b->m[11]) + a->m[9];
    out->m[10] = MUL(a->m[1], b->m[9]) + MUL(a->m[4], b->m[10]) + MUL(a->m[7], b->m[11]) + a->m[10];
    out->m[11] = MUL(a->m[2], b->m[9]) + MUL(a->m[5], b->m[10]) + MUL(a->m[8], b->m[11]) + a->m[11];
    if (out == &tmp) *dst = tmp;
}
