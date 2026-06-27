/* CAMPAIGN-PREP candidate for func_021ba034 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: mla base+0x14-stride :13 field; 0x1a74 sentinel; guarded call cascade
 *   risk:       prologue wants double mla ((a&1)*0x868 fused + b*0x14 fused); &arr[a&1]+b*0x14 may split the *0x868 to mul+add -> 1 insn drift. reshape-able. field@0x30/sentinel struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021ba034 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D/C: mla base = cf16c + (a&1)*0x868 + b*0x14, :13 field@+0x30; 0x1a74 sentinel compare; guarded two-call cascade sharing the r4=id/result reg.
 *   risk:     prologue wants `mla` fusion for (a&1)*0x868+base AND b*0x14+that-base (two mla); modeled via &arr[a&1] + b*0x14 so only the 0x14 product mla-fuses while the *0x868 may split to mul+add -> 1 insn drift. reshape-able. Slot stride 0x14 / field@0x30 / sentinel 0x1a74 struct-guessed.
 *   confidence: low
 */
/* func_ov002_021ba034(a,b): id = (cf16c[a&1] @ b*0x14 + 0x30):13.
 * if (b>4 || id!=0x1a74) return id;
 * r=func_021b4120(a,b,id); if (r==-1) return 0x1a74;
 * if (func_021bd85c(r)==0) return id_slot(=r path); else return r. */
typedef unsigned char u8;
typedef unsigned int  u32;

typedef struct Team { u8 _b[0x868]; } Team;
struct Slot13 { u32 id : 13; };

extern Team data_ov002_022cf16c[];
extern int  func_ov002_021b4120(int a, int b, int id);
extern int  func_ov002_021bd85c(int r);

int func_ov002_021ba034(int a, int b) {
    Team *base = &data_ov002_022cf16c[a & 1];
    u32 id = ((struct Slot13 *)((u8 *)base + b * 0x14 + 0x30))->id;
    int r = (int)id;
    if (b <= 4 && id == 0x1a74) {
        r = func_ov002_021b4120(a, b, (int)id);
        if (r == -1)
            return 0x1a74;
        if (func_ov002_021bd85c(r) == 0)
            return r;
    }
    return r;
}
