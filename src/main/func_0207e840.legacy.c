/* func_0207e840: position the cursor at the first or last 8-byte record of
 * the segment (by direction), clear fc and continue with func_0207e92c. */
typedef struct {
    unsigned short first;
    unsigned short last;
    int _pad_04;
    int _pad_08;
    int *recs;
} Seg;
typedef struct {
    int *cur;
    int dir;
    int _pad_08;
    int fc;
    int len;
    int _pad_14;
    Seg *seg;
} Obj;
extern int func_0207e92c(Obj *o, int arg);

int func_0207e840(Obj *o, int unused) {
    if ((o->len > 0) ^ o->dir) {
        o->cur = (int *)((char *)o->seg->recs + (o->seg->last << 3));
    } else {
        o->cur = (int *)((char *)o->seg->recs + (o->seg->first << 3) - 8);
    }
    o->fc = 0;
    return func_0207e92c(o, 0);
}
