/* CAMPAIGN-PREP candidate for func_02075928 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     faithful full TU (now have complete .s): unsigned status (bcc/hi compares), reuse one stack slot, common b->_455-return tail
 *   risk:       permuter-class: confirmed .s wall (brief 302). r6 reused (stack-buf ptr then alloc result), merged conditional early-returns each reload b->_455, and the do/poll-loop entry resist a stable C lowering. Escape path is .s. struct-guessed offsets.
 *   confidence: low
 */
/* func_02075928: receive/dispatch poll loop. CONFIRMED reg-alloc wall
 * (ships as src/main/func_02075928.s, brief 302). Full faithful C for a
 * permuter target. b=p->_c. status=sp word, msg=func_02070ac0 return.
 * data_0219eee0=alloc fn-ptr (_LIT0), data_0219ef0c=free fn-ptr (_LIT1),
 * _LIT2 is the literal 0x4805 length cap. Two arms on msg[0]==0x80.
 * Returns b->_455 (reloaded at the common .L_c74 tail). */
typedef struct B B;
typedef struct P P;
extern void *data_0219eee0;   /* void* (*)(int)  [_LIT0 alloc] */
extern void *data_0219ef0c;   /* void (*)(void*) [_LIT1 free] */
extern void  func_02070980(int a, P *p, int b);
extern void *func_02070ac0(unsigned *out, P *p);
extern void  func_02075ae8(B *b, void *buf);
extern void  func_02075d44(B *b, void *buf, unsigned n);
extern int   func_02075d74(void *buf, unsigned n, P *p);
extern void  func_02076b74(B *b, void *q);

int func_02075928(P *p) {
    char *b = *(char **)((char *)p + 0xc);
    unsigned status;
    unsigned char *msg, *buf;

    do {
        msg = (unsigned char *)func_02070ac0(&status, p);
        if (status == 0) { *(b + 0x455) = 9; return *(unsigned char *)(b + 0x455); }
    } while (status < 5);

    if (msg[0] == 0x80) {
        if (*(unsigned char *)(b + 0x454) == 0 || *(unsigned char *)(b + 0x455) != 0) {
            *(b + 0x455) = 9;
        } else {
            status = msg[1];
            func_02070980(2, p, msg[1]);
            buf = (unsigned char *)((void *(*)(int))data_0219eee0)(status);
            if (buf == 0) { *(b + 0x455) = 9; return *(unsigned char *)(b + 0x455); }
            if (func_02075d74(buf, status, p) != 0 || buf[0] != 1)
                *(b + 0x455) = 9;
            else
                func_02076b74((B *)b, buf + 1);
            func_02075d44((B *)b, buf, status);
            ((void (*)(void *))data_0219ef0c)(buf);
        }
    } else {
        status = msg[4] + (msg[3] << 8) + 5;
        if (status > 0x4805) { *(b + 0x455) = 9; return *(unsigned char *)(b + 0x455); }
        buf = (unsigned char *)((void *(*)(int))data_0219eee0)(status);
        if (buf == 0) { *(b + 0x455) = 9; return *(unsigned char *)(b + 0x455); }
        if (func_02075d74(buf, status, p) != 0) {
            ((void (*)(void *))data_0219ef0c)(buf);
            *(b + 0x455) = 9;
            return *(unsigned char *)(b + 0x455);
        }
        func_02075ae8((B *)b, buf);
    }
    return *(unsigned char *)(b + 0x455);
}
