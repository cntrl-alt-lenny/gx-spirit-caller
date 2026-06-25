/* CAMPAIGN-PREP candidate for func_0204f310 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init call + setter sequence (store-order) + 5 registration calls
 *   risk:       many offsets (f15/f16/f464/f468/f17d/f2d0); acc reloaded per store
 *   confidence: med
 */
/* func_0204f310: func_0204f3c0(0); then acc() field stores in order:
 *   ->f15=a0(byte), ->f16=a1(byte), ->f464=a2, ->f468=a3,
 *   ->f17d=0(byte), ->f2d0=0(byte). Then 5 registration calls
 *   func_02067850(id, ptr) for ids 0x32..0x36. acc() reloaded per store. */

typedef struct {
    char          _pad0[0x15];
    unsigned char f15;   /* +0x15 */
    unsigned char f16;   /* +0x16 */
    char          _pad1[0x166];
    unsigned char f17d;  /* +0x17d */
    char          _pad2[0x152];
    unsigned char f2d0;  /* +0x2d0 */
    char          _pad3[0x193];
    int           f464;  /* +0x464 */
    int           f468;  /* +0x468 */
} State0204f310;

extern State0204f310 *func_020498f0(void);
extern void func_0204f3c0(int a);
extern void func_02067850(int id, void *ptr);
extern char data_020ff974[];
extern char data_020ff980[];
extern char data_020ff9a0[];
extern char data_020ff9ac[];
extern char data_020ff9b8[];

void func_0204f310(int a0, int a1, int a2, int a3) {
    func_0204f3c0(0);
    func_020498f0()->f15 = a0;
    func_020498f0()->f16 = a1;
    func_020498f0()->f464 = a2;
    func_020498f0()->f468 = a3;
    func_020498f0()->f17d = 0;
    func_020498f0()->f2d0 = 0;
    func_02067850(0x32, data_020ff980);
    func_02067850(0x33, data_020ff9a0);
    func_02067850(0x34, data_020ff9ac);
    func_02067850(0x35, data_020ff9b8);
    func_02067850(0x36, data_020ff974);
}
