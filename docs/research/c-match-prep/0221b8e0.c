/* CAMPAIGN-PREP candidate for func_0221b8e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :6 f2 slice cmp==2 branch; mla base+0x18+0x400+r4*4; movs/bmi sign-test; nested guard calls
 *   risk:       reshape-able: orig binds self in r5 across many ldrh and computes the call address with mla then +0x18,+0x400,+r4<<2; if mwcc reloads self or folds the address constants in a different order the ldr/add sequence diverges. movs r4,r0;bmi needs (r4=...)<0 signed test.
 *   confidence: low
 */
/* func_ov002_0221b8e0 (ov002, class D, MED) — UNVERIFIED build-free draft.
 * if f2 6-bit slice == 2: validate (021ff3bc), resolve slot (021b99b4 -> r4,
 * signed >=0), legality (021c33e4), then 0227ac64 with an mla cell address.
 * else: pack-and-dispatch via 021e276c.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CmdEvt {
    u16 f0;
    u16 owner : 1;        /* bit0  */
    u16 _b1_4 : 5;
    u16 s6 : 6;           /* bits6-11 (lsl20;lsr26) */
    u16 _r2 : 4;
    u16 f4;
};

extern int data_ov002_022d016c[];    /* +0xcec int */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021b99b4(int a, int b);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_021e276c(int a, int b, int c, int d);
extern int func_ov002_021ff3bc(void);
extern int func_ov002_0227ac64(int a, void *b, int c, int d, u32 e);

int func_ov002_0221b8e0(struct CmdEvt *self)
{
    int owner = self->owner;
    if (self->s6 != 2) {
        int pk = (*(int *)((char *)data_ov002_022d016c + 0xcec) == owner) ? 1 : 0;
        pk = (((pk + 1) & 0xff) << 4) | 1;
        func_ov002_021e276c(owner, self->f0, (u16)pk,
                            (int)((self->f4 << 0x11) >> 0x17));
        return 0;
    }
    if (func_ov002_021ff3bc() == 0)
        return 0;
    {
        int r4 = func_ov002_021b99b4(owner, (int)((self->f4 << 0x11) >> 0x17));
        if (r4 < 0)
            return 0;
        if (func_ov002_021c33e4(owner, owner, r4) == 0)
            return 0;
        {
            char *cell = data_ov002_022cf16c + owner * 0x868 + 0x18 + 0x400 + r4 * 4;
            func_ov002_0227ac64(owner, cell, 1, 1, (u32)(self->f0 << 0x10));
        }
    }
    return 0;
}
