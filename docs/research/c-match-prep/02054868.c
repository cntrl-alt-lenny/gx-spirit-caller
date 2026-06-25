/* CAMPAIGN-PREP candidate for func_02054868 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-buffer pipeline (declare buffers, sequential calls)
 *   risk:       mwcc may order buf0/buf1 differently or size frame !=0x68; buffer sizes guessed
 *   confidence: med
 */
/* func_02054868: sequential pipeline over two stack buffers. buf1 (at
 * sp+0x10) is initialised by func_0207cfbc, filled by func_0207cfb0,
 * transformed into buf0 (at sp+0, 16 bytes) by func_0207cfa4, which is
 * then consumed by func_020548b4. Frame = 0x68. */

extern void func_0207cfbc(void *buf1);
extern void func_0207cfb0(void *buf1, int a0, int a1);
extern void func_0207cfa4(void *buf0, void *buf1);
extern void func_020548b4(void *buf0, int a2);

typedef struct { char b[0x10]; } Buf0_02054868;   /* sp+0x00 */
typedef struct { char b[0x58]; } Buf1_02054868;   /* sp+0x10 */

void func_02054868(int a0, int a1, int a2) {
    Buf0_02054868 buf0;
    Buf1_02054868 buf1;

    func_0207cfbc(&buf1);
    func_0207cfb0(&buf1, a0, a1);
    func_0207cfa4(&buf0, &buf1);
    func_020548b4(&buf0, a2);
}
