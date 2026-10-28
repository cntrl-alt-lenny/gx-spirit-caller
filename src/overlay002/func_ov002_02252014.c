struct Slot { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned index:8; unsigned rest:2; };
struct Entry { unsigned index:9; unsigned player:1; unsigned rest:22; };
extern char data_ov002_022cf16c;
extern char data_ov002_022ce288[];
extern struct Entry data_ov002_022ce884[];
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02252014(unsigned player, int unused, unsigned idx) {
    struct Slot *slots;
    int id;
    int base;
    unsigned i;
    char *p;
    struct Entry *entry;
    unsigned count;
    int key;
    unused = player & 1;
    unused *= 0x868;
    base = (int)&data_ov002_022cf16c;
    unused += base;
    slots = (struct Slot *)(unused + 0x120);
    id = slots[idx].id;
    if (func_0202e234(id) == 0) return;
    if (func_ov002_021ca440(player, id) == 0) return;
    key = slots[idx].index * 2 + slots[idx].side;
    p = data_ov002_022ce288;
    count = *(unsigned *)(p + 0x5d4);
    i = 0;
    if (i < count) {
        entry = data_ov002_022ce884;
        do {
            if (*(unsigned char *)(p + 0x5dc) == 0x19 && player == entry->player && key == entry->index) {
                func_ov002_02253458(player, 11, idx);
                break;
            }
            i++;
            p++;
            entry++;
        } while (i < count);
    }
}




