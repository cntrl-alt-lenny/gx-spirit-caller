/* CAMPAIGN-PREP candidate for func_021afac8 (ov005, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dst global bound; pointer-bump copy1; indexed copy2; ascending struct stores; 021aaea8 is 1-arg
 *   risk:       copy2 interleaves load/store and addresses elem0 via [base,reg] but the rest via [base,#imm]; mwcc will schedule/address differently. permuter-class scheduling near-miss.
 *   confidence: med
 */
/* func_ov005_021afac8: copy 10 u16-pairs from data_021b158c into a 0x28 stack
 * scratch; if obj[0x20]>6 then clear the 021b1d4c record (021aa4b0), zero its
 * +0, regroup the scratch as 5 records of 4 signed shorts into +0x34.., fill
 * header (+4=obj[0x24], +8=obj[0x20]-6, +0xc=6, +0x10=0), and store
 * 021aaea8(rec) at obj[0x2c]. Returns 1. */
extern char data_ov005_021b1d4c[];
extern char data_ov005_021b158c[];
extern int  func_ov005_021aa4b0(void *);
extern int  func_ov005_021aaea8(void *);

int func_ov005_021afac8(int *obj) {
    char *dst = data_ov005_021b1d4c;
    unsigned short tmp[20];
    {
        unsigned short *s = (unsigned short *)data_ov005_021b158c;
        unsigned short *d = tmp;
        int k = 10;
        do {
            unsigned short a = s[0];
            unsigned short b = s[1];
            s += 2;
            d[0] = a;
            d[1] = b;
            d += 2;
        } while (--k != 0);
    }
    if (obj[8] > 6) {
        int i;
        func_ov005_021aa4b0(dst);
        *(int *)dst = 0;
        i = 0;
        do {
            short v0 = *(short *)((char *)tmp + i * 8 + 0);
            short v1 = *(short *)((char *)tmp + i * 8 + 2);
            short v2 = *(short *)((char *)tmp + i * 8 + 4);
            short v3 = *(short *)((char *)tmp + i * 8 + 6);
            *(short *)(dst + i * 8 + 0x34) = v0;
            *(short *)(dst + i * 8 + 0x36) = v1;
            *(short *)(dst + i * 8 + 0x38) = v2;
            *(short *)(dst + i * 8 + 0x3a) = v3;
            i++;
        } while (i < 5);
        *(int *)(dst + 0x4) = obj[9];
        *(int *)(dst + 0x8) = obj[8] - 6;
        *(int *)(dst + 0xc) = 6;
        *(int *)(dst + 0x10) = 0;
        obj[11] = func_ov005_021aaea8(dst);
    }
    return 1;
}
