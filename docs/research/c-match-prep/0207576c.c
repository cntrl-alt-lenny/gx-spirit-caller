/* CAMPAIGN-PREP candidate for func_0207576c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ disable/restore bracket; addr-passed header reloaded; trailing flag store
 *   risk:       builder array size/alignment fixes frame 0x60; payload/len arg types affect nothing in encoding
 *   confidence: high
 */
/* func_0207576c: IRQ-bracketed serialize of a record into a 0x60-byte
 * scratch builder. Inits the builder, then under an IRQ lock appends a
 * 0x14-byte header (data_021a0708) and the caller's payload, finalizes,
 * releases the lock, and raises the dirty flag data_021a0700.
 */
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern unsigned char data_021a0708[];   /* header template, passed by address */
extern unsigned char data_021a0700;     /* dirty flag (u8) */
extern void func_020785cc(void *builder);
extern void func_0207850c(void *builder, const void *src, int len);
extern void func_02078498(void *builder, const void *src);

void func_0207576c(const void *payload, int len) {
    unsigned char builder[0x60];
    int saved;

    func_020785cc(builder);
    saved = OS_DisableIrq();
    func_0207850c(builder, data_021a0708, 0x14);
    func_0207850c(builder, payload, len);
    func_02078498(builder, data_021a0708);
    OS_RestoreIrq(saved);
    data_021a0700 = 1;
}
