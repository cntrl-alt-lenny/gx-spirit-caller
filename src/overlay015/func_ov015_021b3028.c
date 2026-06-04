/* func_ov015_021b3028: redraw both status fields — for each of the two cached
 * strings, open a temp render onto its window with the field's value, blit it,
 * and free the temp. (ov015) */
extern int  func_0201edac(int *, int);
extern void func_0207f610(int, int, void *, void *);
extern void func_02006e1c(int);
extern int  func_0201ede4(int *, int);
extern void func_0207f510(int, int, void *, void *);
extern char data_ov015_021b5ba0[];
extern char data_ov015_021b5e04[];
extern char data_ov015_021b5df0[];
void func_ov015_021b3028(void *o, int valA, int valB) {
    int slotA, slotB;
    int hA = func_0201edac(&slotA, *(int *)(data_ov015_021b5ba0 + 0x0));
    func_0207f610(slotA, valA, o, data_ov015_021b5e04);
    func_02006e1c(hA);
    {
        int hB = func_0201ede4(&slotB, *(int *)(data_ov015_021b5ba0 + 0x4));
        func_0207f510(slotB, valB, o, data_ov015_021b5df0);
        func_02006e1c(hB);
    }
}
