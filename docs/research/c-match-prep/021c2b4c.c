/* CAMPAIGN-PREP candidate for func_021c2b4c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned guards + count RMW + shift-down loop (021b91c4 copy)
 *   risk:       in-loop bound reload [row+0x14] + dual induction (&arr[i] SR vs &arr[i+1] computed) must align
 *   confidence: med
 */
/* func_ov002_021c2b4c: per-player list compaction. count = cf180[player];
 * if index>=count return 0; decrement count (store back); if index>=count-1
 * return 1; else shift arr[index..] down by 1 via func_ov002_021b91c4,
 * looping while index < *(row+0x14) (reloaded). arr at row+0x418. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf180[];
extern void func_ov002_021b91c4(int *dst, const int *src);

int func_ov002_021c2b4c(int player, int index) {
    int idx = (player & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf180 + idx);
    char *row;
    int *arr;
    if ((unsigned)index >= (unsigned)count)
        return 0;
    count = count - 1;
    *(int *)((char *)data_ov002_022cf180 + idx) = count;
    if ((unsigned)index >= (unsigned)count)
        return 1;
    row = (char *)data_ov002_022cf16c + idx;
    arr = (int *)(row + 0x418);
    for (; (unsigned)index < (unsigned)*(int *)(row + 0x14); index++)
        func_ov002_021b91c4(&arr[index], &arr[index + 1]);
    return 1;
}
