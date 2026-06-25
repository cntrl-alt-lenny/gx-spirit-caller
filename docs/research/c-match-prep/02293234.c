/* CAMPAIGN-PREP candidate for func_02293234 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain of :1 bitfield-arg calls, literal codes, bool
 *   risk:       helper sigs (bit,code) guessed; 021bbf50 mid-guard beq->fallthrough to .L_7c; >0 vs >=1 tail
 *   confidence: med
 */
/* func_ov002_02293234: if(h1(bit0,0x16a0)) return 1; if(h2(bit0)){ if(h3(bit0,0x18ca)) return 1; if(h4(bit0)>0) return 1; } return 0. */

struct F02293234_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02293234_Self { unsigned short f0; struct F02293234_F2 f2; };

extern int func_ov002_021bbd14(unsigned int bit, int code);
extern int func_ov002_021bbf50(unsigned int bit);
extern int func_ov002_021c3ae4(unsigned int bit, int code);
extern int func_ov002_02280980(unsigned int bit);

int func_ov002_02293234(struct F02293234_Self *self) {
    if (func_ov002_021bbd14(self->f2.bit0, 0x16a0) != 0)
        return 1;
    if (func_ov002_021bbf50(self->f2.bit0) != 0) {
        if (func_ov002_021c3ae4(self->f2.bit0, 0x18ca) != 0)
            return 1;
        if (func_ov002_02280980(self->f2.bit0) > 0)
            return 1;
    }
    return 0;
}
