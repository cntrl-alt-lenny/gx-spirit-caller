/* CAMPAIGN-PREP candidate for func_0201c9b4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     scan loop, first-free if-assign, ldmia struct-copy, mla index
 *   risk:       orig holds data_0219060c base in r9 walked +=0xc0 across scan AND reloads it for mla copy; if mwcc CSEs the walking base or strength-reduces the *0xc0 mla, the index math + ldr scheduling diverge. permuter-class
 *   confidence: low
 */
/* func_0201c9b4: insert 0xc0-byte record if not already present.
 * Scans 0x20 flag slots (data_0218ff8c, 1 word each). Empty slot (flag==0)
 * remembers first-free index; occupied slot memcmps +4 for 0xc bytes against
 * the candidate -- if equal, already present, returns early. On miss with a
 * free slot found: func_0202048c(rec) then copy 0xc0 bytes into
 * records[slot], flag=0x96. record stride 0xc0 at data_0219060c.
 */
typedef struct { unsigned char b[0xc0]; } Rec;
extern Rec  data_0219060c[];
extern int  data_0218ff8c[];
extern int  func_020a7440(void *a, void *b, int n);   /* memcmp-like */
extern void func_0202048c(void *rec);

int func_0201c9b4(unsigned char *rec)
{
    int free = -1;
    int i;
    Rec *base = data_0219060c;
    for (i = 0; i < 0x20; i++, base++) {
        if (data_0218ff8c[i] == 0) {
            if (free < 0) free = i;
        } else if (func_020a7440((unsigned char *)base + 4, rec + 4, 0xc) == 0) {
            return 0;
        }
    }
    if (free < 0) return 0;
    func_0202048c(rec);
    {
        int *s = (int *)rec;
        int *d = (int *)&data_0219060c[free];
        int n;
        for (n = 0xc; n != 0; n--) { d[0]=s[0]; d[1]=s[1]; d[2]=s[2]; d[3]=s[3]; d+=4; s+=4; }
    }
    data_0218ff8c[free] = 0x96;
    return 0;
}
