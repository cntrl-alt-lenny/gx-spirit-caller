/* CAMPAIGN-PREP candidate for func_02224994 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-state switch; early-return guard; 1-bit0; :1/:5 bitfield
 *   risk:       2-case compare order / inline-arm choice may flip; d0e6c load typing
 *   confidence: med
 */
/* func_ov002_02224994: global-state (ce288+0x5a8) 2-way dispatch.
 *   0x7f -> v=*(u16*)(d0e6c+0xb0); if(v==6) return 0x80;
 *           021de4b0(self, 1-f2.b0, v-1); return 0
 *   0x80 -> 0226b258(f2.b0, f2.f1); return 0x7f
 *   default -> 0 */
typedef unsigned short u16;

struct F02224994_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F02224994_Self { u16 f0; struct F02224994_F2 f2; };

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_021de4b0(void *self, int a, int b);
extern int  func_ov002_0226b258(unsigned int b0, unsigned int f1);

int func_ov002_02224994(struct F02224994_Self *self) {
    int v;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x7f:
        v = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        if (v == 6) return 0x80;
        func_ov002_021de4b0(self, 1 - self->f2.b0, v - 1);
        return 0;
    case 0x80:
        func_ov002_0226b258(self->f2.b0, self->f2.f1);
        return 0x7f;
    }
    return 0;
}
