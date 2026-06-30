/* CAMPAIGN-PREP candidate for func_02062498 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-assert guard (movs+bne) then field accessor return
 *   risk:       assert helper arg order/signature; field 0x40 type assumed int; assert literal-pool layout
 *   confidence: high
 */
/* func_02062498: assert(p != NULL) then return p->_0x40.
 * The `movs r0; bne` is mwcc's in-place null test; assert is a 4-arg
 * call func_020a6d54(file, msg, 0, line) with line=0x1a3 in the pool. */

extern char data_02101518[];   /* __FILE__ string */
extern char data_02101524[];   /* assertion message string */
extern void func_020a6d54(const char *file, const char *msg, int zero, int line);

typedef struct Obj {
    char _pad_00[0x40];
    int  field_40;            /* +0x40 */
} Obj;

int func_02062498(Obj *p) {
    if (p == 0)
        func_020a6d54(data_02101518, data_02101524, 0, 0x1a3);
    return p->field_40;
}
