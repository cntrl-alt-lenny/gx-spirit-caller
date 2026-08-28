/* func_ov006_021c7f5c: keyed-table lookup dispatcher. `kind` (1-9) selects
 * one of nine fixed (table,count) pairs of {val,id} halfword-pair records;
 * kind 0 or out-of-range yields no table. Linear-scans the selected table
 * for a record whose id matches `key`, returning its val, or -1 if no
 * table / no match. */
typedef struct { short val; short id; } KeyedEntry;

extern KeyedEntry data_ov006_021ce2de[];  /* kind 1, 0xa entries */
extern KeyedEntry data_ov006_021ce154[];  /* kind 2, 0x3 entries */
extern KeyedEntry data_ov006_021ce26a[];  /* kind 3, 0x9 entries */
extern KeyedEntry data_ov006_021ce17c[];  /* kind 4, 0x4 entries */
extern KeyedEntry data_ov006_021ce2b6[];  /* kind 5, 0xa entries */
extern KeyedEntry data_ov006_021ce44c[];  /* kind 6, 0x16 entries */
extern KeyedEntry data_ov006_021ce28e[];  /* kind 7, 0xa entries */
extern KeyedEntry data_ov006_021ce4a4[];  /* kind 8, 0x23 entries */
extern KeyedEntry data_ov006_021ce18c[];  /* kind 9, 0x4 entries */

int func_ov006_021c7f5c(int unused0, int kind, int key) {
    KeyedEntry *table;
    int count;
    int i;

    (void)unused0;
    table = 0;
    switch (kind) {
    case 1: table = data_ov006_021ce2de; count = 0xa; break;
    case 2: table = data_ov006_021ce154; count = 0x3; break;
    case 3: table = data_ov006_021ce26a; count = 0x9; break;
    case 4: table = data_ov006_021ce17c; count = 0x4; break;
    case 5: table = data_ov006_021ce2b6; count = 0xa; break;
    case 6: table = data_ov006_021ce44c; count = 0x16; break;
    case 7: table = data_ov006_021ce28e; count = 0xa; break;
    case 8: table = data_ov006_021ce4a4; count = 0x23; break;
    case 9: table = data_ov006_021ce18c; count = 0x4; break;
    }

    if (table == 0) return -1;

    for (i = 0; i < count; i++) {
        if (table[i].id == key) return table[i].val;
    }
    return -1;
}
