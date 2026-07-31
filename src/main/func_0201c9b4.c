/* func_0201c9b4: insert a 0xc0-byte record into a 32-slot table
 * (data_0219060c[32], status flags in data_0218ff8c[32]). Scans for an
 * occupied slot whose payload (offset+4) matches via func_020a7440; if
 * found, overwrites that slot. Otherwise, after scanning the whole
 * table, inserts into the first empty slot found (if any), calling
 * func_0202048c(param0) first. Marks the slot's status as 0x96.
 */
typedef struct {
    int raw[0x30];
} Record0219060c;

extern Record0219060c data_0219060c[32];
extern int data_0218ff8c[32];
extern int func_020a7440(void *a, void *b, int n);
extern void func_0202048c(void *rec);

void func_0201c9b4(Record0219060c *param0)
{
    int i;
    int first_empty = -1;

    for (i = 0; i < 0x20; i++) {
        if (data_0218ff8c[i] != 0) {
            goto occupied;
        }
        if (first_empty < 0) {
            first_empty = i;
        }
        continue;

    occupied:
        if (func_020a7440((char *)&data_0219060c[i] + 4, (char *)param0 + 4, 0xc) == 0) {
            data_0219060c[i] = *param0;
            data_0218ff8c[i] = 0x96;
            return;
        }
    }

    if (first_empty < 0) {
        return;
    }

    func_0202048c(param0);
    data_0219060c[first_empty] = *param0;
    data_0218ff8c[first_empty] = 0x96;
}
