typedef struct {
    unsigned short w0;
    unsigned short bit0:1;
    unsigned short pad1:13;
    unsigned short bit14:1;
    unsigned short pad15:1;
    unsigned short pad4:6;
    unsigned short index:9;
    unsigned short pad5:1;
} S021ff3bc;
typedef struct {
    unsigned int id:13;
    unsigned int low:1;
    unsigned int pad:8;
    unsigned int high:8;
    unsigned int rest:2;
} Entry;
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
int func_ov002_022028c8(S021ff3bc *p, int unused1) {
    unsigned int i;
    int missing = 0;
    int found = 0;
    unsigned int count;
    if (func_ov002_021ff3bc(p, unused1) == 0) return 0;
    count = *(unsigned int *)(data_ov002_022cf178 + (p->bit0 & 1) * 0x868);
    for (i = 0; i < count; i++) {
        Entry *entry = (Entry *)(data_ov002_022cf16c + (p->bit0 & 1) * 0x868 + 0x120 + i * 4);
        if (p->index != entry->high * 2 + entry->low) {
            int id = entry->id;
            if (func_0202e234(id) != 0) {
                if (func_ov002_021ca440(p->bit0, id) != 0) found++;
            } else {
                missing++;
            }
        }
        count = *(unsigned int *)(data_ov002_022cf16c + (p->bit0 & 1) * 0x868 + 0xc);
    }
    if (found == 0) return 0;
    return missing >= 2;
}






