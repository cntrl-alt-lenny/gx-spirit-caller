/* CAMPAIGN-PREP candidate for func_02067154 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed :16 byteswap via (short)>>8 asr; ordered tag/sw stores; strcmp==0 guard
 *   risk:       node-deref chain ldr[r4+0xc];ldr[];ldr[] modeled as **(int**)(node+0xC); the +0xC field type and the movs r4 reuse are struct-guessed; r7-hold-of-name across calls may reload — reshape-able(bind).
 *   confidence: low
 */
/* func_02067154 @ 0x02067154  (cls D, main) — 16-bit signed byteswap into dst+2,
   tag byte at dst+1, then resolve an id into dst+4 with strcmp/lookup fallback.
   func_02054c0c returns int(or -1); func_020aaf40 == strcmp; func_0206ebe8 returns a node ptr.
   arg3 is an int* out-param. */
typedef unsigned char  u8;
typedef unsigned short u16;

extern const char data_02101784[];
extern int   func_02054c0c(const char *name);
extern void *func_0206ebe8(const char *name);
extern int   func_020aaf40(const char *a, const char *b); /* strcmp */

typedef struct Rec {
    u8  b0;
    u8  tag;   /* +1 */
    u16 sw;    /* +2 */
    int id;    /* +4 */
} Rec;

int func_02067154(const char *name, short v, Rec *dst, int *out)
{
    int node;
    int hi = ((int)v >> 8) & 0xFF;
    int lo = ((int)v << 8) & 0xFF00;

    dst->tag = 2;
    dst->sw  = (u16)(hi | lo);

    node = 0;
    if (name == 0) {
        dst->id = 0;
    } else {
        dst->id = func_02054c0c(name);
    }

    if (dst->id == -1) {
        if (func_020aaf40(name, data_02101784) != 0) goto done;
        node = (int)func_0206ebe8(name);
        if (node == 0) return 0;
        dst->id = **(int **)(node + 0xC);
    }
done:
    if (out != 0) *out = node;
    return 1;
}
