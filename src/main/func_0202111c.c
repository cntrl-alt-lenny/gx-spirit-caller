/* func_0202111c — C-34 re-audit. First attempt (plain if/else-if chain on
 * a bare `extern int`) compiled to a SINGLE pool word (11 words vs orig's
 * 15) -- typed access alone does not defeat mwcc's address-CSE when both
 * accesses resolve to the literal same symbol at offset 0. This is the
 * classic C-34 shape (not P-16's base+K folding). Fixed via the raw
 * literal-address-cast recipe already proven/shipped in this codebase
 * (src/main/func_0202a1cc.c: `int *raw = (int *)0x0219a934;`) -- a second
 * pointer initialized from the bare numeric address is its own pool word,
 * not CSE'd with the symbol reference. A switch (not if/else-if, which let
 * mwcc drop the vestigial `v == 2` empty arm) reproduces the branch shape;
 * the literal-typed pointer is used for the immediately-dereferenced test
 * (mwcc schedules literal-address loads eagerly when they feed a compare,
 * but defers them when only held for a later conditional use).
 */

extern int data_02194340;
extern void func_020216c8(int *p);

int func_0202111c(void)
{
    int *store_p = &data_02194340;
    int v = *(int *)0x02194340;

    switch (v) {
    case 0:
        break;
    case 1:
        func_020216c8(store_p);
        break;
    case 2:
        break;
    }
    return 1;
}
