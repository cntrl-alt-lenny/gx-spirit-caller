/* CAMPAIGN-PREP candidate for func_0200bff4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     find-slot scan (break on <0 or ==key) + struct-assign (ldm/stm) + field overwrite
 *   risk:       scan induction may start at base+0xbc(off 0x20) not base(off 0xdc); slot layout 0x24/key@0x20 guessed
 *   confidence: med
 */
/* func_0200bff4 — find first free/matching slot (stride 0x24, max 8) then 32-byte struct copy.
   slot key at +0xdc (=base+0xbc + 0x20); data at +0xbc; data.w[6] (+0x18) <- a2; key <- key. */

struct Payload { int w[8]; };          /* 0x20 */
struct Slot    { struct Payload data;  /* 0x00 */ int key; /* 0x20 */ };  /* 0x24 */

int func_0200bff4(char *base, int key, int a2, struct Payload *src)
{
    struct Slot *slots = (struct Slot *)(base + 0xbc);
    int i = 0;
    while (i < 8) {
        int k = slots[i].key;
        if (k < 0)
            break;
        if (key == k)
            break;
        i++;
    }
    if (i == 8)
        return 0;
    slots[i].data = *src;
    slots[i].data.w[6] = a2;
    slots[i].key = key;
    return 1;
}
