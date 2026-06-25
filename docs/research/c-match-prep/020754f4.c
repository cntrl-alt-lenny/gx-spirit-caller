/* CAMPAIGN-PREP candidate for func_020754f4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     faithful full TU (now have complete .s): bind b/raw/h, big-endian byte stores in offset order, signed asr shifts (int h), reload b->_32
 *   risk:       permuter-class: already a confirmed .s wall (brief 302, no C match). ~80 instrs of reg-alloc/scheduling coin-flips (q cursor vs pkt+const, callee-saved h/raw, merged early-returns). Escape path is .s. Also struct-guessed offsets.
 *   confidence: low
 */
/* func_020754f4: packet serializer. CONFIRMED reg-alloc wall (currently
 * ships as src/main/func_020754f4.s, brief 302). Full faithful C below for
 * a permuter target. b=p->_c; raw=b->_820; h=raw?*(int*)raw:0.
 * Builds a packet `pkt` from data_0219eee0 (alloc fn-ptr, _LIT0), writes
 * big-endian fields, frees via data_0219ef0c (_LIT2); data_021a0704 is an
 * int counter (_LIT1) bumped on the _30==0 path. Returns b->_31. */
typedef struct B B;
typedef struct P P;
extern void *data_0219eee0;   /* void* (*)(int)  [_LIT0 alloc] */
extern int   data_021a0704;   /* int counter     [_LIT1] */
extern void *data_0219ef0c;   /* void (*)(void*) [_LIT2 free] */
extern int   func_02077b5c(P *p);
extern void  func_020757e0(void *dst, int n);
extern void  func_02094688(void *a, void *b, int n);
extern void  func_02075d44(B *b, void *p, int n);
extern void  func_020705d4(void *pkt, int len, int z0, int z1, P *p);

int func_020754f4(P *p) {
    char *b = *(char **)((char *)p + 0xc);
    void *raw = *(void **)(b + 0x820);
    int h = (raw != 0) ? *(int *)raw : 0;
    unsigned char *pkt, *q;
    int v, w, len;

    v = func_02077b5c(p);
    *(b + 0x54) = (char)(v >> 24);
    *(b + 0x55) = (char)(v >> 16);
    *(b + 0x56) = (char)(v >> 8);
    *(b + 0x57) = (char)v;
    func_020757e0(b + 0x58, 0x1c);

    pkt = (unsigned char *)((void *(*)(int))data_0219eee0)(h + 0x9d);
    if (pkt == 0) { *(b + 0x455) = 9; return 1; }

    pkt[5] = 2;
    q = pkt + 5;
    q[1] = 0; q[2] = 0; q[3] = 0x46; q[4] = 3; q[5] = 0;
    func_02094688(b + 0x54, q + 6, 0x20);
    q[0x26] = 0x20;

    if (*(unsigned char *)(b + 0x30) != 0) {
        func_02094688(b + 0x74, q + 0x27, 0x20);
        *(b + 0x31) = 1;
        q += 0x47;
    } else {
        func_020757e0(q + 0x27, 0x1c);
        w = data_021a0704;
        q[0x43] = (char)(w >> 24);
        q[0x44] = (char)(w >> 16);
        q[0x45] = (char)(w >> 8);
        q[0x46] = (char)w;
        func_02094688(q + 0x27, b + 0x74, 0x20);
        q += 0x47;
        data_021a0704 = data_021a0704 + 1;
        *(b + 0x31) = 0;
    }

    q[0] = (char)(*(unsigned short *)(b + 0x32) >> 8);
    q[1] = (char)*(unsigned short *)(b + 0x32);
    q[2] = 0;
    q += 3;

    if (*(unsigned char *)(b + 0x31) == 0) {
        if (h != 0) {
            q[0] = 0xb;
            q[1] = (char)((h + 6) >> 16);
            q[2] = (char)((h + 6) >> 8);
            q[3] = (char)(h + 6);
            q[4] = (char)((h + 3) >> 16);
            q[5] = (char)((h + 3) >> 8);
            q[6] = (char)(h + 3);
            q[7] = (char)(h >> 16);
            q[8] = (char)(h >> 8);
            q[9] = (char)h;
            q += 0xa;
            func_02094688(*(void **)((char *)raw + 4), q, h);
            q += h;
        }
        q[0] = 0xe; q[1] = 0; q[2] = 0; q[3] = 0;
        q += 4;
    }

    len = (int)(q - pkt) - 5;
    pkt[0] = 0x16;
    pkt[1] = 3;
    pkt[2] = 0;
    pkt[3] = (char)(len >> 8);
    pkt[4] = (char)len;
    func_02075d44((B *)b, pkt + 5, len);
    func_020705d4(pkt, len + 5, 0, 0, p);
    ((void (*)(void *))data_0219ef0c)(pkt);
    return *(unsigned char *)(b + 0x31);
}
