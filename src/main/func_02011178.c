typedef struct {
    int m[12];
} Mtx;

void func_02011178(Mtx *src, Mtx *dst) {
    if (src == dst) {
        return;
    }
    dst->m[0] = src->m[0];
    dst->m[1] = src->m[1];
    dst->m[2] = src->m[2];
    dst->m[3] = src->m[3];
    dst->m[4] = src->m[4];
    dst->m[5] = src->m[5];
    dst->m[6] = src->m[6];
    dst->m[7] = src->m[7];
    dst->m[8] = src->m[8];
    dst->m[9] = src->m[9];
    dst->m[10] = src->m[10];
    dst->m[11] = src->m[11];
}
