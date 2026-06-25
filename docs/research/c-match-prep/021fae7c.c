/* CAMPAIGN-PREP candidate for func_021fae7c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tag6:6 guard + state dispatch (==0/==1) + (bit0&1)*0x868 read + counter bumps
 *   risk:       branch structure of the 3-way dispatch; ce288 base RELOADED each use (not bound); the bit0 value carried in r0 into func_021d7c1c; +0x120/+0x5b4 offsets guessed
 *   confidence: low
 */
/* func_ov002_021fae7c: state machine on *(int*)(ce288+0x5b4).
 *   if (self->f2.tag6 == 0x23) return 1;
 *   switch (state) {
 *     case 0: func_021e2b3c(); state++; return 0;
 *     case 1: if (cf178[player]==0) { func_021e2c5c(); state++; }
 *             else func_021d7c1c(bit0, cf16c+player*0x868+0x120, 0);
 *             return 0;
 *     default: return 1;
 *   }
 * ce288 base is RELOADED each access (orig re-ldr's _LIT0); player = bit0.
 * func_021d7c1c gets the bit0 value in r0 (carried from the lsl#31;lsr#31).
 */
typedef unsigned short u16;

struct Ov002Self021fae7c {
    u16 f0;
    struct {
        u16 bit0 : 1;
        u16 pad5 : 5;
        u16 tag6 : 6;
        u16 top  : 4;
    } f2;
};

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_021d7c1c(int bit0, void *p, int zero);

int func_ov002_021fae7c(struct Ov002Self021fae7c *self) {
    int bit0;
    if (self->f2.tag6 == 0x23) return 1;
    if (*(int *)(data_ov002_022ce288 + 0x5b4) == 0) {
        func_ov002_021e2b3c();
        *(int *)(data_ov002_022ce288 + 0x5b4) = *(int *)(data_ov002_022ce288 + 0x5b4) + 1;
        return 0;
    }
    if (*(int *)(data_ov002_022ce288 + 0x5b4) != 1) return 1;
    bit0 = self->f2.bit0;
    if (*(int *)(data_ov002_022cf178 + (bit0 & 1) * 0x868) == 0) {
        func_ov002_021e2c5c();
        *(int *)(data_ov002_022ce288 + 0x5b4) = *(int *)(data_ov002_022ce288 + 0x5b4) + 1;
        return 0;
    }
    func_ov002_021d7c1c(bit0, data_ov002_022cf16c + (bit0 & 1) * 0x868 + 0x120, 0);
    return 0;
}
