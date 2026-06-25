/* CAMPAIGN-PREP candidate for func_02222068 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16 guard; orr-store; bind tmp; asym-shift field; dual-bitfield reload
 *   risk:       arg-eval scheduling of the 3 shift extracts; tmp must stay bound (not reload f4)
 *   confidence: med
 */
/* func_ov002_02222068: if u16@0xc(arg0)==0 return 0; OR a 4-bit flag into
 * arg1->f4, then 021d8904(b0,b1_5 of arg1->f2, 9-bit field of new f4) and
 * 021de4b0(arg0, b0,b1_5 of arg1->f2 reloaded). Returns 0. */
typedef unsigned short u16;
extern void func_ov002_021d8904(int a, int b, int c);
extern int  func_ov002_021de4b0(void *self, int a, int b);

struct N22068 { u16 _0; u16 b0:1; u16 b1_5:5; u16 :10; u16 f4; };

int func_ov002_02222068(void *arg0, struct N22068 *arg1) {
    int tmp;
    if (*(u16 *)((char *)arg0 + 0xc) == 0) return 0;
    tmp = arg1->f4 | 4;
    arg1->f4 = tmp;
    func_ov002_021d8904(arg1->b0, arg1->b1_5, (unsigned)(tmp << 17) >> 23);
    func_ov002_021de4b0(arg0, arg1->b0, arg1->b1_5);
    return 0;
}
