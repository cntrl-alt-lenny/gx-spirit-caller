/* func_0202142c — C-34 re-audit. Duplicate-pool shape (data_02194340):
 * one dereference-read for the guard, one held-address write at the tail
 * (leaf function, no frame -- early returns compile to predicated `bx`).
 * Fixed via the raw literal-address-cast recipe (proven/shipped in
 * src/main/func_0202a1cc.c). Role assignment matters for scheduling: a
 * SYMBOL reference held for a later use (the tail write here) is loaded
 * eagerly regardless; a LITERAL address held for later gets deferred
 * (lazy, right where used) -- so the symbol is used for the held/store
 * role and the literal for the immediately-dereferenced test value
 * (which loads eagerly either way, since the compare needs it right
 * away). This is the inverse pairing of the first (wrong) attempt, which
 * put the literal in the held role and got a lazy load, only 40% match.
 *
 * The `bic #1; orr #1` pair on the incoming struct's first word is a
 * 1-bit bitfield write idiom (read-modify-write clear-then-set), not raw
 * `|= 1` -- matches this codebase's established bitfield-write convention.
 */

typedef struct {
    unsigned int flag0 : 1;
    unsigned int _rest : 31;
} Word0202142c;

typedef struct {
    Word0202142c word0; /* +0x0 */
    int field_4;        /* +0x4 */
} Arg0202142c;

extern int data_02194340;

int func_0202142c(Arg0202142c *arg0)
{
    int *store_p = &data_02194340;
    int v = *(int *)0x02194340;

    if (v != 1) {
        return 1;
    }
    if (arg0->field_4 == 0) {
        return 0;
    }
    arg0->word0.flag0 = 1;
    *store_p = 2;
    return 1;
}
