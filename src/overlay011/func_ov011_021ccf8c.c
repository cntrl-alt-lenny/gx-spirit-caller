/* func_ov011_021ccf8c: 2 field RMWs, 2 calls (021cca04, Bg_SetScroll -- both
 * void), then a post-call single-field RMW on +0x2ac. ov011_core.h (brief
 * 311) documented this exact post-call RMW as reverting to .s (mwcc fusing
 * base+off into the pool instead of [base,#off]); the offset-member
 * struct-field convention below reproduces the target byte-exact. */
typedef unsigned int u32;
struct View021ccf8c {
    char _pad1[0x238];
    u32 f238;
    u32 f23c;
    char _pad2[0x26c - 0x23c - 4];
    u32 f26c;
    u32 f270;
    char _pad3[0x2ac - 0x270 - 4];
    u32 f2ac;
};
extern struct View021ccf8c data_ov011_021d4000;
extern void func_ov011_021cca04(void);
extern void Bg_SetScroll(void);

void func_ov011_021ccf8c(void) {
    data_ov011_021d4000.f238 = data_ov011_021d4000.f26c - 0x80000;
    data_ov011_021d4000.f23c = data_ov011_021d4000.f270 - 0x60000;
    func_ov011_021cca04();
    Bg_SetScroll();
    data_ov011_021d4000.f2ac = data_ov011_021d4000.f2ac & ~0xff00000;
}
