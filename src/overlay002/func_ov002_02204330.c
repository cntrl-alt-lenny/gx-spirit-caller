/* func_ov002_02204330: 021ff320 forwarding predicate — only when the cf016c
 * global's +0xCF8 slot is 2: require the query, then report 021ff354(self,
 * arg1) nonzero. */

extern char data_ov002_022d016c[];
extern int func_ov002_021ff320(void *self);
extern int func_ov002_021ff354(void *self, int arg1);

int func_ov002_02204330(void *self, int arg1) {
    if (*(int *)(data_ov002_022d016c + 0xCF8) != 2)
        return 0;
    if (func_ov002_021ff320(self) == 0)
        return 0;
    return func_ov002_021ff354(self, arg1) != 0;
}
