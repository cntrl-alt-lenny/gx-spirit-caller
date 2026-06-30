/* CAMPAIGN-PREP candidate for func_020534ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-record + hash + mask; long-long (ptr,hash) return
 *   risk:       work buffer size 0x100 vs rec at sp[0] layout must match; reg-alloc-walled per .s header; ptr->u32 cast may add a mov
 *   confidence: low
 */
/* func_020534ec: build a small stack record {self, arg1}, hash 8 bytes of it,
 * mask the result to 7 bits, and return a 64-bit (self, hash) pair.
 *   func_020a67ec(work, 7);                 // seed/init 'work' (size 0x100)
 *   h = func_020a6660(work, &rec, 8) & 0x7f;
 *   return ((u64)h << 32) | (u32)self;      // r0=self, r1=h
 * (Flagged reg-alloc-walled in ship-as-.s; best-effort reshape.) */

typedef struct {
    void *self;   /* sp[0] */
    int   arg1;   /* sp[4] */
} rec_t;

extern void         func_020a67ec(void *work, int k);
extern unsigned int func_020a6660(void *work, void *data, int len);

unsigned long long func_020534ec(void *self, int arg1) {
    unsigned char work[0x100];
    rec_t rec;
    rec.self = self;
    rec.arg1 = arg1;
    func_020a67ec(work, 7);
    {
        unsigned int h = func_020a6660(work, &rec, 8) & 0x7f;
        return ((unsigned long long)h << 32) | (unsigned int)(unsigned long)self;
    }
}
