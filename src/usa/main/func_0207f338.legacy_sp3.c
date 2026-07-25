/* CAMPAIGN-PREP candidate for func_0207f338 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Straight-line call sequence, arg order val/dest/size per sibling
 *   risk:       prologue (sub sp,#4) implies legacy_sp3 routing; pool dedup of repeated literals (0xffff, 0xc0) must mirror orig
 *   confidence: high
 */
/* func_0207f338: nine straight-line fill calls.
 *
 *   func_02094398(val, dest, size) -- val=r0, dest=r1, size=r2
 *   (confirmed by sibling func_0207f7b8.c).
 *
 *   (0xc0,   data_021a0914, 0x400)
 *   (0xc0,   data_021a0e54, 0x400)
 *   (0xc0,   data_021a1394, 0x400)
 *   (0xffff, data_021a0814, 0x100)
 *   (0xffff, data_021a0d54, 0x100)
 *   (0xffff, data_021a1294, 0x100)
 *   (0xffff, data_021a0d14, 0x40)
 *   (0xffff, data_021a1254, 0x40)
 *   (0xffff, data_021a1794, 0x40)
 *
 * stmfd{lr}+sub sp,#4 prologue => legacy_sp3 routing (*.legacy_sp3.c).
 */

extern void func_02094398(int val, void *dest, unsigned int size);

extern char data_021a0814[];
extern char data_021a0914[];
extern char data_021a0d14[];
extern char data_021a0d54[];
extern char data_021a0e54[];
extern char data_021a1254[];
extern char data_021a1294[];
extern char data_021a1394[];
extern char data_021a1794[];

void func_0207f338(void) {
    func_02094398(0xc0,   data_021a0914, 0x400);
    func_02094398(0xc0,   data_021a0e54, 0x400);
    func_02094398(0xc0,   data_021a1394, 0x400);
    func_02094398(0xffff, data_021a0814, 0x100);
    func_02094398(0xffff, data_021a0d54, 0x100);
    func_02094398(0xffff, data_021a1294, 0x100);
    func_02094398(0xffff, data_021a0d14, 0x40);
    func_02094398(0xffff, data_021a1254, 0x40);
    func_02094398(0xffff, data_021a1794, 0x40);
}
