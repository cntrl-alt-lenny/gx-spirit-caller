extern int func_020092c8(unsigned int bit);
extern unsigned int func_0202b0e0(int id);
extern int func_0202b6e4(int val, int *out, int max);
extern int func_0202bb20(int a);
extern int func_0202e2f8(int unused0);
extern int func_020b3870(int a, int b);
extern const int data_020b4768;
typedef struct { int id, rate, owned, total; } Entry;
typedef struct { char pad[0x7c]; Entry entries[27]; int count; } Obj;
int func_ov006_021c5b00(char *obj) {
    int cards[60];
    const int special1 = 0x1387;
    const int special2 = 0x1388;
    int total, owned, specialTotal, specialOwned;
    int i;
    int end;
    Entry *entry;
    i = 0;
    total = 0;
    owned = 0;
    end = data_020b4768 - 1;
    specialTotal = 0;
    specialOwned = 0;
    (*(int *)(obj + 0x22c)) = 0;
    do {
        int id = func_0202b0e0(i + 1);
        if (func_0202e2f8(id) == 0) {
            if (id == 0x1386 || id == special1 || id == special2 || id == 0x1b7f) {
                if (func_0202bb20(id) != 0) specialOwned++;
                specialTotal++;
            } else {
                if (func_0202bb20(id) != 0) owned++;
                total++;
            }
        }
        i++;
    } while (i < end);
    entry = (Entry *)(obj + 0x7c + (*(int *)(obj + 0x22c)) * 16);
    entry->id = 0;
    entry->rate = total == 0 ? 0 : func_020b3870(owned * 1000, total);
    entry->owned = owned + specialOwned;
    entry->total = total + specialTotal;
    (*(int *)(obj + 0x22c))++;
    { int category;
    for (category = 0; category < 26; category++) {
        if (func_020092c8(category) != 0) {
            int j, n, have;
            entry = (Entry *)(obj + 0x7c + (*(int *)(obj + 0x22c)) * 16);
            entry->id = category + 1;
            n = func_0202b6e4(category + 1, cards, 60);
            have = 0;
            for (j = 0; j < n; j++) {
                if (func_0202bb20(cards[j]) != 0) have++;
            }
            entry->rate = n == 0 ? 0 : func_020b3870(have * 1000, n);
            entry->owned = have;
            entry->total = n;
            (*(int *)(obj + 0x22c))++;
        }
    }
    }
    return 1;
}












