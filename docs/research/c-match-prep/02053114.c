/* CAMPAIGN-PREP candidate for func_02053114 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clean compute + cmp-returning-bool (moveq/movne)
 *   risk:       f_3c offset guessed; 0x400 buffer must stay one array (not split); poly literal pool placement
 *   confidence: high
 */
/* func_02053114: CRC compute over self then compare to stored field.
 *   func_020a67cc(buf, 0xedb88320);            // build/seed CRC table
 *   crc = func_020a66e8(buf, self, 0x3c);      // compute over 0x3c bytes
 *   return crc == self->f_3c;                  // moveq/movne bool
 * 0x400-byte stack buffer; r4 holds self across both calls. */

typedef struct {
    char         _pad[0x3c];
    unsigned int f_3c;        /* 0x3c */
} obj_t;

extern void         func_020a67cc(void *buf, unsigned int poly);
extern unsigned int func_020a66e8(void *buf, void *data, int len);

int func_02053114(obj_t *self) {
    unsigned char buf[0x400];
    func_020a67cc(buf, 0xedb88320u);
    return func_020a66e8(buf, self, 0x3c) == self->f_3c;
}
