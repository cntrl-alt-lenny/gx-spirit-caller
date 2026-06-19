/* func_ov015_021b3514: draw cell `idx` into the supplied surface — bail to 0 if
 * the table is dead, look up the cell record (entry[2]=glyph, entry[3]=advance),
 * and if no surface just return the advance; otherwise build the glyph onto a
 * scratch printer and blit it, returning the advance. (ov015) */
extern void func_02098294(void *);
extern void func_ov015_021b3428(void *, int);
extern void func_02097f44(void *, void *);
extern void func_02097db0(void *, int, int);
extern void func_0209281c(void *, int);
extern void func_02038a84(void *, void *, int);
extern void func_02097efc(void *);
extern char data_ov015_021b5d08[];
extern char data_ov015_021b5d24[];
int func_ov015_021b3514(int idx, void *surface) {
    char cfg[0x40];
    char glyph[0x48];
    char *tbl = data_ov015_021b5d24;
    char *entry;
    int gfx, adv;
    if (*(int *)(data_ov015_021b5d08 + 0xa94) == 0)
        return 0;
    entry = *(char **)(tbl + 0xa78) + idx * 16;
    gfx = *(int *)(entry + 0x8);
    adv = *(int *)(entry + 0xc);
    if (surface == 0)
        return adv;
    func_02098294(glyph);
    func_ov015_021b3428(cfg, 2);
    func_02097f44(glyph, cfg);
    func_02097db0(glyph, gfx, 0);
    func_0209281c(surface, 0x200);
    func_02038a84(glyph, surface, adv);
    func_02097efc(glyph);
    return adv;
}
