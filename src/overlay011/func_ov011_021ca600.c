/* func_ov011_021ca600: two independent field RMWs on the view struct.
 * ov011_core.h (brief 308) documented 3 earlier attempts at this exact
 * function reverting to .s (mwcc pooling the field address instead of
 * emitting [base,#off]); the offset-member struct-field convention here
 * (as opposed to pointer-cast arithmetic) reproduces the target byte-exact. */
typedef unsigned int u32;
struct View021ca600 { char _pad1[0x2a8]; u32 f2a8; char _pad2[0x2bc - 0x2a8 - 4]; u32 f2bc; };
extern struct View021ca600 data_ov011_021d4000;

void func_ov011_021ca600(void) {
    data_ov011_021d4000.f2bc = (data_ov011_021d4000.f2bc & ~0x3c0000) | 0x40000;
    data_ov011_021d4000.f2a8 = data_ov011_021d4000.f2a8 & 0xFFFF0000u;
}
