/* func_ov015_021b2f28: redraw both status fields — for each of the two cached
 * strings, open a temp render onto its window with the field's value, blit it,
 * and free the temp. (ov015) */
extern int  func_0201ed58(int *, int);
extern void func_0207f528(int, int, void *, void *);
extern void func_02006e00(int);
extern int  func_0201ed90(int *, int);
extern void func_0207f428(int, int, void *, void *);
extern char data_ov015_021b5a80[];
extern char data_ov015_021b5ce4[];
extern char data_ov015_021b5cd0[];
void func_ov015_021b2f28(void *o, int valA, int valB) {
    int slotA, slotB;
    int hA = func_0201ed58(&slotA, *(int *)(data_ov015_021b5a80 + 0x0));
    func_0207f528(slotA, valA, o, data_ov015_021b5ce4);
    func_02006e00(hA);
    {
        int hB = func_0201ed90(&slotB, *(int *)(data_ov015_021b5a80 + 0x4));
        func_0207f428(slotB, valB, o, data_ov015_021b5cd0);
        func_02006e00(hB);
    }
}
