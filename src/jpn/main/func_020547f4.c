/* CAMPAIGN-PREP candidate for func_020547f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-buffer pipeline (declare buffers, sequential calls)
 *   risk:       mwcc may order buf0/buf1 differently or size frame !=0x68; buffer sizes guessed
 *   confidence: med
 */
/* func_020547f4: sequential pipeline over two stack buffers. buf1 (at
 * sp+0x10) is initialised by func_0207ced4, filled by func_0207cec8,
 * transformed into buf0 (at sp+0, 16 bytes) by func_0207cebc, which is
 * then consumed by func_02054840. Frame = 0x68. */

extern void func_0207ced4(void *buf1);
extern void func_0207cec8(void *buf1, int a0, int a1);
extern void func_0207cebc(void *buf0, void *buf1);
extern void func_02054840(void *buf0, int a2);

typedef struct { char b[0x10]; } Buf0_02054868;   /* sp+0x00 */
typedef struct { char b[0x58]; } Buf1_02054868;   /* sp+0x10 */

void func_020547f4(int a0, int a1, int a2) {
    Buf0_02054868 buf0;
    Buf1_02054868 buf1;

    func_0207ced4(&buf1);
    func_0207cec8(&buf1, a0, a1);
    func_0207cebc(&buf0, &buf1);
    func_02054840(&buf0, a2);
}
