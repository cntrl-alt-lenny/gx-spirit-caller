/* CAMPAIGN-PREP candidate for func_0201bf04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Copy32 marshalling + flag set/clear (orr/bic #2) around call, field return
 *   risk:       Copy32 arg order (dest,src,len) and offsets 0x810/0x8e0/+8 assumed; reload of w->0x8e0 kept by saved r4.
 *   confidence: med
 */
/* func_0201bf04: Copy32 into syswork + flag toggle around a callback.
 *   a = r5; w = GetSystemWork() (r4);
 *   Copy32(w+0x810, a, 0x20);   (dest, src, len)
 *   *(int*)(w+0x8e0) |= 2;
 *   func_0201bddc(a);
 *   *(int*)(w+0x8e0) &= ~2;
 *   return *(int*)(a + 8);
 */

extern char *GetSystemWork(void);
extern void Copy32(void *dest, void *src, int len);
extern void func_0201bddc(void *a);

int func_0201bf04(char *a) {
    char *w = GetSystemWork();
    Copy32(w + 0x810, a, 0x20);
    *(int *)(w + 0x8e0) |= 2;
    func_0201bddc(a);
    *(int *)(w + 0x8e0) &= ~2;
    return *(int *)(a + 8);
}
