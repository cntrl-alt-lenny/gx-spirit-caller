typedef unsigned short u16;
struct Entry { u16 id, pad; int value; u16 kind, pad2; };
struct List { int unk0, unk4, count, unkC, unk10; struct Entry entries[96]; };
struct State { char pad[0x928]; unsigned int chapter, step; };
extern struct State data_02104f4c;
extern int func_02018dcc(int a0);
extern int func_020195b8(int a0, int a1);
extern int func_0201b690(int a0);
extern int func_ov019_021b43a8(struct List *, int, int);
void func_ov019_021b3f7c(struct List *list) {
    int count = 0;
    int i;
    int id;
    int sum;
    struct Entry *entry = list->entries;
    for (i = 1; i < 0x60; i++) {
        id = i;
        switch (i) {
        case 2:
            if (data_02104f4c.chapter >= 0x24) id = 0x4a;
            break;
        case 3:
            if (data_02104f4c.chapter >= 0x29) id = 0x5e;
            break;
        case 5:
            if (data_02104f4c.chapter > 0x17) id = 0x4b;
            else if (data_02104f4c.chapter == 0x17 && data_02104f4c.step >= 4) id = 0x4b;
            break;
        case 7:
            if (data_02104f4c.chapter > 0x2b) id = 0x3f;
            else if (data_02104f4c.chapter == 0x2b && data_02104f4c.step >= 3) id = 0x3f;
            break;
        case 0x2d: id = 0x49; break;
        }
        sum = 0;
        sum += func_020195b8(id, 0);
        sum += func_020195b8(id, 1);
        sum += func_020195b8(id, 2);
        sum = sum > 0;
        if (func_ov019_021b43a8(list, id, count + 1) && sum) {
            entry->id = id;
            entry->value = func_02018dcc(id);
            entry->kind = func_0201b690(i);
            entry++;
            count++;
        }
    }
    list->count = count;
}


