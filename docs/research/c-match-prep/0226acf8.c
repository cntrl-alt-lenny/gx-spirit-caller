/* CAMPAIGN-PREP candidate for func_0226acf8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store params to globals (word + halfword) then tail call
 *   risk:       DOCUMENTED store-scheduling wall on this sink (brief 356/358): orig groups str,str,strh,strh; mwcc emits str,strh,str,strh. Halfword args must be u16.
 *   confidence: low
 */
/* func_ov002_0226acf8: stash arg0/arg1 into d016c (+0xd94/+0xd98) and the
 * two u16 args into d0e6c (+0xa0/+0xa2), then tail-call 0226ac94. */

extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_0226ac94(void);

void func_ov002_0226acf8(int arg0, int arg1, unsigned short arg2, unsigned short arg3) {
    *(int *)(data_ov002_022d016c + 0xd94) = arg0;
    *(int *)(data_ov002_022d016c + 0xd98) = arg1;
    *(unsigned short *)(data_ov002_022d0e6c + 0xa0) = arg2;
    *(unsigned short *)(data_ov002_022d0e6c + 0xa2) = arg3;
    func_ov002_0226ac94();
}
