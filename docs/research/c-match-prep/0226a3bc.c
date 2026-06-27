/* CAMPAIGN-PREP candidate for func_0226a3bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-pack (u8)lo|((u8)hi<<8)+(u16); bind 1-arg0 once; r in callee-saved across all calls
 *   risk:       Reg-alloc: orig holds arg0=r5,arg1=r7,1-arg0=r6,r=r4 across 3 calls (6-reg save). mwcc's coloring of the 1-arg0 reuse + r live-across may rotate. permuter-class.
 *   confidence: low
 */
/* func_ov002_0226a3bc (ov002, cls C) — guarded orchestrator: bail if the
 * d9c busy-flag is set, else query/post and byte-pack two u16 payloads.
 *   if (*(int*)(d016c+0xd9c)) return 1;
 *   r = func_021bc6c4();  ok = func_021b8fcc(1-arg0, arg1);
 *   if (ok && func_021bd030(arg0) < 0) r = -1;
 *   if (r == -1) func_021de480(1-arg0, arg1, 1, 0);
 *   else func_021d7054((u16)((u8)(1-arg0)|((u8)arg1<<8)),
 *                      (u16)((u8)arg0|((u8)r<<8)));
 *   *(u16*)(d0e6c+0xb0) = (u16)r; (*(int*)(d016c+0xd9c))++; return 0;
 * BYTE-PACK LEVER: (u8)lo|((u8)hi<<8) gives and;and;orr lsl#8 (orig); the
 * outer (u16) adds the lsl#16;lsr#16 narrowing the orig emits before the call. */
typedef unsigned char  u8;
typedef unsigned short u16;
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021b8fcc(int player, int idx);
extern int  func_ov002_021bc6c4(void);
extern int  func_ov002_021bd030(int a);
extern int  func_ov002_021d7054(int a, int b);
extern int  func_ov002_021de480(int a, int b, int c, int d);
int func_ov002_0226a3bc(int arg0, int arg1) {
    int r;
    if (*(int *)(data_ov002_022d016c + 0xd9c) != 0)
        return 1;
    r = func_ov002_021bc6c4();
    if (func_ov002_021b8fcc(1 - arg0, arg1) != 0) {
        if (func_ov002_021bd030(arg0) < 0)
            r = -1;
    }
    if (r == -1) {
        func_ov002_021de480(1 - arg0, arg1, 1, 0);
    } else {
        func_ov002_021d7054((u16)((u8)(1 - arg0) | ((u8)arg1 << 8)),
                            (u16)((u8)arg0 | ((u8)r << 8)));
    }
    *(u16 *)(data_ov002_022d0e6c + 0xb0) = (u16)r;
    (*(int *)(data_ov002_022d016c + 0xd9c))++;
    return 0;
}
