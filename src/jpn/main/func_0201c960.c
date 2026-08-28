/* func_0201c960: insert a 0xc0-byte record into a 32-slot table
 * (data_0219052c[32], status flags in data_0218feac[32]). Scans for an
 * occupied slot whose payload (offset+4) matches via func_020a734c; if
 * found, overwrites that slot. Otherwise, after scanning the whole
 * table, inserts into the first empty slot found (if any), calling
 * func_02020438(param0) first. Marks the slot's status as 0x96.
 */
typedef struct {
    int raw[0x30];
} Record0219060c;

extern Record0219060c data_0219052c[32];
extern int data_0218feac[32];
extern int func_020a734c(void *a, void *b, int n);
extern void func_02020438(void *rec);

void func_0201c960(Record0219060c *param0)
{
    int i;
    int first_empty = -1;

    for (i = 0; i < 0x20; i++) {
        if (data_0218feac[i] != 0) {
            goto occupied;
        }
        if (first_empty < 0) {
            first_empty = i;
        }
        continue;

    occupied:
        if (func_020a734c((char *)&data_0219052c[i] + 4, (char *)param0 + 4, 0xc) == 0) {
            data_0219052c[i] = *param0;
            data_0218feac[i] = 0x96;
            return;
        }
    }

    if (first_empty < 0) {
        return;
    }

    func_02020438(param0);
    data_0219052c[first_empty] = *param0;
    data_0218feac[first_empty] = 0x96;
}
