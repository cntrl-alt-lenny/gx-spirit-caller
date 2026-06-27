/* CAMPAIGN-PREP candidate for func_02273b94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: @0x16 :1 bit1 guard; (u8)[0x18] sub-state switch; :15 f8 read (lsl#9;lsr#17); cd318 :8 lo ++/-- byte-field RMW (bic#ff;orr)
 *   risk:       func_02290500 arg0: orig leaves cd300 ptr in r0 (never reloaded) so I pass it — if that reg is actually dead the leading arg diverges. reshape-able (drop/keep base arg); struct-guessed on cd744 index scaling and the d016c offsets
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02273b94 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. State machine: if @0x16 bit1 clear, tail-call
 * func_02271ab4. Else dispatch on (u8)cd300[0x18]:
 *   sub-state 0: look up cd744[bit0]; if ==1 call func_02290500(f15, &22716a8)
 *                else func_021ae400(0xeb)+func_022592ec(&22716a8); then
 *                cd318.lo++ ; return 0.
 *   sub-state 1: if func_022593f4() -> func_021d7a1c(cd016c[0xd70], cd016c[0xd78]); return 1
 *                else cd318.lo-- ; return 0.
 *   other      : return 1.
 */
typedef unsigned int   u32;
typedef unsigned short u16;

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 _hi : 9; };
struct F30016 { u16 _b0 : 1; u16 b1 : 1; u16 _r : 14; };               /* @0x16 */
struct St318  { u32 lo : 8; u32 _hi : 24; };                            /* cd318 low byte */

extern char data_ov002_022cd300[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022cd318[];
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int code);
extern void func_ov002_021d7a1c(int a, int b);
extern void func_ov002_022592ec(int (*cb)(int, int, int));
extern int  func_ov002_022593f4(void);
extern int  func_ov002_022716a8(int player, int kind, int idx);
extern int  func_ov002_02271ab4(void);
extern void func_ov002_02290500(void *base, int f15, int (*cb)(int, int, int));

int func_ov002_02273b94(void) {
    if (((struct F30016 *)(data_ov002_022cd300 + 0x16))->b1) {
        int sub = (unsigned char)data_ov002_022cd300[0x18];
        if (sub == 0) {
            u32 w = *(u32 *)data_ov002_022cd300;
            if (data_ov002_022cd744[w & 1] == 1)
                func_ov002_02290500(data_ov002_022cd300,
                                    (int)((struct Hdr300 *)&w)->f8,
                                    func_ov002_022716a8);
            else {
                func_ov002_021ae400(0xeb);
                func_ov002_022592ec(func_ov002_022716a8);
            }
            ((struct St318 *)data_ov002_022cd318)->lo =
                ((struct St318 *)data_ov002_022cd318)->lo + 1;
            return 0;
        }
        if (sub == 1) {
            if (func_ov002_022593f4() != 0) {
                func_ov002_021d7a1c(*(int *)(data_ov002_022d016c + 0xd70),
                                    *(int *)(data_ov002_022d016c + 0xd78));
                return 1;
            }
            ((struct St318 *)data_ov002_022cd318)->lo =
                ((struct St318 *)data_ov002_022cd318)->lo - 1;
            return 0;
        }
        return 1;
    }
    return func_ov002_02271ab4();
}
