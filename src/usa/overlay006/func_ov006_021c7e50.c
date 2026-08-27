/* func_ov006_021c7e50: table-of-tables forward lookup. sel (r1, 0..9) picks
 * one of 9 (short key, short val) tables (sel==0 or out-of-range -> miss);
 * scans up to a fixed count for key==arg(r2), returns its val; -1 on
 * miss/empty table. */
typedef struct { short key; short val; } kv_t;

extern kv_t data_ov006_021ce2de[];
extern kv_t data_ov006_021ce154[];
extern kv_t data_ov006_021ce26a[];
extern kv_t data_ov006_021ce17c[];
extern kv_t data_ov006_021ce2b6[];
extern kv_t data_ov006_021ce44c[];
extern kv_t data_ov006_021ce28e[];
extern kv_t data_ov006_021ce4a4[];
extern kv_t data_ov006_021ce18c[];

int func_ov006_021c7e50(int unused, int sel, int key) {
    kv_t *tbl = 0;
    int count;
    int i;
    switch (sel) {
    case 1: tbl = data_ov006_021ce2de; count = 0xa;  break;
    case 2: tbl = data_ov006_021ce154; count = 0x3;  break;
    case 3: tbl = data_ov006_021ce26a; count = 0x9;  break;
    case 4: tbl = data_ov006_021ce17c; count = 0x4;  break;
    case 5: tbl = data_ov006_021ce2b6; count = 0xa;  break;
    case 6: tbl = data_ov006_021ce44c; count = 0x16; break;
    case 7: tbl = data_ov006_021ce28e; count = 0xa;  break;
    case 8: tbl = data_ov006_021ce4a4; count = 0x23; break;
    case 9: tbl = data_ov006_021ce18c; count = 0x4;  break;
    default: break;
    }
    if (tbl == 0) {
        return -1;
    }
    for (i = 0; i < count; i++) {
        if (key == tbl[i].key) {
            return tbl[i].val;
        }
    }
    return -1;
}
