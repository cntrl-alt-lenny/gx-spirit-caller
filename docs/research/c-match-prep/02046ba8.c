/* CAMPAIGN-PREP candidate for func_02046ba8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain + byte branch + field stores + calls; sp3 tier
 *   risk:       struct holds *daec base across guard into branch (r2); C may reload. b_2d reload pattern + first-field double-deref must match.
 *   confidence: low
 */
/* func_02046ba8: same prerequisite guard chain as func_02046b3c, then
 * branch on the byte at +0x361 of *data_0219daec. If 0: run init
 * (func_02049038/func_02065e40/func_020466f4) and return 1. Else:
 * set/clear byte +0x2d around func_02062530(*(first field)) and
 * return 0. Guard failure returns -1. sp3 routing.
 *
 *     ... guard chain -> .L_108 on fail (return -1) ...
 *     r2 = *data_0219daec ; r0 = r2->f_24 ; ==5/==6 -> .L_114
 *  .L_114: ldrb r0,[r2,#0x361]; cmp r0,#0; bne .L_148
 *     r1=&data_020ff908; r0=1; r2=0; bl func_02049038
 *     bl func_02065e40; r0=3; bl func_020466f4; return 1
 *  .L_148: r1=1; strb r1,[r2,#0x2d]            ; p->b_2d = 1
 *     r0=*data_0219daec; r0=*(r0); bl func_02062530   ; first field
 *     r1=*data_0219daec; r0=0; strb r0,[r1,#0x2d]; return 0 */

typedef struct state_02046ba8 {
    void          *first;       /* +0x00 (passed to func_02062530) */
    char           _pad0[0x20];
    int            f_24;        /* +0x24 dispatch state */
    char           _pad1[0x8];
    unsigned char  b_2d;        /* +0x2d */
    char           _pad2[0x333];
    unsigned char  b_361;       /* +0x361 */
} state_02046ba8_t;

extern state_02046ba8_t *data_0219daec;
extern char  data_020ff908[];
extern int   func_02045280(void);
extern void  func_020466f4(int v);
extern void  func_02049038(int a, void *b, int c);
extern void  func_02062530(void *p);
extern void  func_02065e40(void);

int func_02046ba8(void) {
    if (data_0219daec == 0) return -1;
    if (func_02045280() != 0) return -1;
    if (data_0219daec->f_24 != 5 && data_0219daec->f_24 != 6) return -1;
    if (data_0219daec->b_361 == 0) {
        func_02049038(1, data_020ff908, 0);
        func_02065e40();
        func_020466f4(3);
        return 1;
    }
    data_0219daec->b_2d = 1;
    func_02062530(data_0219daec->first);
    data_0219daec->b_2d = 0;
    return 0;
}
