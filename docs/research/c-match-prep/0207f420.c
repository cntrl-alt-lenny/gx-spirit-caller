/* CAMPAIGN-PREP candidate for func_0207f420 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Straight-line call sequence, arg order val/dest/size per sibling
 *   risk:       prologue (sub sp,#4) implies legacy_sp3 routing; pool dedup of repeated literals (0xffff, 0xc0) must mirror orig
 *   confidence: high
 */
/* func_0207f420: nine straight-line fill calls.
 *
 *   func_0209448c(val, dest, size) -- val=r0, dest=r1, size=r2
 *   (confirmed by sibling func_0207f8a0.c).
 *
 *   (0xc0,   data_021a09f4, 0x400)
 *   (0xc0,   data_021a0f34, 0x400)
 *   (0xc0,   data_021a1474, 0x400)
 *   (0xffff, data_021a08f4, 0x100)
 *   (0xffff, data_021a0e34, 0x100)
 *   (0xffff, data_021a1374, 0x100)
 *   (0xffff, data_021a0df4, 0x40)
 *   (0xffff, data_021a1334, 0x40)
 *   (0xffff, data_021a1874, 0x40)
 *
 * stmfd{lr}+sub sp,#4 prologue => legacy_sp3 routing (*.legacy_sp3.c).
 */

extern void func_0209448c(int val, void *dest, unsigned int size);

extern char data_021a08f4[];
extern char data_021a09f4[];
extern char data_021a0df4[];
extern char data_021a0e34[];
extern char data_021a0f34[];
extern char data_021a1334[];
extern char data_021a1374[];
extern char data_021a1474[];
extern char data_021a1874[];

void func_0207f420(void) {
    func_0209448c(0xc0,   data_021a09f4, 0x400);
    func_0209448c(0xc0,   data_021a0f34, 0x400);
    func_0209448c(0xc0,   data_021a1474, 0x400);
    func_0209448c(0xffff, data_021a08f4, 0x100);
    func_0209448c(0xffff, data_021a0e34, 0x100);
    func_0209448c(0xffff, data_021a1374, 0x100);
    func_0209448c(0xffff, data_021a0df4, 0x40);
    func_0209448c(0xffff, data_021a1334, 0x40);
    func_0209448c(0xffff, data_021a1874, 0x40);
}
