/* CAMPAIGN-PREP candidate for func_020a078c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     db88(2,7,9) guard + 2 range guards + 2 calls + de5c + dd30 varargs
 *   risk:       Heavy: db88 3-arg varargs, dd30 vararg buffer with ldrh[sp,#0x20]/ldrb[sp,#0x24] (5th/6th args) + global reload order — stack/reg layout very likely differs.
 *   confidence: low
 */
/* func_020a078c: db88(2,7,9) guard; require p1!=0 and p2<=0x70 (else 6);
 * func_020944a4(p1, &data, p2); func_020928e8(&data, p2);
 * de5c(0x18,p0); dd30(0x18, 5, p3, p5(u16), p6(u8), &data, p2). */

extern unsigned char data_021a97c0;
extern int  func_020928e8(void *p, int len);
extern void func_020944a4(void *dst, void *src, int len);
extern int  func_0209db88(int a, int b, int c);
extern void func_0209de5c(int code, int handle);
extern int  func_0209dd30(int code, int count, ...);

int func_020a078c(int p0, int p1, int p2, int p3, int p5, int p6) {
    int r = func_0209db88(2, 7, 9);
    if (r != 0) return r;
    if (p1 == 0) return 6;
    if ((unsigned)p2 > 0x70) return 6;
    func_020944a4((void *)p1, &data_021a97c0, p2);
    func_020928e8(&data_021a97c0, p2);
    func_0209de5c(0x18, p0);
    r = func_0209dd30(0x18, 5, p3, (unsigned short)p5, (unsigned char)p6, &data_021a97c0, p2);
    return r == 0 ? 2 : r;
}
