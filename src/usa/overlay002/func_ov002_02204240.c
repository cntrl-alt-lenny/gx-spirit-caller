/* func_ov002_02204240: 021ff320 forwarding predicate — only when the cf016c
 * global's +0xCF8 slot is 2: require the query, then report 021ff354(self,
 * arg1) nonzero. */

extern char data_ov002_022d008c[];
extern int func_ov002_021ff230(void *self);
extern int func_ov002_021ff264(void *self, int arg1);

int func_ov002_02204240(void *self, int arg1) {
    if (*(int *)(data_ov002_022d008c + 0xCF8) != 2)
        return 0;
    if (func_ov002_021ff230(self) == 0)
        return 0;
    return func_ov002_021ff264(self, arg1) != 0;
}
