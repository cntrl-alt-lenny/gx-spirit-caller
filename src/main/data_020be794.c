/* data_020be794 -- 35-entry function-pointer dispatch table (140 bytes).
 *
 * Sole consumer func_0202b4f4.s ("Card_SearchSlot" per docs/research
 * naming maps): a runtime loop with a hard `cmp r5,#0x23` (35) bound,
 * computed-stride `[r4, r5, lsl #0x2]` indexing, `blx`-calling each
 * entry with the caller's own card handle and collecting results into
 * a 35-slot stack array. Identical loop confirmed in all 3 regions
 * (src/usa/main/func_0202b4a0.s, src/jpn/main/func_0202b4a0.s). Every
 * one of the 35 entries is independently confirmed by its own
 * relocation in config/eur/arm9/relocs.txt (0x020be794-0x020be81c,
 * kind:load, one per 4-byte slot) -- the strongest class of evidence
 * available in this project. Carved from a previously-unclaimed
 * delinks.txt gap; first 7 entries already named
 * Card_GetAttrA..Card_GetAttrG in docs/research/map/NAMES.md. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

extern int func_0202b43c(void *card);
extern int func_0202b454(void *card);
extern int func_0202b46c(void *card);
extern int func_0202b484(void *card);
extern int func_0202b49c(void *card);
extern int func_0202b4b4(void *card);
extern int func_0202b4d4(void *card);
extern int func_0202e358(void *card);
extern int func_0202e42c(void *card);
extern int func_0202e5ac(void *card);
extern int func_0202e60c(void *card);
extern int func_0202e6f4(void *card);
extern int func_0202e79c(void *card);
extern int func_0202e864(void *card);
extern int func_0202eab0(void *card);
extern int func_0202eac8(void *card);
extern int func_0202ed90(void *card);
extern int func_0202ed04(void *card);
extern int func_0202ee40(void *card);
extern int func_0202ef08(void *card);
extern int func_0202ef38(void *card);
extern int func_0202effc(void *card);
extern int func_0202f050(void *card);
extern int func_0202f164(void *card);
extern int func_0202f1d8(void *card);
extern int func_0202f218(void *card);
extern int func_0202f2e4(void *card);
extern int func_0202f3e8(void *card);
extern int func_0202f430(void *card);
extern int func_0202f410(void *card);
extern int func_0202f46c(void *card);
extern int func_0202f500(void *card);
extern int func_0202f578(void *card);
extern int func_0202f59c(void *card);
extern int func_0202f5cc(void *card);

int (*const data_020be794[35])(void *card) = {
    func_0202b43c, func_0202b454, func_0202b46c, func_0202b484,
    func_0202b49c, func_0202b4b4, func_0202b4d4, func_0202e358,
    func_0202e42c, func_0202e5ac, func_0202e60c, func_0202e6f4,
    func_0202e79c, func_0202e864, func_0202eab0, func_0202eac8,
    func_0202ed90, func_0202ed04, func_0202ee40, func_0202ef08,
    func_0202ef38, func_0202effc, func_0202f050, func_0202f164,
    func_0202f1d8, func_0202f218, func_0202f2e4, func_0202f3e8,
    func_0202f430, func_0202f410, func_0202f46c, func_0202f500,
    func_0202f578, func_0202f59c, func_0202f5cc,
};
