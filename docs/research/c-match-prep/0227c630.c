/* CAMPAIGN-PREP candidate for func_0227c630 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     0x868-stride u32 cell, mul, gt-compare bool (movgt/movle)
 *   risk:       `return a>b` may add movle (matches) but operand order of cmp (cell vs pre*500) must keep cell first
 *   confidence: med
 */
/* func_ov002_0227c630: return table[arg0&1] > pre(0x132c)*500.
 *   table = data_022cf16c indexed (arg0&1)*0x868 (u32 cell).
 *
 *   r4=arg0; ldr r0,=0x132c; bl 021bb068
 *   and r3,r4,#1; mul ip,r3,#0x868; ldr r0,[data_022cf16c,ip]
 *   mul r1,r0(pre),#0x1f4
 *   cmp r0(cell),r1; movgt#1; movle#0; pop
 */
extern char data_ov002_022cf16c[];
extern int func_ov002_021bb068(int a);

int func_ov002_0227c630(int arg0) {
    int pre = func_ov002_021bb068(0x132c);
    int cell = *(int *)((char *)data_ov002_022cf16c + (arg0 & 1) * 0x868);
    return cell > pre * 500;
}
