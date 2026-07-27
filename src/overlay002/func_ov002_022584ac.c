/* func_ov002_022584ac: if cmd is 8 or 9, fire a 6-arg event built from the
 * shared duel block; always clear the +0xD50 status word on the way out. */

extern char data_ov002_022d016c[];
extern void func_ov002_021d6870(int a, int b, int c, int d, int e, int f);

void func_ov002_022584ac(int a)
{
    if (a != 8 && a != 9)
        goto skip;
    func_ov002_021d6870(*(int *)(data_ov002_022d016c + 0xd70),
                         *(int *)(data_ov002_022d016c + 0xd74) +
                             *(int *)(data_ov002_022d016c + 0xd78),
                         0, 0, 0, 0);
skip:
    *(int *)(data_ov002_022d016c + 0xd50) = 0;
}
