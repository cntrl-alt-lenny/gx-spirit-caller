/* Ov014_HitTestPrimary: hit-test the primary pointer against the rect at r and,
 * on a hit, latch the rect's payload byte-pair (rect+0xa) into a0->0x30/0x34 and
 * report 1. Bails (0) if a0 is already locked (+0x4) or the pointer is up or
 * outside [x, x+w) x [y, y+h).
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
    unsigned char pad6[4];
    unsigned short attr;
} HitRect;

extern void func_020060f4(int *px, int *py);
extern int func_02006190(void);

int Ov014_HitTestPrimary(int *a0, HitRect *r) {
    int px;
    int py;
    func_020060f4(&px, &py);
    if (a0[1] != 0) {
        return 0;
    }
    if (func_02006190() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        *(int *)((char *)a0 + 0x30) = r->attr & 0xff;
        *(int *)((char *)a0 + 0x34) = (r->attr >> 8) & 0xff;
        return 1;
    }
    return 0;
}
