/* CAMPAIGN-PREP candidate for func_021c4028 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MIN/MAX clamp; if-guard + while; reload rec each test
 *   risk:       ret-flag codegen / the doubled cmp;bcc guard may collapse to one; rec[0] reload vs hold could flip.
 *   confidence: med
 */
/* func_ov006_021c4028: two-way clamp of rec[0] into [0,6). idx = p->f_64;
 * rec = (int*)(p + 0x9c + idx*16) (rec[0]=value, rec[1]=counterpart). ret=0;
 * if value<0 { ret=1; while(value<0){ rec[0]++; rec[1]--; } }
 * if value>=6 { ret=1; while(value>=6){ rec[0]--; rec[1]++; } } return ret.
 * The doubled cmp;bge / cmp;bxlt is the if-guard then while-guard pair. */

int func_ov006_021c4028(char *p) {
    int idx = *(int *)(p + 0x64);
    int *rec = (int *)(p + 0x9c + idx * 16);
    int ret = 0;
    if (rec[0] < 0) {
        ret = 1;
        while (rec[0] < 0) { rec[0]++; rec[1]--; }
    }
    if (rec[0] >= 6) {
        ret = 1;
        while (rec[0] >= 6) { rec[0]--; rec[1]++; }
    }
    return ret;
}
