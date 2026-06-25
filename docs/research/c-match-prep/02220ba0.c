/* CAMPAIGN-PREP candidate for func_02220ba0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global switch; dual-bitfield (b0+b1_5) read; halfword copy
 *   risk:       0226b258 arg count (2 vs leftover r2); switch compares must order 0x7f then 0x80
 *   confidence: med
 */
/* func_ov002_02220ba0: switch on *(int*)(ce288+0x5a8): 0x7f -> copy d0e6c+0xb0
 * halfword into self->f8 then 02257704/021de408, return 0; 0x80 -> dual-bitfield
 * read of u16@2 to 0226b258, return 0x7f; else return 0. */
typedef unsigned short u16;
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_0226b258(int b0, int b1_5);
extern int  func_ov002_02257704(void);
extern int  func_ov002_021de408(void *self, int n);

struct Self20ba0 {
    u16 _0;        /* 0 */
    u16 b0:1;      /* 2: bit0 */
    u16 b1_5:5;    /* 2: bits1-5 */
    u16 :10;
    u16 _4;        /* 4 */
    u16 _6;        /* 6 */
    u16 f8;        /* 8 */
};

int func_ov002_02220ba0(struct Self20ba0 *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x7f:
        self->f8 = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        func_ov002_021de408(self, func_ov002_02257704());
        return 0;
    case 0x80:
        func_ov002_0226b258(self->b0, self->b1_5);
        return 0x7f;
    }
    return 0;
}
