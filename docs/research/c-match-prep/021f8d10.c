/* CAMPAIGN-PREP candidate for func_021f8d10 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=e; if/else-if state(0,1,default); f0:1; nested if==1 dispatch
 *   risk:       the inner `cmp r1,#1 / bne` on data_cd744[f0] picks func_02290500 vs func_022592ec; switch/if lowering of the outer step ladder must stay cmp#0/cmp#1 (no jump table). reshape-able (if/else-if not switch).
 *   confidence: med
 */
typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
};

struct State { unsigned char pad[0x5b4]; int step; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
struct Blk { unsigned char pad[0xd70]; int d70; unsigned char pad2[4]; int d78; };
extern struct Blk data_ov002_022d016c;

extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021d7c40(int a, int b);
extern int func_ov002_022107b4(void);
extern void func_ov002_022592ec(void *fn);
extern int func_ov002_022593f4(void);
extern void func_ov002_02290500(int one, int two, void *fn);

int func_ov002_021f8d10(struct Entity *e)
{
    if (data_ov002_022ce288.step == 0) {
        func_ov002_021ae400(e->f0, 0x3a);
        if (data_ov002_022cd744[e->f0] == 1)
            func_ov002_02290500(0, 2, func_ov002_022107b4);
        else
            func_ov002_022592ec(func_ov002_022107b4);
        data_ov002_022ce288.step += 1;
        return 0;
    }
    if (data_ov002_022ce288.step == 1) {
        if (func_ov002_022593f4() != 0) {
            func_ov002_021d7c40(data_ov002_022d016c.d70, data_ov002_022d016c.d78);
            return 1;
        }
        data_ov002_022ce288.step -= 1;
        return 0;
    }
    return 0;
}
