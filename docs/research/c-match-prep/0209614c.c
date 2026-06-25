/* CAMPAIGN-PREP candidate for func_0209614c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     list insert/unlink; compute ip=idx*8 once reuse as base+0x18+ip; tail store-order (class C)
 *   risk:       orig computes `ip = idx<<3` once then reuses it (ip = (base+0x18)+ip); if mwcc recomputes idx*8 for each of b/self the address math diverges. tail stores at .L_188 must keep asm order (load node->next into [b+0x1c] BEFORE writing self into [node+0x18]). struct-guessed. permuter-class on ip reuse.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0209614c (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  list insert/unlink; pointer reg-alloc shuffle; bind ip=idx*8 early
 *   class C: ip = r5<<3 computed once then reused as r1+ip; store-order at tail
 * struct-guessed: bucket array stride 8 at base+0x18: {head@0x18, val@0x1c}; node next@0x4, link@0x18.
 */
/* func_0209614c: r6=base, r5=idx, r4=node.
 *   func_020952e4();
 *   b = &base[idx]  (base + idx*8); head = *(void**)((char*)b+0x18);
 *   if (head != 0){
 *       if (node == head){ func_020952d0(); return; }
 *       self = base+0x18 + idx*8;
 *       p = *(void**)((char*)head+0x18);
 *       if (self == p){
 *           *(void**)((char*)head+0x18) = *(void**)((char*)b+0x1c);
 *           func_020928e8(*(void**)((char*)b+0x18), 0x3c);   (r0=[b+0x18])
 *       } else {
 *           while (p && *(void**)((char*)p+4) != self) p = *(void**)((char*)p+4);
 *           *(void**)((char*)p+4) = *(void**)((char*)b+0x1c);
 *           func_020928e8(p, 8);
 *       }
 *   }
 *   // insert at head of node's bucket
 *   *(void**)((char*)b+0x1c) = *(void**)((char*)node+0x18);   (next chain)
 *   *(void**)((char*)node+0x18) = base+0x18 + idx*8;
 *   func_020952d0();
 *   func_020928e8(base, 0x3c);
 *   func_020928e8(node, 0x3c);
 * NOTE store-order at .L_188: load [node+0x18] -> [b+0x1c], then store
 * (base+0x18+idx*8) -> [node+0x18]; emit in this order. */

extern void func_020928e8(void *p, int len);
extern void func_020952d0(void);
extern void func_020952e4(void);

void func_0209614c(unsigned char *base, int idx, unsigned char *node)
{
    unsigned char *b = base + idx * 8;
    unsigned char *self = base + 0x18 + idx * 8;
    unsigned char *head;

    func_020952e4();
    head = *(unsigned char **)(b + 0x18);
    if (head != 0) {
        if (node == head) {
            func_020952d0();
            return;
        }
        {
            unsigned char *p = *(unsigned char **)(head + 0x18);
            if ((void *)self == (void *)p) {
                *(void **)(head + 0x18) = *(void **)(b + 0x1c);
                func_020928e8(*(void **)(b + 0x18), 0x3c);
            } else {
                while (p != 0 && *(void **)(p + 4) != (void *)self)
                    p = *(unsigned char **)(p + 4);
                *(void **)(p + 4) = *(void **)(b + 0x1c);
                func_020928e8(p, 8);
            }
        }
    }
    *(void **)(b + 0x1c) = *(void **)(node + 0x18);
    *(void **)(node + 0x18) = self;
    func_020952d0();
    func_020928e8(base, 0x3c);
    func_020928e8(node, 0x3c);
}
