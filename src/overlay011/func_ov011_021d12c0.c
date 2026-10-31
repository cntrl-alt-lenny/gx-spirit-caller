typedef struct Entry {
    int x;
    int key;
    int pad[4];
    unsigned rank:5;
    unsigned enabled:1;
    unsigned rest:26;
    int tail[3];
} Entry;
extern Entry data_ov011_021d4660[];
extern void func_ov011_021d12bc(Entry *entry);
void func_ov011_021d12c0(void) {
    Entry *base = data_ov011_021d4660;
    int count = 0;
    int rank = 18;
    signed char order[10];
    unsigned i;
    int gap, j, k;
    signed char a, b;
    for (i = 0; i < 10; i++) func_ov011_021d12bc(&base[i]);
    for (i = 0; i < 10; i++) {
        if (base[i].enabled) order[count++] = i;
    }
    gap = 1;
    while (gap < count / 3) gap = gap * 3 + 1;
    for (; gap > 0; gap /= 3) {
        for (j = gap; j < count; j++) {
            for (k = j - gap; k >= 0; k -= gap) {
                a = order[k + gap];
                b = order[k];
                if (base[b].key > base[a].key) break;
                order[k] = a;
                order[k + gap] = b;
            }
        }
    }
    for (j = 0; j < count; j++) {
        base[order[j]].rank = rank;
        rank++;
    }
}
