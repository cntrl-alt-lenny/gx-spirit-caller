/* func_02023fec — C-27 (pool-word DUPLICATION, supersedes P-7).
 * codegen-walls.md documents a proven dual-extern + symbols.txt alias
 * recipe for this function, but this re-audit uses the simpler raw
 * literal-address-cast lever instead (proven/shipped in
 * src/main/func_0202a1cc.c; needs no symbols.txt/BSS changes at all,
 * unlike the alias route). Both accesses here are at offset 0 (bare
 * pointer dereference), so the literal-cast doesn't risk mwcc folding a
 * field offset into the literal (the failure mode found on
 * func_020071c4, which needed the alias instead). Role assignment
 * matches func_0202111c/func_02021158/func_0202142c's confirmed lever:
 * the SYMBOL is used for the address HELD across the intervening `bl`
 * (loads eagerly regardless), the LITERAL for the immediately-
 * dereferenced guard test (loads eagerly because the compare needs it
 * right away).
 */

extern void *data_0219a8e4;
extern void Task_InvokeLocked(void *p);

int func_02023fec(void)
{
    void **store_p = (void **)&data_0219a8e4;
    void *v = *(void **)0x0219a8e4;

    if (v != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    return 1;
}
