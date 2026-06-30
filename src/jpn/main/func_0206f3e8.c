/* CAMPAIGN-PREP candidate for func_0206f3e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     post-indexed *p++ byte-skip loop, pointer return
 *   risk:       loop rotation / cmp placement may differ; `p+1` then return vs in-place ++ could reorder the add; do-while vs while head
 *   confidence: med
 */
/* func_0206f3e8 (main, class A): tiny byte-stream skip scanner, leaf.
 * Post-indexed loads; returns advanced char* pointer.
 *
 *   ldrb r2,[r0],#1; if(r2==0) return r0;        first byte, advance
 *   loop:
 *     if((r2 & 0xc0)==0xc0) { r0++; return r0; }  2-byte tag: skip 1, stop
 *     r0 += r2;                                    skip r2 bytes
 *     ldrb r2,[r0],#1; if(r2!=0) loop;
 *   return r0;
 *
 * The post-increment ldrb means `*p++` reads then advances. Writing the
 * loop with `c = *p++` at top and the (c&0xc0)==0xc0 early-out inside
 * reproduces the single-load-per-iter shape.
 */

unsigned char *func_0206f3e8(unsigned char *p)
{
    unsigned char c;

    c = *p++;
    if (c == 0)
        return p;

    do {
        if ((c & 0xc0) == 0xc0)
            return p + 1;
        p += c;
        c = *p++;
    } while (c != 0);

    return p;
}
