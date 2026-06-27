/* CAMPAIGN-PREP candidate for func_02232c84 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit lsl/lsr field extracts; slot*0x14 record stride; inline mla base; if-guard early tail
 *   risk:       rec record decode (rec>>22&0xff)*2+(rec>>13&1) and the 0x868/0x30/0x14 strides are struct-guessed; if real record is a bitfield struct the shift sequence reorders. struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02232c84 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. card@r0: attr=u16@+2, attr4=u16@+4.
 * guard (attr>>6)&0x3f==5 else tail 0221074c(card).
 * rec=*(int*)(cf16c + (attr&1)*0x868 + 0x30 + slot*0x14), slot=(attr>>1)&0x1f.
 * compare (attr4>>8)&0x1ff == ((rec>>22)&0xff)*2 + ((rec>>13)&1); on eq
 * 021de480(attr&1, slot, 0, 0). All extracts explicit shifts (no bitfield struct). */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern int  func_ov002_021de480(int, int, int, int);
extern int  func_ov002_0221074c(void *);

int func_ov002_02232c84(void *cardv) {
    u16 *base = (u16 *)cardv;
    u16 attr = base[1];
    int parity, slot;
    u16 attr4;
    int rec;

    if (((attr >> 6) & 0x3f) != 5)
        return func_ov002_0221074c(cardv);

    parity = attr & 1;
    slot   = (attr >> 1) & 0x1f;
    attr4  = base[2];
    rec = *(int *)(data_ov002_022cf16c + parity * 0x868 + 0x30 + slot * 0x14);
    if (((attr4 >> 8) & 0x1ff) != ((rec >> 22) & 0xff) * 2 + ((rec >> 13) & 1))
        return 0;
    func_ov002_021de480(parity, slot, 0, 0);
    return 0;
}
