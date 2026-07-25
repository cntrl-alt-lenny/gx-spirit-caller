/* func_020071c4 — C-30 (pool-DUP + shift-based bit extraction, extends
 * C-27). codegen-walls.md documents this exact function as a fully-swept
 * worked example (brief 111): dual-extern + symbols.txt alias (already
 * present: data_02104f1c_alias, confirmed genuinely defined via a
 * zero-size-split in src/main/bss/data_main_bss.s -- NOT just a
 * symbols.txt metadata line, which alone is not linker-visible) +
 * typed struct-member access + the `((v << 30) >> 31)` shift idiom for
 * the bit-1 test (mwcc's natural `tst rN, #2` peephole doesn't reproduce
 * the orig's 3-insn shift form).
 *
 * A literal-address-cast (this campaign's other lever, see
 * func_0202111c/func_02021158/func_0202142c) does NOT work here: this
 * function's two accesses are both at a NON-ZERO field offset (+0x10 /
 * +0x14), and casting a compile-time-constant literal to a struct
 * pointer lets mwcc constant-fold the field offset straight into the
 * literal pool word itself (observed: 0x02104f2c instead of the orig's
 * bare 0x02104f1c) -- a symbol reference never folds this way, since its
 * address isn't known until link time, so the alias is the only
 * available recipe for this specific access shape.
 */

extern unsigned int data_02104f1c;
extern unsigned int data_02104f1c_alias; /* same address, see symbols.txt */
extern void func_02006918(void);
extern void func_02006a38(void);
extern void func_020057dc(void);

struct s071c4 {
    char _pad[0x10];
    unsigned int f_10;
    int f_14;
};

void func_020071c4(void)
{
    struct s071c4 *p_test  = (struct s071c4 *)&data_02104f1c;
    struct s071c4 *p_store = (struct s071c4 *)&data_02104f1c_alias;
    unsigned int v = p_test->f_10;

    if (((v << 30) >> 31) == 0) return;
    func_02006918();
    func_02006a38();
    if (p_store->f_14 != 0) func_020057dc();
    p_store->f_10 &= ~2u;
    p_store->f_14 = 0;
}
